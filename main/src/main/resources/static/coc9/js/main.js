
/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */
function fetchData(url, selectId) {
    fetch(url)
      .then(response => response.json())
      .then(data => {
        const selectElement = document.getElementById(selectId);

        // Clear existing options

            selectElement.innerHTML = "<option>select option</option>";

        // Add options based on the fetched data
        if(data && Array.isArray(data))
        data.forEach(item => {
          const option = document.createElement("option");
          option.value = item.id;
          option.textContent = item.titre;
          selectElement.appendChild(option);
        });
      })
      .catch(error => {
        console.error("Error:", error);
      });
  }

 function showLoading(b) {

 }

 /**
  * Performs an asynchronous fetch operation and processes the response data.
  * @param {string} url - The URL to fetch data from.
  * @param {string} method - The HTTP method (e.g., 'GET', 'POST').
  * @param {Object} headers - The request headers.
  * @param {Function} functionToProcessData - Callback function to process the fetched data.
  * @param {Function} functionOfLoading - Callback function to handle loading state.
  */
 async function uiFetch(url , functionToProcessData, method='GET', headers) {
     showLoading(true);


     fetch(url, {
         method: method,
         headers: headers
     })
         .then(response => response.json())
         .then(data => {
             functionToProcessData(data);
             showLoading(false);
         })
    /* todo


      .catch(error => {
             console.error("Error:", error);
             // Assuming you have a showLoadingScreen function elsewhere
             showLoadingScreen(false);
         });*/
 }
