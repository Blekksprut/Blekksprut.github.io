<template>
  <div class="about">
    <h1>This is a music page hi</h1>
  </div>
  <AddMusic @refresh="loadTable" />
  <br />
  <MusicTable :albumListens="albumListens" @refresh="loadTable" />
</template>
<script>
import AddMusic from "../components/AddMusic.vue";
import MusicTable from "../components/MusicTable.vue";
import { refreshTable } from "@/utils/refreshTable";

export default {
  components: {
    AddMusic,
    MusicTable,
  },
  data() {
    return {
      albumListens: [],
    };
  },
  mounted() {
    this.loadTable();
  },
  methods: {
    async loadTable() {
      try {
        this.albumListens = await refreshTable(
          "http://localhost:3000/api/album_listens"
        );
      } catch (error) {
        console.error("Error loading table:", error);
      }
    },
  },
};
</script>
