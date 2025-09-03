/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */


/*
// Define the source coordinate system
var sourceCRS = new proj4.Proj('EPSG:4326');

// Define the destination coordinate system
//var destCRS = new proj4.Proj('EPSG:3857');

// i want to convert to  Degrés Minutes Minutes Secondes (WGS84)
var destCRS = new proj4.Proj('EPSG:4326');


// Create a Proj4 CRS object for the transformation
var crs = new L.Proj.CRS('EPSG:3857', '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs', {
    resolutions: L.Proj.Resolutions,
});



function convert2() {
    // Define the source CRS (EPSG:3857)
    var sourceCRS = new proj4.Proj('EPSG:3857');

    // Define the destination CRS (EPSG:4326)
    var destCRS = new proj4.Proj('EPSG:4326');

    // Example data
    var data = document.getElementById('txta').textContent.split('\n');

    // Iterate over the data and add markers to the map
    for (var i = 0; i < data.length; i++) {
        var coordinate = data[i];

        // Parse the latitude and longitude parts from the coordinate string
        var latitude = parseCoordinatePart(coordinate, 'N');
        var longitude = parseCoordinatePart(coordinate, 'O');

        console.log(latitude,"  ",longitude )
        // Check if the latitude and longitude are valid numbers
        if (isNaN(latitude) || isNaN(longitude) || !isFinite(latitude) || !isFinite(longitude)) {
            console.error('1 Invalid latitude or longitude:', coordinate);
            continue; // Skip to the next coordinate if invalid
        }

        // Transform the coordinates from the source CRS to the destination CRS
        var transformedCoords = proj4(sourceCRS, destCRS, [longitude, latitude]);

        // Check if the transformed coordinates are valid numbers
        if (transformedCoords.some(isNaN) || transformedCoords.some(!isFinite)) {
            console.error('2 Failed to transform coordinates:', coordinate);
            continue; // Skip to the next coordinate if transformation failed
        }

        // Create a marker using the transformed coordinates
        var marker = L.marker(transformedCoords.reverse()).addTo(map);
    }
}

 */
function  convert () {

//console.log('convert')

    var data =  editor.getValue().split('\n');

    var orgs=[]
   // orgs.pop()
    // Iterate over the data and add markers to the map
    for (var i = 0; i < data.length; i++) {
        var coordinate = data[i].split(';');

        // console.log(coordinate)
        // Parse the latitude and longitude parts from the coordinate string
        var latitude =parseFloat( coordinate[0]);
        var longitude = parseFloat(coordinate[1]);

        console.log(latitude,"  ",longitude )
        // Check if the latitude and longitude are valid numbers
        if (isNaN(latitude) || isNaN(longitude) || !isFinite(latitude) || !isFinite(longitude)) {
            console.error('1 Invalid latitude or longitude:', coordinate);
            continue; // Skip to the next coordinate if invalid
        }

        var org= {
            "DR": "Bechar",

            "titreAr": coordinate[2],
            "titreFr": coordinate[3],

            "nm": coordinate[4],
            "localisation": {
                "latitude": latitude ,
                "longitude": longitude
            }}
        orgs.push(org)
        // Create a marker using the transformed coordinates
        var marker = L.marker([latitude,longitude]).addTo(map);
    }
    //console.log('length : ',orgs.length)
    editor.setOption("mode", "application/json");
    editor.setValue(JSON.stringify(orgs, null, 2).replace(/\n/g, "\n"));
}

// Function to parse the latitude or longitude part from the coordinate string
function parseCoordinatePart(coordinate, direction) {
    var coordinateParts = coordinate.split(' ');

    for (var i = 0; i < coordinateParts.length; i++) {
        if (coordinateParts[i].includes(direction)) {
            var coordinateValue = coordinateParts[i]
                .replace(direction, '')
                .replace('°', '')
                .replace('\'', '')
                .replace('"', '');

            var degrees = parseInt(coordinateValue.substring(0, 2));
            var minutes = parseInt(coordinateValue.substring(2, 4));
            var seconds = parseInt(coordinateValue.substring(4, 6));
            var decimalDegrees = degrees + (minutes / 60) + (seconds / 3600);

            return decimalDegrees;
        }
    }

    return NaN; // Return NaN if coordinate part is not found
}

// Helper function to parse a coordinate part from the string
function parseCoordinatePartAr(coordinate, direction) {
    var partStart = coordinate.indexOf(direction) + direction.length;
    var partEnd = coordinate.indexOf('\"', partStart);
    var part = coordinate.substring(partStart, partEnd);
    return parseFloat(part);
}