/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

function CreateMarkerPopupFromOpeartion(operation){


// Create a marker with a popup for each operation
// Create a popup content string with an HTML table
var popupContent = '<table>' +
    '<tr><th>ID BrigadeDto</th><td>' + operation.id_brigade + '</td></tr>' +
    '<tr><th>ID Division</th><td>' + operation.id_division + '</td></tr>' +
    '<tr><th>ID Operation</th><td>' + operation.id_op + '</td></tr>' +
    '<tr><th>Incident</th><td>' + operation.incident + '</td></tr>' +
    '<tr><th>Type Sortie</th><td>' + operation.type_sortie + '</td></tr>' +
    '<tr><th>Num Mission</th><td>' + operation.num_mission + '</td></tr>' +
    '<tr><th>Collaboration</th><td>' + operation.collaboration + '</td></tr>' +
    '<tr><th>État</th><td>' + operation.etat + '</td></tr>' +
    '<tr><th>Nature de Service</th><td>' + operation.nature_de_service + '</td></tr>' +
    '<tr><th>Date Début</th><td>' + operation.date_debut + '</td></tr>' +
    '<tr><th>Date Fin</th><td>' + operation.date_fin + '</td></tr>' +
    '<tr><th>Date Sortie</th><td>' + operation.date_sortie + '</td></tr>' +
    '<tr><th>Full Address</th><td>' + operation.fullAddress + '</td></tr>' +
    '<tr><th>Localisation</th><td>' + operation.localisation + '</td></tr>' +
    '</table>';

// Add images to the popup content
if(operation.imgs)
    operation.imgs = operation.imgs.split(';');
    for (var i = 0; i < operation.imgs.length; i++) {
        popupContent += '<img src="./img/' + operation.imgs[i] + '" alt="Image ' + (i + 1) + '" style="height: 100px; width: 100px;">';
    }
return popupContent;
}



