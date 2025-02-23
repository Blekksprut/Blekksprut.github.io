import express from "express";
import sqlite3 from "sqlite3";
import { open } from "sqlite";
import cors from "cors"; // Import the CORS middleware

const app = express();
const PORT = 3000;

// Enable CORS for requests from http://localhost:5173
app.use(
  cors({
    origin: "http://localhost:5173",
  })
);

app.use(express.json());

// Set up the SQLite database
(async () => {
  const db = await open({
    filename: "./database.db",
    driver: sqlite3.cached.Database,
  });

  await db.migrate();

  // Add a new album listen entry
  app.post("/api/addNewListenEntry", async (req, res) => {
    try {
      const {
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
      } = req.body;
      // Ignore if the album already exists
      const albumInsertResult = await db.run(
        "INSERT OR IGNORE INTO albums (title, artist, release_year, genre, subgenre, country, image, language, listeners, mbid, duration, tracks) VALUES (?, ?, ?, ?, ? ,?, ?, ?, ?, ?, ?, ?)",
        [
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
        ]
      );
      let albumId;
      if (albumInsertResult.changes === 0) {
        // Album already exists, fetch the existing ID
        const existingAlbum = await db.get(
          `SELECT id FROM albums WHERE title = ? AND artist = ?`,
          [title, artist]
        );
        albumId = existingAlbum.id;
      } else {
        // New album was added, retrieve the new ID
        albumId = albumInsertResult.lastID;
      }
      await db.run(
        "INSERT INTO album_listens (album_id, requested_by, requested_date) VALUES (?, ?, ?)",
        [albumId, requestedBy, requestedDate]
      );
      res.send("Data saved");
    } catch (error) {
      console.error("Error saving albums:", error);
      res.status(500).send("Internal Server Error");
    }
  });

  // Update existing listen and album entries
  app.post("/api/edit", async (req, res) => {
    try {
      const {
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
      } = req.body;

      // Update album listens entry
      const updateAlbumListens = await db.run(
        "UPDATE album_listens SET requested_by = ?, requested_date = ? WHERE id = ?",
        [requestedBy, requestedDate, listenID]
      );
      if (updateAlbumListens.changes === 0) {
        console.log("No rows updated");
      }
      // Update album entry
      const updateAlbums = await db.run(
        "UPDATE albums SET title = ?, artist = ?, release_year = ?, genre = ?, subgenre = ?, country = ?, image = ?, language = ?, listeners = ?, mbid = ?, duration = ?, tracks = ? WHERE id = ?",
        [
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
          albumID,
        ]
      );
      if (updateAlbums.changes === 0) {
        console.log("No rows updated");
      }
      res.send("Edit successful");
    } catch (error) {
      console.error("Error editing albums:", error);
      res.status(500).send("Internal Server Error");
    }
  });

  // Delete an album listen entry
  app.post("/api/deleteListen", async (req, res) => {
    try {
      const { listenID } = req.body;
      // Delete the album listens entry
      const deleteAlbumListens = await db.run(
        "DELETE FROM album_listens WHERE id = ?",
        [listenID]
      );
      if (deleteAlbumListens.changes === 0) {
        console.log("No rows deleted");
      }
      // Not doing this anymore as it is useful to keep album data
      //// Delete the album entry if no more listens are associated with it
      //// const listensCount = await db.get(
      ////   "SELECT COUNT(*) AS count FROM album_listens WHERE album_id = ?",
      ////   [albumID]
      //// );
      //// if (listensCount.count === 0) {
      ////   await db.run("DELETE FROM albums WHERE id = ?", [albumID]);
      //// }
      res.send("Delete successful");
    } catch (error) {
      console.error("Error deleting albums:", error);
      res.status(500).send("Internal Server Error");
    }
  });

  // Fetch all albums from the database
  app.get("/api/albums", async (req, res) => {
    try {
      const albums = await db.all("SELECT * FROM albums");
      res.json(albums);
    } catch (error) {
      console.error("Error fetching albums:", error);
      res.status(500).send("Internal Server Error");
    }
  });

  // Fetch album listens from the database
  app.get("/api/album_listens", async (req, res) => {
    try {
      const listens = await db.all(`
      SELECT 
        album_listens.id AS listen_id,
        album_listens.requested_by,
        strftime('%d-%m-%Y', album_listens.requested_date) AS requested_date,
        albums.*
      FROM 
        album_listens
      JOIN 
        albums ON album_listens.album_id = albums.id
        ORDER BY album_listens.requested_date DESC;
    `);
      res.json(listens);
    } catch (error) {
      console.error("Error fetching listens:", error);
      res.status(500).send("Internal Server Error");
    }
  });

  app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
  });
})();
