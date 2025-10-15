/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

function getIconFileName(type){
if(type == null)
    throw Error('must spicify org type')

    type = type.toLocaleLowerCase()
    switch (type){

        case 'org' :return 'drd.png' ;
        case 'drd' :return 'drd.png' ;
        case 'idd' :return 'brigade-blue' ;
        case 'br' :return 'div-green' ;
        case 'port' :return 'port' ;
        case 'medical center' :  return 'medical center'
        case 'bureau' : return 'bureau';
        case 'aeroport' : return 'airport' ;
        case 'parking' :case 'parc' : return 'parking'
        case 'port sec' :return 'shipping container' ;
        case 'pds' : case 'pdf' : return 'posteFrontiere'  //post frontalies
        case 'shrine': case 'transit residence':
        // case 'functional housing' :case 'residential complexes' :return 'apartment' ;
        case 'station' : return 'station.svg'
        case null: case '' : return 'poi_red'
        default : return type
    }
}


function getMarkerIcon(iconUrl, iconSize = 32) {
    if (!iconUrl.includes('/img/marker/')) {
        iconUrl = './img/marker/' + iconUrl;
    }
    if (!iconUrl.includes('.svg') &&!iconUrl.includes('.png')) {
        iconUrl += '.png';
    }

    var icon = L.icon({
        iconUrl: iconUrl,
        iconSize: [32,32] // calculateIconSize(iconSize)
         , iconAnchor: [iconSize / 2, iconSize / 2]
    });

    // Créer un nouvel objet Image pour tester si l'image existe
    var img = new Image();
    img.onload = function() {
        // Si l'image charge sans erreur, l'URL est valide
        // console.log('Image found:', iconUrl);
    };
    img.onerror = function() {
        // Si l'image ne charge pas, utiliser une image par défaut
        //console.error('Image not found:', iconUrl);
        icon.options.iconUrl = './img/marker/drd.png'; // Chemin vers votre image par défaut
    };
    img.src = iconUrl; // Déclenche le chargement de l'image

    return icon;
}


function calculateIconSize(baseSize) {
    const currentZoom = mapInstance.getZoom();
    const scaleFactor = calculateScaleFactor(currentZoom); // Define your own scaling factor function

    return [baseSize * scaleFactor, baseSize * scaleFactor];
}


function calculateScaleFactor(zoomLevel) {
        // Adjust these values as needed to determine the scaling factor based on zoom level

        if (zoomLevel >= 12) {
            return 3.5;
        } else if (zoomLevel >= 7) {
            return 2.5;
        } else if (zoomLevel >= 4) {
            return 0.5;
        } else {
            return 1;
        }
    }

function createMarker(geojsonPoint,markerPopup , icon,iconSize){
    result_type='.';
    var marker = L.geoJSON(geojsonPoint, {
        pointToLayer: function (feature, latlng) {
            return L.marker(latlng ,{ icon: getMarkerIcon(icon,iconSize) }).addTo(mapInstance);
        },
        coordsToLatLng: function (coords) {
            var point = L.point(coords);
            return mapInstance.options.crs.projection.unproject(point);
        }
    });

    // var marker = L.marker(geojsonLayer.getBounds().getCenter(), { icon: getMarkerIcon() });
    // Bind a popup to the marker showing the result's name
    marker.bindPopup(CreateMarkerTable(markerPopup));
    addHover(marker)

    // Add the marker to the map
    marker.addTo(mapInstance);

    // Fit the map view to the bounds of the markers
    //var group = new L.featureGroup(map.getLayers());
    //map.fitBounds(group.getBounds());}
}


// Custom function to parse the specific key-value pairs format
function parseTags(tagsString) {
    var tagsArray = tagsString.split(', ');
    var tags = {};

    tagsArray.forEach(function (tagPair) {
        var pair = tagPair.split('=>');
        if (pair.length === 2) {
            tags[pair[0]] = pair[1];
        }
    });

    return tags;
}

function CreateMarkerTable(obj , iconSize) {
    var popupContent = '<table class="table table-hover">';

    for (var key in obj) {
        if (obj.hasOwnProperty(key) && key !== 'way' && key!=='localisation' && !key.includes('EMPTY') ) {
            var value = obj[key];

            if (key === 'tags') {
                try {
                    // Assuming 'tags' value is in your specific key-value pairs format
                    var tags = parseTags(value);

                    for (var tag in tags) {
                        if (tags.hasOwnProperty(tag) && !tagsToSkip.includes(tag)   ) {
                            var tagValue = tags[tag];

                            if (!tagValue) {
                                tagValue = "";
                            }
                            if (tagValue && tagValue !=='')
                                popupContent += '<tr class="text-bold"><th>' + tag + '</th><td>' + tagValue + '</td></tr>';
                        }
                    }
                } catch (error) {
                    // Handle the error as needed
                    console.error('Error parsing tags:', error);
                }
            } else {
                if (value && value !=='') {
                    popupContent += '<tr><th>' + key + '</th><td>' + value + '</td></tr>';
                }


            }
        }
    }

    if(iconSize)
    popupContent += '<tr><th>iconSize: </th><td>' + iconSize + '</td></tr>';

    popupContent += '</table>';

    return popupContent;
}

function addHover(marker){
    marker.on('mouseover', function (event) {
        console.log("mouseover" )
        this.openPopup();
    });

    marker.on('mouseout', function (event) {
       // this.closePopup();
    });

}
