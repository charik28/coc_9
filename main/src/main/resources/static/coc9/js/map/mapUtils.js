/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

function circle(lat,lng ,radiusInKm=30,color='red' ){
    //ClearExistingcircle
    map.eachLayer(function (layer) {
        if (layer instanceof L.Circle) {
            map.removeLayer(layer);
        }
    });

 // Define the circle coordinates and radius
var circleCenter = L.latLng(lat, lng);

// Create the circle overlay
var circle =
    L.circle(circleCenter, {
    radius: radiusInKm*1000,
    color: color,
    //fillColor: '#f03',
    fillOpacity: 0.5
}).addTo(map);

}

function dmsToDecimal(degrees, minutes, seconds) {
    var sign = degrees < 0 ? -1 : 1;
    var absDegrees = Math.abs(degrees);
    var decimalDegrees = absDegrees + minutes / 60 + seconds / 3600;
    return decimalDegrees * sign;
}

function decimalToDMS(decimalDegrees) {
    var sign = decimalDegrees < 0 ? -1 : 1;
    var absDecimalDegrees = Math.abs(decimalDegrees);
    var degrees = Math.floor(absDecimalDegrees);
    var minutesDecimal = (absDecimalDegrees - degrees) * 60;
    var minutes = Math.floor(minutesDecimal);
    var seconds = (minutesDecimal - minutes) * 60;

    return [degrees * sign, minutes, seconds];
}

/*
function ClearExistingMarkers(){
    map.eachLayer(function (layer) {

        if (layer instanceof L.Marker) {
            map.removeLayer(layer);
        }
    });
}*/
function ClearExistingMarkers() {
    map.eachLayer(function (layer) {
        if (layer instanceof L.Marker && !notRemovableMarkers.has(layer)) {
            map.removeLayer(layer);
        }
    });
}
function clearMarkerPicker(){
    map.eachLayer(function (layer) {
        if (layer === markerPiker) {
            map.removeLayer(layer);
        }
    });
}