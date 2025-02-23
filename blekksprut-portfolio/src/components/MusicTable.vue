<template>
  <v-data-table :headers="headers" :items="albumListens" item-value="listen_id">
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Albums</v-toolbar-title>
        <v-icon style="position: absolute" @click="loadTable">
          mdi-refresh
        </v-icon>
        <v-spacer></v-spacer>
        <!-- Edit item module -->
        <v-dialog v-model="dialog" max-width="700px">
          <template v-slot:activator="{ props }"> </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.requested_date"
                      label="Requested date"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.requested_by"
                      label="Requested by"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.title"
                      label="Title"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.artist"
                      label="Artist"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
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
                      v-model="editedItem.tracks"
                      label="tracks"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4" sm="6">
                    <v-text-field
                      v-model="editedItem.duration"
                      label="Duration"
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

        <!-- Delete module -->
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5"
              >Are you sure you want to delete this item?</v-card-title
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
      </v-toolbar>
    </template>
    <template v-slot:item.image="{ item }">
      <v-img :src="item.image" min-width="40" height="80"></v-img>
    </template>
    <!-- Table Actions -->
    <template v-slot:item.actions="{ item }">
      <v-icon class="me-2" size="small" @click="editItem(item)">
        mdi-pencil
      </v-icon>
      <v-icon size="small" @click="deleteItem(item)"> mdi-delete </v-icon>
    </template>
  </v-data-table>
</template>

<script>
import { refreshTable } from "../utils/refreshTable.js";

//Used for date formatting
import dayjs from "dayjs";
import customParseFormat from "dayjs/plugin/customParseFormat";
import duration from "dayjs/plugin/duration";
dayjs.extend(customParseFormat);
dayjs.extend(duration);

// Used for checking if value is null or undefined
import { isNullOrEmpty } from "../utils/isNullOrEmpty.js";

// Used for fetching additional album info from MusicBrainz
import mbApi from "@/services/musicbrainz.api.js";
import { LastFM } from "@/services/lastfm.api.js";
// Create a LastFM instance
const lastfm = new LastFM({});

export default {
  props: ["albumListens"],
  data: () => ({
    dialog: false,
    dialogDelete: false,
    formTitle: "Edit Item",
    loading: false,
    // add it back if duplicate error appears again
    // { id: "listen_id", title: "ID", key: "listen_id" },
    headers: [
      {
        title: "Requested Date",
        align: "start",
        key: "requested_date",
      },
      { title: "Requested By", key: "requested_by" },
      { title: "Album Title", key: "title" },
      { title: "Artist", key: "artist" },
      { title: "Year", key: "release_year" },
      { title: "Genre", key: "genre" },
      { title: "Subgenre", key: "subgenre" },
      { title: "Country", key: "country" },
      { title: "Language", key: "language" },
      { title: "Listeners", key: "listeners" },
      { title: "No. of Tracks", key: "tracks" },
      { title: "Album Duration", key: "duration" },
      { title: "MBID", key: "mbid" },
      { title: "Image", key: "image" },
      { title: "Actions", key: "actions", sortable: false },
    ],
    editedIndex: -1,
    editedItem: {
      requested_date: "",
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
    defaultItem: {
      requested_date: "",
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
  }),

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  // created: function () {

  // },

  methods: {
    async loadTable() {
      this.$emit("refresh");
    },

    editItem(item) {
      console.log("editItem", item);
      if (!isNullOrEmpty(item.mbid)) {
        mbApi.lookup("release", item.mbid).then((data) => {
          console.log(
            "mbid release event date",
            data["release-events"][0].date
          );
          console.log("mbid date", data.date);
        });
      }
      this.editedIndex = this.albumListens.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      console.log("deleteItem", item);
      this.editedIndex = this.albumListens.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    async deleteItemConfirm() {
      console.log("deleting item", this.editedIndex);
      try {
        console.log("deleting data", this.editedItem);
        const listenID = this.editedItem.listen_id;

        const response = await fetch("http://localhost:3000/api/deleteListen", {
          // Ensure the correct backend port is used
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            listenID,
          }),
        });

        const result = await response.text();
        console.log(result);
        this.loadTable();
        this.closeDelete();
      } catch (error) {
        console.error("Error deleting data:", error);
        this.closeDelete();
      }
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    async save() {
      if (this.editedIndex > -1) {
        // If editedIndex is greater than -1, update the database entry
        try {
          console.log("Saving data", this.editedItem);
          const albumID = this.editedItem.id;
          const listenID = this.editedItem.listen_id;
          const requestedBy = this.editedItem.requested_by;
          const requestedDate = dayjs(this.editedItem.requested_date, [
            "DD-MM-YYYY",
            "YYYY-MM-DD",
            "DD/MM/YYYY",
            "YYYY/MM/DD",
          ]).format("YYYY-MM-DD");
          const title = this.editedItem.title;
          const artist = this.editedItem.artist;
          const releaseYear = this.editedItem.release_year;
          const genre = this.editedItem.genre;
          const subgenre = this.editedItem.subgenre;
          const country = this.editedItem.country;
          const image = this.editedItem.image;
          const language = this.editedItem.language;
          const listeners = this.editedItem.listeners;
          const mbid = this.editedItem.mbid;
          const duration = this.editedItem.duration;
          const tracks = this.editedItem.tracks;

          const response = await fetch("http://localhost:3000/api/edit", {
            // Ensure the correct backend port is used
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              albumID,
              listenID,
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
          });

          const result = await response.text();
          console.log(result);
          this.loadTable();
          this.close();
        } catch (error) {
          console.error("Error saving data:", error);
          this.close();
        }
      }
    },
  },
};
</script>
