/* Set an object on a Storage object. */
Storage.prototype.setObject = function (key, value) {
  this.setItem(key, JSON.stringify(value));
};

/* Get an object from a Storage object. */
Storage.prototype.getObject = function (key) {
  var item = this.getItem(key);
  return JSON.parse(item);
};

/* Creates a new cache object with a fixed expiration time of one month. */
function LastFMCache() {
  /* Define one month in seconds. */
  const MONTH_IN_SECONDS = 60 * 60 * 24 * 30;

  /* Name for this cache. */
  var name = "lastfm";

  /* Create cache if it doesn't exist yet. */
  if (localStorage.getObject(name) == null) {
    localStorage.setObject(name, {});
  }

  /* Always return the one-month expiration time for any data. */
  this.getExpirationTime = function () {
    return MONTH_IN_SECONDS;
  };

  /* Check if this cache contains specific data. */
  this.contains = function (hash) {
    return (
      typeof localStorage.getObject(name)[hash] != "undefined" &&
      typeof localStorage.getObject(name)[hash].data != "undefined"
    );
  };

  /* Load data from this cache. */
  this.load = function (hash) {
    return localStorage.getObject(name)[hash].data;
  };

  /* Remove data from this cache. */
  this.remove = function (hash) {
    var object = localStorage.getObject(name);
    delete object[hash];
    localStorage.setObject(name, object);
  };

  /* Store data in this cache with a fixed one-month expiration time. */
  this.store = function (hash, data) {
    var object = localStorage.getObject(name);
    var time = Math.round(new Date().getTime() / 1000);

    object[hash] = {
      data: data,
      expiration: time + MONTH_IN_SECONDS,
    };

    localStorage.setObject(name, object);
  };

  /* Check if some specific data expired. */
  this.isExpired = function (hash) {
    var object = localStorage.getObject(name);
    var time = Math.round(new Date().getTime() / 1000);
    if (time > object[hash].expiration) {
      return true;
    }
    return false;
  };

  /* Clear this cache. */
  this.clear = function () {
    localStorage.setObject(name, {});
  };
}
export { LastFMCache };
