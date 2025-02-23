<template>
  <v-form>
    <v-container>
      <v-row> </v-row>
      <v-row>
        <v-col cols="12">
          <!-- Search bar -->
          <v-text-field
            v-model="search"
            :loading="loading"
            :append-icon="search ? 'mdi-magnify' : 'mdi-magnify'"
            clear-icon="mdi-close-circle"
            label="Search for an album"
            type="text"
            variant="filled"
            clearable
            @keydown.enter.prevent="searchLastFM"
            @click:append="searchLastFM"
            @click:clear="clearSearch"
          ></v-text-field>
        </v-col>
      </v-row>

      <!-- Import a file -->
      <v-row>
        <v-col cols="12">
          <v-file-input v-model="importFile" label="File input"></v-file-input>
          <v-btn @click="importCSV">Import CSV</v-btn>
        </v-col>
      </v-row>
      <!-- Show file import in module table -->
      <template>
        <div class="pa-4 text-center">
          <v-dialog v-model="dialogImportFile" max-width="1000">
            <v-card prepend-icon="mdi-account" title="Import File">
              <v-data-table
                :headers="importFileHeaders"
                :items="importFileData"
                class="elevation-1"
              >
                <!-- Table Actions -->
                <template v-slot:item.actions="{ item }">
                  <v-icon class="me-2" size="small" @click="getAPIData(item)">
                    mdi-sync
                  </v-icon>
                  <v-icon class="me-2" size="small" @click="editImport(item)">
                    mdi-pencil
                  </v-icon>
                  <v-icon size="small" @click="deleteImportItem(item)">
                    mdi-delete
                  </v-icon>
                </template>
              </v-data-table>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn
                  text="Close"
                  variant="plain"
                  @click="dialogImportFile = false"
                ></v-btn>

                <v-btn
                  color="primary"
                  text="Import"
                  variant="tonal"
                  @click="saveImportFileItems"
                ></v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </div>
        <!-- Delete module -->
        <v-dialog v-model="dialogDelete" max-width="600px">
          <v-card>
            <v-card-title class="text-h5"
              >Are you sure you no longer wish to import this
              item?</v-card-title
            >
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue-darken-1" variant="text" @click="closeDelete"
                >Cancel</v-btn
              >
              <v-btn
                color="blue-darken-1"
                variant="text"
                @click="deleteItemConfirm"
                >OK</v-btn
              >
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </template>

      <!-- Edit import item module -->
      <v-dialog v-model="dialogEdit" max-width="700px">
        <v-card>
          <v-card-title>
            <span class="text-h5">{{ formEditTitle }}</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12" md="4" sm="6">
                  <v-text-field
                    v-model="editedImportItem.date"
                    label="Requested date"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4" sm="6">
                  <v-text-field
                    v-model="editedImportItem.person"
                    label="Requested by"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4" sm="6">
                  <v-text-field
                    v-model="editedImportItem.title"
                    label="Title"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4" sm="6">
                  <v-text-field
                    v-model="editedImportItem.artist"
                    label="Artist"
                  ></v-text-field>
                </v-col>

                <!-- <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.release_year"
                      label="Year"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.genre"
                      label="Genre"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.subgenre"
                      label="Subgenre"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.country"
                      label="Country"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.language"
                      label="Language"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.listeners"
                      label="Listeners"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.mbid"
                      label="mbid"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.image"
                      label="Image"
                    ></v-text-field>
                  </v-col> -->
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue-darken-1" variant="text" @click="closeEdit">
              Cancel
            </v-btn>
            <v-btn color="blue-darken-1" variant="text" @click="saveImportEdit">
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <!-- Displays search results -->
      <v-row v-if="showTable">
        <v-col cols="10">
          <v-data-table
            :headers="searchResultHeaders"
            hover
            :loading="loading"
            :items="albumSearchResults"
            class="elevation-3"
            hide-default-footer
            hide-default-header
            @click:row="selectItem"
          >
            <!-- Save a search result module -->
            <template v-slot:top>
              <v-dialog v-model="dialog" max-width="500px">
                <v-card>
                  <v-card-title>
                    <span class="text-h5">{{ formTitle }}</span>
                  </v-card-title>
                  <v-card-text>
                    <v-container>
                      <v-row>
                        <v-col cols="6">
                          <v-text-field
                            v-model="selectedItem.title"
                            label="Album Title"
                            readonly
                          ></v-text-field>
                        </v-col>
                        <v-col cols="6">
                          <v-text-field
                            v-model="selectedItem.artist"
                            label="Album Artist"
                            readonly
                          ></v-text-field>
                        </v-col>
                        <v-col cols="6">
                          <v-text-field
                            v-model="selectedItem.requestedBy"
                            label="Requested By"
                            :rules="rules"
                            required
                          ></v-text-field>
                        </v-col>
                        <v-col cols="6">
                          <v-text-field
                            v-model="selectedItem.requestedDate"
                            type="date"
                            :rules="rules"
                            required
                          ></v-text-field>
                        </v-col>
                        <v-col cols="6">
                          <v-text-field
                            v-model="selectedItem.mbid"
                            label="mbid"
                            readonly
                          ></v-text-field>
                        </v-col>
                        <v-col cols="6">
                          <v-btn
                            color="blue-darken-1"
                            variant="text"
                            @click="searchAlbumDetails"
                            >Search APIs</v-btn
                          >
                        </v-col>
                      </v-row>
                    </v-container>
                  </v-card-text>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue-darken-1" variant="text" @click="close">
                      Cancel
                    </v-btn>
                    <v-btn color="blue-darken-1" variant="text" @click="save">
                      Save
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </template>
            <!-- Displays the image within the search results -->
            <template v-slot:item.image="{ item }">
              <v-img :src="item.image" min-width="40" height="80"></v-img>
            </template>
          </v-data-table>
        </v-col>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
// Used for fetching album info from last.fm
import { LastFM } from "@/services/lastfm.api.js";
import { LastFMCache } from "@/services/lastfm.api.cache.js";

// Used for refreshing the table after adding a new album listen
import { refreshTable } from "../utils/refreshTable.js";

// Used for checking if value is null or undefined
//import isNil from "is-nil";
import { isNullOrEmpty } from "../utils/isNullOrEmpty.js";

// Used for checking if value is a string
import { isString } from "../utils/isString.js";

// Used for fetching additional album info from MusicBrainz
import mbApi from "@/services/musicbrainz.api.js";

// Used for date formatting
import dayjs from "dayjs";
import customParseFormat from "dayjs/plugin/customParseFormat";
import duration from "dayjs/plugin/duration";
dayjs.extend(customParseFormat);
dayjs.extend(duration);

// Used for converting language ISO codes to language names
import isoLanguageConverter from "iso-language-converter/index.es5";

// Used for Importing CSV file
import Papa from "papaparse";

// Create a LastFM instance
const lastfm = new LastFM({});

export default {
  props: ["albumListens"],
  data(vm) {
    return {
      search: "",
      loading: false,
      showTable: false,
      albumSearchResults: [],
      dialogImportFile: false,
      dialogDelete: false,
      dialogEdit: false,
      defaultItem: {
        requested_date: null,
        requested_by: "",
        title: "",
        artist: "",
        release_year: "",
        genre: "",
        subgenre: "",
        country: "",
        language: "",
        listeners: "",
        mbid: "",
        image: "",
        duration: null,
        tracks: null,
      },
      searchResultHeaders: [
        { text: "Album", value: "title" },
        { text: "Artist", value: "artist" },
        { text: "mbid", value: "mbid" },
        { text: "Image", value: "image" },
      ],
      importFile: null,
      importFileData: [],
      importFileHeaders: [
        { title: "Requested Date", key: "date" },
        { title: "Requested By", key: "person" },
        { title: "Album", key: "title" },
        { title: "Artist", key: "artist" },
        { title: "Actions", key: "actions", sortable: false },
      ],
      defaultImportItem: {
        title: "",
        artist: "",
        person: "",
        date: "",
      },
      editedImportIndex: -1,
      editedImportItem: {
        title: "",
        artist: "",
        person: "",
        date: "",
      },
      dialog: false,
      formTitle: "Enter Album Details",
      formEditTitle: "Edit Details",
      selectedIndex: -1,
      selectedItem: {
        title: "",
        artist: "",
        requestedBy: "",
        requestedDate: null,
        mbid: "",
      },
      listenerData: {
        requestedBy: "",
        requestedDate: null,
      },
      albumData: {
        title: "",
        artist: "",
        mbid: "",
        image: "",
        releaseDate: "",
        country: "",
        language: "",
        tags: [],
        listeners: "",
        duration: null,
        tracks: null,
      },
      defaultListenerData: {
        requestedBy: "",
        requestedDate: null,
      },
      defaultAlbumData: {
        title: "",
        artist: "",
        mbid: "",
        image: "",
        releaseDate: "",
        country: "",
        language: "",
        tags: [],
        listeners: "",
        duration: null,
        tracks: null,
      },
      rules: [
        (value) => {
          if (value) return true;
          return "Required";
        },
      ],
    };
  },

  async mounted() {
    lastfm.cache = new LastFMCache();
  },

  watch: {
    // Watch for changes selected item dialog and close it if the value is false
    dialog(val) {
      val || this.close();
    },
    dialogEdit(val) {
      val || this.closeEdit();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  methods: {
    //refreshes the album listens table
    async loadTable() {
      this.$emit("refresh");
    },

    // Import CSV File
    async importCSV(event) {
      console.log("Importing CSV file");

      // Get the selected file from the file input
      const file = this.importFile;
      if (!file) {
        console.error("No file selected");
        return;
      }

      // Parse the file
      Papa.parse(file, {
        header: true, // Set to true if the CSV has headers
        skipEmptyLines: true,
        complete: (result) => {
          result.data.forEach((item) => {
            item.date = dayjs(item.date, [
              "DD-MM-YYYY",
              "DD/MM/YYYY",
              "D/M/YYYY",
              "D-M-YYYY",
            ]).format("YYYY-MM-DD");
          });
          console.log("Parsed CSV data:", result.data);
          this.importFileData = result.data;
          this.dialogImportFile = true;
        },
        error: (err) => {
          console.error("Error parsing CSV:", err);
        },
      });
    },

    // get data
    async getAPIData(item) {
      console.log("Getting API data for item:", item);
    },

    // Delete import item
    deleteImportItem(item) {
      console.log("Deleting import item:", item);
      this.editedImportIndex = this.importFileData.indexOf(item);
      this.editedImportItem = Object.assign({}, item);
      this.dialogDelete = true;
    },
    deleteItemConfirm() {
      this.importFileData.splice(this.editedImportIndex, 1);
      this.closeDelete();
    },
    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultImportItem);
        this.editedImportIndex = -1;
      });
    },

    // Edit import item
    editImport(item) {
      console.log("Editing import item:", item);
      this.editedImportIndex = this.importFileData.indexOf(item);
      this.editedImportItem = Object.assign({}, item);
      this.dialogEdit = true;
    },
    closeEdit() {
      this.dialogEdit = false;
      this.$nextTick(() => {
        this.editedImportItem = Object.assign({}, this.defaultImportItem);
        this.editedImportIndex = -1;
      });
    },
    saveImportEdit() {
      if (this.editedImportIndex > -1) {
        Object.assign(
          this.importFileData[this.editedImportIndex],
          this.editedImportItem
        );
        this.closeEdit();
      }
    },

    // Toggle visibility of search results
    toggleTableOff() {
      this.showTable = false;
    },

    // Clear the search input and search results
    clearSearch() {
      this.search = "";
      this.loading = false;
      this.toggleTableOff();
    },

    // Displays selected item details from the search results in the dialog
    selectItem(event, row) {
      this.selectedIndex = this.albumSearchResults.indexOf(row.item);
      this.selectedItem = Object.assign({}, row.item);
      this.dialog = true;
    },

    // Close the selected item dialog
    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.selectedItem = Object.assign({}, this.defaultItem);
        this.selectedIndex = -1;
      });
    },

    // Save the import file listens to the database
    async saveImportFileItems() {
      console.log(
        "Get album details for import file items and save to the database"
      );
      for (let i = 0; i < this.importFileData.length; i++) {
        console.log("the current import item: ", i);
        console.log(this.importFileData[i]);
        this.selectedItem.requestedDate = this.importFileData[i].date;
        this.selectedItem.requestedBy = this.importFileData[i].person;
        this.selectedItem.title = this.importFileData[i].title;
        this.selectedItem.artist = this.importFileData[i].artist;
        console.log("the current selected item: ", this.selectedItem);
        await this.save();
      }
      this.dialogImportFile = false;
    },

    // Get album details and save the selected item details to the database
    async save() {
      this.dialog = false;

      // Wait for setCurrentAlbum() to complete and assign its result to currentAlbum
      let completeAlbum = await this.setCurrentAlbum()
        .then((currentAlbum) => this.searchAlbumDetails(currentAlbum))
        .then((completeAlbum) => this.saveAlbumToDB(completeAlbum));

      await this.loadTable();

      this.$nextTick(async () => {
        this.selectedItem = Object.assign({}, this.defaultItem);
        this.selectedIndex = -1;
      });
    },

    // A hash for caching based on the query and type
    generateCacheKey(query, type) {
      var cacheKey = "";
      switch (type) {
        case "search":
          cacheKey = `albumSearchResults_${query}`;
          break;
        case "albumDetails":
          cacheKey = `albumDetails_${query}`;
          break;
      }
      return cacheKey;
    },

    // Search for albums to display in search results using the Last.fm API
    async searchLastFM() {
      this.showTable = false;
      this.loading = true;

      // Generate a search cache key
      //const cacheKey = this.generateCacheKey(this.search, "search");

      // Check if the search data is already cached
      // if (
      //   lastfm.cache &&
      //   lastfm.cache.contains(cacheKey) &&
      //   !lastfm.cache.isExpired(cacheKey)
      // ) {
      //   console.log("Loading from cache...");
      //   // Load cached search results
      //   this.albumSearchResults = lastfm.cache.load(cacheKey);
      //   this.showTable = true;
      //   this.loading = false;
      //   return;
      // }

      // Search LastFM for albums
      await lastfm.album.search(
        {
          limit: 5,
          album: this.search,
        },
        {
          success: (data) => {
            // Load the search results from the API
            console.log("Loading search results from API:", data);
            this.albumSearchResults = data.results.albummatches.album.map(
              (album) => ({
                title: album.name,
                artist: album.artist,
                image: album.image[2]["#text"],
                mbid: album.mbid,
              })
            );
            // Store the search results in the cache
            // lastfm.cache.store(
            //   cacheKey,
            //   this.albumSearchResults,
            //   lastfm.cache.getExpirationTime({ method: "album.search" })
            // );

            this.loading = false;
            this.showTable = true;
          },
          error: function (code, message) {
            console.error("Error:", code, message);
            this.loading = false;
          },
        }
      );
    },

    async setCurrentAlbum() {
      const currentAlbum = new Promise((resolve) => {
        let blankAlbumPromise = this.defaultAlbumData;
        resolve(blankAlbumPromise);
      });

      const currentAlbumPromise = new Promise((resolve) => {
        currentAlbum.title = this.selectedItem.title;
        currentAlbum.artist = this.selectedItem.artist;
        if (this.selectedItem.mbid) {
          currentAlbum.mbid = this.selectedItem.mbid;
        } else {
          currentAlbum.mbid = "";
        }
        resolve({
          title: currentAlbum.title,
          artist: currentAlbum.artist,
          mbid: currentAlbum.mbid,
        });
      });

      const currentListenerPromise = new Promise((resolve) => {
        this.listenerData.requestedBy = this.selectedItem.requestedBy;
        this.listenerData.requestedDate = this.selectedItem.requestedDate;
        resolve({
          requestedBy: this.listenerData.requestedBy,
          requestedDate: this.listenerData.requestedDate,
        });
      });

      return Promise.all([currentAlbumPromise, currentListenerPromise]).then(
        (data) => {
          console.log("Current set listener:", data[1]);
          console.log("Current set album:", data[0]);
          return data[0];
        }
      );
      // return new Promise((resolve) => {
      //   let currentAlbum = this.defaultAlbumData;
      //   currentAlbum.title = this.selectedItem.title;
      //   currentAlbum.artist = this.selectedItem.artist;
      //   if (this.selectedItem.mbid) {
      //     currentAlbum.mbid = this.selectedItem.mbid;
      //   }
      //   this.listenerData.requestedBy = this.selectedItem.requestedBy;
      //   this.listenerData.requestedDate = this.selectedItem.requestedDate;
      //   console.log("Current set listener:", this.listenerData);
      //   console.log("Current set album:", currentAlbum);
      //   resolve(currentAlbum);
    },

    // console.log("Current album before:", this.albumData);

    // this.albumData = this.defaultAlbumData;
    // console.log("Current album after:", this.albumData);

    // this.albumData.title = this.selectedItem.title;
    // this.albumData.artist = this.selectedItem.artist;
    // if (this.selectedItem.mbid) {
    //   this.albumData.mbid = this.selectedItem.mbid;
    // }
    // this.listenerData.requestedBy = this.selectedItem.requestedBy;
    // this.listenerData.requestedDate = this.selectedItem.requestedDate;
    // console.log("Current listener:", this.listenerData);

    // Search for selected album details
    async searchAlbumDetails(currentAlbum) {
      console.log("Current album before search help me lorddd:", currentAlbum);
      // // Generate a cache key for the album details
      // const cacheKey = this.generateCacheKey(
      //   this.selectedItem.artist + this.selectedItem.title,
      //   "albumDetails"
      // );

      // // Check if the album details are already cached
      // if (
      //   lastfm.cache &&
      //   lastfm.cache.contains(cacheKey) &&
      //   !lastfm.cache.isExpired(cacheKey)
      // ) {
      //   // Load cached album details
      //   console.log("Loading album details from cache...");
      //   this.albumData = lastfm.cache.load(cacheKey);
      //   console.log(this.albumData);
      //   return;
      // }

      // Load album details from LastFM API
      let completeAlbum = await this.searchAlbumDetailsFromLastFM(currentAlbum)
        .then((lastFMData) => this.searchAlbumOnMB(lastFMData))
        .then((data) => {
          console.log("data", data);
          console.log("lastFMAlbumDetails", data[0].lastFMData);
          console.log("mbid data", data[0].mbApiResponse);
          console.log("artist data", data[1]);
          return {
            mbidSearchData: data[0].mbApiResponse,
            lastFMData: data[0].lastFMData,
            mbArtistData: data[1],
          };
        })
        .then((data) => {
          let completeAlbumWIP = {};
          console.log("mbsearchResponseData", data.mbidSearchData);
          console.log("lastfmData", data.lastFMData);
          console.log("mbArtistData", data.mbArtistData);
          if (data.lastFMData) {
            completeAlbumWIP.title = data.lastFMData.album.name;
            completeAlbumWIP.artist = data.lastFMData.album.artist;
            completeAlbumWIP.image = isNullOrEmpty(
              data.lastFMData.album.image[2]["#text"]
            )
              ? "--"
              : data.lastFMData.album.image[2]["#text"];
            completeAlbumWIP.playcount = isNullOrEmpty(
              data.lastFMData.album.playcount
            )
              ? 0
              : data.lastFMData.album.playcount;
            completeAlbumWIP.listeners = isNullOrEmpty(
              data.lastFMData.album.listeners
            )
              ? 0
              : data.lastFMData.album.listeners;
            completeAlbumWIP.mbid = isNullOrEmpty(data.lastFMData.album.mbid)
              ? "--"
              : data.lastFMData.album.mbid;
            completeAlbumWIP.tags = data.lastFMData.album.tags?.tag?.length
              ? data.lastFMData.album.tags.tag.map((tag) => tag.name)
              : "--";

            // Check if the album has tracks
            if (data.lastFMData.album.tracks) {
              // Calculate the duration of the album by accumulating the duration of each track
              // Can't use isNil here because api track duration can be a string
              let durationSeconds = 0;
              if (data.lastFMData.album.tracks.track.length > 1) {
                durationSeconds = data.lastFMData.album.tracks.track.reduce(
                  (acc, track) => {
                    let duration = parseInt(track.duration, 10);
                    // Check if duration is a valid number
                    return acc + (isNaN(duration) ? 0 : duration);
                  },
                  0
                );
              } else {
                durationSeconds = isNaN(
                  data.lastFMData.album.tracks.track.duration
                )
                  ? 0
                  : parseInt(data.lastFMData.album.tracks.track.duration, 10);
              }
              console.log("Duration in seconds: ", durationSeconds);

              // If not 0 then format the duration to HH:mm:ss
              if (durationSeconds != 0) {
                completeAlbumWIP.duration = dayjs
                  .duration(durationSeconds, "s")
                  .format("HH:mm:ss");
              } else {
                completeAlbumWIP.duration = "--:--:--";
              }
              // Get number of tracks
              completeAlbumWIP.tracks = isNaN(
                data.lastFMData.album.tracks.track.length
              )
                ? 1
                : data.lastFMData.album.tracks.track.length;
            }
          }

          // Set release date
          if (!isNullOrEmpty(data.mbidSearchData)) {
            // Set release date
            completeAlbumWIP.releaseDate = isNullOrEmpty(
              data.mbidSearchData.date
            )
              ? 0
              : data.mbidSearchData.date;

            // Set language
            completeAlbumWIP.language = isNullOrEmpty(
              data.mbidSearchData["text-representation"].language
            )
              ? "--"
              : isoLanguageConverter(
                  data.mbidSearchData["text-representation"].language
                );
          } else {
            completeAlbumWIP.releaseDate = 0;
            completeAlbumWIP.language = "--";
          }

          // Set country
          if (isNullOrEmpty(data.mbArtistData)) {
            completeAlbumWIP.country = isNullOrEmpty(
              data.mbArtistData.artists[0].area.name
            )
              ? "--"
              : data.mbArtistData.artists[0].area.name;
          } else {
            completeAlbumWIP.country = "--";
          }
          console.log("complete album wip: ", completeAlbumWIP);

          return completeAlbumWIP;
        });

      //         console.log("Current searched album:", completeAlbum);

      //         //// Store the results in the cache
      //         // lastfm.cache.store(
      //         //   cacheKey,
      //         //   this.albumData,
      //         //   lastfm.cache.getExpirationTime({ method: "album.getInfo" })
      //         // );
      //         resolve(completeAlbum);
      //       },
      //       error: function (code, message) {
      //         console.error("Error:", code, message);
      //         reject(new Error(`LastFM API Error: ${code} - ${message}`));
      //         // put error message here
      //         this.loading = false;
      //       },
      //     }
      //   );
      // });
      console.log("complete album from search: ", completeAlbum);
      return completeAlbum;
    },

    async searchAlbumDetailsFromLastFM(currentAlbum) {
      return new Promise((resolve, reject) => {
        console.log("searchin lastfm", currentAlbum);
        lastfm.album.getInfo(
          {
            artist: currentAlbum.artist,
            album: currentAlbum.title,
          },
          {
            success: async (data) => {
              resolve(data);
              console.log("Loading album details from LastFM API...", data);
            },
            error: function (code, message) {
              console.error("Error:", code, message);
              reject(new Error(`LastFM API Error: ${code} - ${message}`));
              // put error message here
              this.loading = false;
            },
          }
        );
      });
    },

    //Search for selected album by MBID using the MusicBrainz API
    async searchAlbumOnMB(lastFMData) {
      const mbNoIDPromise = new Promise((resolve, reject) => {
        resolve({ mbApiResponse: {}, lastFMData: lastFMData });
      });
      const mbNoArtistPromise = new Promise((resolve, reject) => {
        resolve({ mbApiResponse: {}, lastFMData: lastFMData });
      });

      if (
        (!isNullOrEmpty(lastFMData.album.artist) &&
          lastFMData.album.artist != "Various Artists" &&
          lastFMData.album.artist != "Various") ||
        !isNullOrEmpty(lastFMData.album.mbid)
      ) {
        // Only artist is available
        if (
          !isNullOrEmpty(lastFMData.album.artist) &&
          lastFMData.album.artist != "Various Artists" &&
          lastFMData.album.artist != "Various" &&
          isNullOrEmpty(lastFMData.album.mbid)
        ) {
          const mbArtistPromise = new Promise((resolve, reject) => {
            mbApi
              .search("artist", { query: lastFMData.album.artist })
              .then((data) => {
                console.log("Loading just artist data from MB API...", data);
                resolve(data);
              });
          });
          return Promise.all([mbNoIDPromise, mbArtistPromise]);
        }

        // Only mbid is available
        if (
          isNullOrEmpty(lastFMData.album.artist) &&
          lastFMData.album.artist == "Various Artists" &&
          lastFMData.album.artist == "Various" &&
          !isNullOrEmpty(lastFMData.album.mbid)
        ) {
          const mbIDPromise = new Promise((resolve, reject) => {
            mbApi.lookup("release", lastFMData.album.mbid).then((data) => {
              console.log("Loading just mbid data from MB API...", data);
              resolve({ mbApiResponse: data, lastFMData: lastFMData });
            });
          });
          return Promise.all([mbIDPromise, mbNoArtistPromise]);
        }

        // Both artist and mbid are available
        const mbArtistPromise = new Promise((resolve, reject) => {
          console.log("Searching artist on MB", lastFMData.album.artist);
          mbApi
            .search("artist", { query: lastFMData.album.artist })
            .then((data) => {
              console.log("Loading artist data from MB API aaaand...", data);
              resolve(data);
            });
        });
        const mbIDPromise = new Promise((resolve, reject) => {
          console.log("Searching album mbid", lastFMData.album.mbid);
          mbApi.lookup("release", lastFMData.album.mbid).then((data) => {
            console.log("Loading mbid data from MB API also me...", data);
            resolve({ mbApiResponse: data, lastFMData: lastFMData });
          });
        });
        return Promise.all([mbIDPromise, mbArtistPromise]);
      }

      // No artist or mbid available
      return Promise.all([mbNoIDPromise, mbNoArtistPromise]);
    },

    async searchAlbumArtistonMB(artist) {
      return new Promise((resolve, reject) => {
        console.log("Loading artist details from MB API...", artist);

        mbApi
          .search("artist", { query: artist })
          .then((data) => {
            console.log("Artist data from MB API...", data);
            resolve(data); // Resolve with the API data
          })
          .catch((error) => {
            console.error("Error:", error);
            reject(
              new Error(`MusicBrainz API Error: ${error.message || error}`)
            );
          });
      });
    },

    // async searchAlbumArtistonMB(artist) {
    //   return new Promise((resolve, reject) => {
    //     console.log("Loading artist details from MB API...", artist);
    //     //return;
    //     mbApi.search(
    //       "artist",
    //       {
    //         query: artist,
    //       },
    //       {
    //         success: async (data) => {
    //           console.log("Artist data from MB API...", data);
    //           resolve(data);
    //         },
    //         error: function (code, message) {
    //           console.error("Error:", code, message);
    //           reject(new Error(`MusicBrainz API Error: ${code} - ${message}`));
    //           // put error message here
    //           this.loading = false;
    //         },
    //       }
    //     );
    //   });
    // },

    // Save album listen to the database
    async saveAlbumToDB(album) {
      try {
        console.log("test the parameters");
        console.log(this.listenerData);
        console.log(album);
        const title = album.title;
        const artist = album.artist;
        const image = album.image;
        const requestedBy = this.listenerData.requestedBy;
        const requestedDate = dayjs(this.listenerData.requestedDate, [
          "DD-MM-YYYY",
          "YYYY-MM-DD",
          "DD/MM/YYYY",
          "YYYY/MM/DD",
        ]).format("YYYY-MM-DD");
        const mbid = album.mbid;
        const releaseYear = isNullOrEmpty(album.releaseDate)
          ? 0
          : dayjs(album.releaseDate, [
              "YY",
              "YYYY",
              "DD-MM-YYYY",
              "YYYY-MM-DD",
              "DD/MM/YYYY",
              "YYYY/MM/DD",
            ]).format("YYYY");
        const country = album.country;
        const language = album.language;
        const genre = album.tags[0];
        const subgenre = album.tags[1];
        const listeners = album.listeners;
        const duration = album.duration;
        const tracks = album.tracks;

        const response = await fetch(
          "http://localhost:3000/api/addNewListenEntry",
          {
            // Ensure the correct backend port is used
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              requestedBy,
              requestedDate,
              title,
              artist,
              releaseYear,
              genre,
              subgenre,
              country,
              image,
              language,
              listeners,
              mbid,
              duration,
              tracks,
            }),
          }
        );

        const result = await response.text();
        await this.toggleTableOff();
        console.log(result); // "Data saved"

        //reset the arrays to default
        this.listenerData = this.defaultListenerData;
        console.log("Listener data reset to default:", this.listenerData);
      } catch (error) {
        console.error("Error saving data:", error);
      }
    },
  },
};
</script>
<style scoped></style>
