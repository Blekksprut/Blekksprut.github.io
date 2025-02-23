import { MusicBrainzApi } from "musicbrainz-api";

const config = {
  baseUrl: "https://musicbrainz.org",
  appName: "OurMusicStats",
  appVersion: "0.1.0",
  appMail: "danielle.martin358@gmail.com",
  proxy: {
    host: "localhost",
    port: 8888,
  },
  disableRateLimiting: false,
};

// Initialize the MusicBrainz API with the config object
const mbApi = new MusicBrainzApi(config);

export default mbApi;
