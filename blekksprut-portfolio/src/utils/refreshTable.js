//used to refresh the albums table from the database
async function refreshTable(apiEndpoint) {
  try {
    console.log("Refreshing table from database...");
    const response = await fetch(apiEndpoint);
    if (!response.ok) {
      throw new Error("Failed to fetch data from server");
    }
    const data = await response.json();
    console.log("Table refreshed successfully!");
    return data; // Return the fetched data
  } catch (error) {
    console.error("Error refreshing table:", error);
    throw error; // Rethrow the error for the caller to handle
  }
}
export { refreshTable };
