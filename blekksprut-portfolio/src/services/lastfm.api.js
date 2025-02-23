/*
 *
 * Copyright (c) 2008-2010, Felix Bruns <felixbruns@web.de>
 *
 */
import md5Functions from "@/services/lastfm.api.md5.js";

function LastFM(options) {
  /* Set default values for required options. */
  var apiKey = import.meta.env.VITE_LASTFM_API_ID;
  var apiSecret = import.meta.env.VITE_LASTFM_API_SECRET;
  var apiUrl = "http://ws.audioscrobbler.com/2.0/";
  var cache = options.cache || undefined;

  /* Set API key. */
  this.setApiKey = function (_apiKey) {
    apiKey = _apiKey;
  };

  /* Set API key. */
  this.setApiSecret = function (_apiSecret) {
    apiSecret = _apiSecret;
  };

  /* Set API URL. */
  this.setApiUrl = function (_apiUrl) {
    apiUrl = _apiUrl;
  };

  /* Set cache. */
  this.setCache = function (_cache) {
    cache = _cache;
  };

  /* Set the JSONP callback identifier counter. This is used to ensure the callbacks are unique */
  var jsonpCounter = 0;

  /* Internal call (GET only). */
  var internalCall = async function (params, callbacks) {
    // Ensure the format is set to JSON
    params.format = "json";

    const urlParams = new URLSearchParams(params).toString();
    const apiUrlWithParams = `${apiUrl}?${urlParams}`;

    try {
      // Make the GET request
      const response = await fetch(apiUrlWithParams, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          "User-Agent": "OurMusicStats/1.0 (danielle.martin358@gmail.com)",
        },
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      // Parse JSON response
      const data = await response.json();

      // Call the success callback if it exists
      if (typeof callbacks.success !== "undefined") {
        callbacks.success(data);
      }
    } catch (error) {
      // Call the error callback if there's an issue
      if (typeof callbacks.error !== "undefined") {
        callbacks.error(error.message);
      }
    }
  };

  /* Normal method call. */
  var call = function (method, params, callbacks) {
    /* Set default values. */
    params = params || {};
    callbacks = callbacks || {};

    /* Add parameters. */
    params.method = method;
    params.api_key = apiKey;

    /* Call method (GET only). */
    internalCall(params, callbacks);
  };

  /* Internal call (POST, GET). */
  var internalCall = function (params, callbacks, requestMethod) {
    if (requestMethod != "POST") {
      /* Cross-domain GET request (JSONP). */
      /* Get JSONP callback name. */
      var jsonp = "jsonp" + new Date().getTime() + jsonpCounter;

      /* Update the unique JSONP callback counter */
      jsonpCounter += 1;

      /* Calculate cache hash. */
      var hash = auth.getApiSignature(params);

      /* Check cache. */
      if (
        typeof cache != "undefined" &&
        cache.contains(hash) &&
        !cache.isExpired(hash)
      ) {
        if (typeof callbacks.success != "undefined") {
          callbacks.success(cache.load(hash));
        }
        return;
      }

      /* Set callback name and response format. */
      params.callback = jsonp;
      params.format = "json";

      /* Create JSONP callback function. */
      window[jsonp] = function (data) {
        /* Is a cache available?. */
        if (typeof cache != "undefined") {
          var expiration = cache.getExpirationTime(params);

          if (expiration > 0) {
            cache.store(hash, data, expiration);
          }
        }

        /* Call user callback. */
        if (typeof data.error != "undefined") {
          if (typeof callbacks.error != "undefined") {
            callbacks.error(data.error, data.message);
          }
        } else if (typeof callbacks.success != "undefined") {
          callbacks.success(data);
        }

        /* Garbage collect. */
        window[jsonp] = undefined;

        try {
          delete window[jsonp];
        } catch (e) {
          /* Nothing. */
        }

        /* Remove script element. */
        if (head) {
          head.removeChild(script);
        }
      };

      /* Create script element to load JSON data. */
      var head = document.getElementsByTagName("head")[0];
      var script = document.createElement("script");

      /* Build parameter string. */
      var array = [];

      for (var param in params) {
        array.push(
          encodeURIComponent(param) + "=" + encodeURIComponent(params[param])
        );
      }

      /* Set script source. */
      script.src = apiUrl + "?" + array.join("&").replace(/%20/g, "+");

      /* Append script element. */
      head.appendChild(script);
    }
  };

  // /* Normal method call. */
  var call = function (method, params, callbacks, requestMethod) {
    /* Set default values. */
    params = params || {};
    callbacks = callbacks || {};
    requestMethod = requestMethod || "GET";

    /* Add parameters. */
    params.method = method;
    params.api_key = apiKey;

    /* Call method. */
    internalCall(params, callbacks, requestMethod);
  };

  /* Signed method call. */
  var signedCall = function (
    method,
    params,
    session,
    callbacks,
    requestMethod
  ) {
    /* Set default values. */
    params = params || {};
    callbacks = callbacks || {};
    requestMethod = requestMethod || "GET";

    /* Add parameters. */
    params.method = method;
    params.api_key = apiKey;

    /* Add session key. */
    if (session && typeof session.key != "undefined") {
      params.sk = session.key;
    }

    /* Get API signature. */
    params.api_sig = auth.getApiSignature(params);

    /* Call method. */
    internalCall(params, callbacks, requestMethod);
  };

  /* Album methods. */
  this.album = {
    getInfo: function (params, callbacks) {
      call("album.getInfo", params, callbacks);
    },

    getTags: function (params, session, callbacks) {
      signedCall("album.getTags", params, session, callbacks);
    },

    getTopTags: function (params, callbacks) {
      signedCall("album.getTopTags", params, callbacks);
    },

    search: function (params, callbacks) {
      call("album.search", params, callbacks);
    },
  };

  /* Artist methods. */
  this.artist = {
    getCorrection: function (params, callbacks) {
      call("artist.getCorrection", params, callbacks);
    },

    getImages: function (params, callbacks) {
      call("artist.getImages", params, callbacks);
    },

    getInfo: function (params, callbacks) {
      call("artist.getInfo", params, callbacks);
    },

    getSimilar: function (params, callbacks) {
      call("artist.getSimilar", params, callbacks);
    },

    getTags: function (params, session, callbacks) {
      signedCall("artist.getTags", params, session, callbacks);
    },

    getTopAlbums: function (params, callbacks) {
      call("artist.getTopAlbums", params, callbacks);
    },

    getTopFans: function (params, callbacks) {
      call("artist.getTopFans", params, callbacks);
    },

    getTopTags: function (params, callbacks) {
      call("artist.getTopTags", params, callbacks);
    },

    getTopTracks: function (params, callbacks) {
      call("artist.getTopTracks", params, callbacks);
    },

    search: function (params, callbacks) {
      call("artist.search", params, callbacks);
    },
  };

  /* Chart methods. */
  this.chart = {
    getHypedArtists: function (params, session, callbacks) {
      call("chart.getHypedArtists", params, callbacks);
    },

    getHypedTracks: function (params, session, callbacks) {
      call("chart.getHypedTracks", params, callbacks);
    },

    getLovedTracks: function (params, session, callbacks) {
      call("chart.getLovedTracks", params, callbacks);
    },

    getTopArtists: function (params, session, callbacks) {
      call("chart.getTopArtists", params, callbacks);
    },

    getTopTags: function (params, session, callbacks) {
      call("chart.getTopTags", params, callbacks);
    },

    getTopTracks: function (params, session, callbacks) {
      call("chart.getTopTracks", params, callbacks);
    },
  };

  /* Track methods. */
  this.track = {
    getCorrection: function (params, callbacks) {
      call("track.getCorrection", params, callbacks);
    },
    getInfo: function (params, callbacks) {
      call("track.getInfo", params, callbacks);
    },

    getSimilar: function (params, callbacks) {
      call("track.getSimilar", params, callbacks);
    },

    getTags: function (params, session, callbacks) {
      signedCall("track.getTags", params, session, callbacks);
    },

    getTopFans: function (params, callbacks) {
      call("track.getTopFans", params, callbacks);
    },

    getTopTags: function (params, callbacks) {
      call("track.getTopTags", params, callbacks);
    },

    search: function (params, callbacks) {
      call("track.search", params, callbacks);
    },
  };

  /* Private auth methods. */
  var auth = {
    getApiSignature: function (params) {
      var keys = Object.keys(params);
      var string = "";

      keys.sort();
      keys.forEach(function (key) {
        string += key + params[key];
      });

      string += apiSecret;

      /* Needs lastfm.api.md5.js. */
      return md5Functions.md5(string);
    },
  };
}

export { LastFM };
