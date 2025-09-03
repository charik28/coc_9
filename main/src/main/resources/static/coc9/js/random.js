/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */
// Function to generate a random alphanumeric string
function generateRandomString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;

    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }

    return result;
}

// Function to generate a random date in YYYY-MM-DD format
/*function generateRandomDate() {
    const start = new Date(2024, 0, 1);
    const end = new Date();
    const randomDate = new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
    return randomDate ;//.toISOString().split('T')[0];
}*/
var formattedDate;
function generateRandomDate() {
    const start = new Date(2024, 1, 1);
    const end = new Date(2025, 11, 1);

    var randomTimestamp = start.getTime() + Math.random() * (end.getTime() - start.getTime());
    var randomDate = new Date(randomTimestamp);
    var formattedDate = randomDate.toISOString().split('.')[0]; // Remove milliseconds
    document.getElementById('date_sortie').value = formattedDate;

    // Generate random hours within the range of <5h
    var randomHoursDebut = Math.floor(Math.random() * 5);
    randomDate.setHours(randomDate.getHours() + randomHoursDebut);
    formattedDate = randomDate.toISOString().split('.')[0];
    document.getElementById('date_debut').value = formattedDate;

    // Generate random hours within the range of >8h
    var randomHoursFin = Math.floor(Math.random() * (24 - 8)) + 8;
    randomDate.setHours(randomDate.getHours() + randomHoursFin);
    formattedDate = randomDate.toISOString().split('.')[0];
    document.getElementById('date_fin').value = formattedDate;

    return formattedDate;
}
// Function to generate random data and populate the form fields
function generateRandomData() {
    document.getElementById('id_brigade').value = Math.floor(Math.random() * 10) + 1;
    document.getElementById('id_division').value = Math.floor(Math.random() * 10) + 1;
    document.getElementById('id_op').value =Math.floor(Math.random() * 10000) + 1;
    document.getElementById('incident').value = generateRandomString(10);
    document.getElementById('type_sortie').value = "barage";
    document.getElementById('latitude').value =21.256331129323947 +Math.floor(Math.random() * 10) + 1;
    document.getElementById('longitude').value =5.502748228385604 +Math.floor(Math.random() * 10) + 1;


    document.getElementById('num_mission').value = Math.floor(Math.random() * 100) + 1;
    document.getElementById('collaboration').value = "Douane/Douane";
    document.getElementById('etat').value = "programee";

     //generateRandomDate();


}

// Generate random data when the page loads
//generateRandomData();
// Handle form submission