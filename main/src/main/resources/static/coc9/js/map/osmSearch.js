/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */
var wilayaSelect = document.getElementById('wilayaSelect');
var comunsSelect = document.getElementById('comunsSelect');

var allwilaya;
function getAllWilayas() {
    fetch(baseUrl+'/osm/wilayas')
        .then(response => response.json())
        .then(data => {
            allwilaya = data;
            console.log(data);
            for (const wilaya of data) {
                const option = document.createElement('option');
                option.value = wilaya.ref ;
                option.id = wilaya.osmId ;
                option.addEventListener('click', function() {
                    viewOnMap(wilaya.osmId);
                });
                option.textContent =wilaya.ref +" "+ wilaya.name;
                wilayaSelect.appendChild(option);
            }
        })
        .catch(error => {
            console.error(error);
        });
}

function getCommunesByWilaya() {
    wilayaSelect = document.getElementById('wilayaSelect');
    const wilayaId = wilayaSelect.value;

    if (wilayaId !== '') {
        removeAllOptions();

        fetch(baseUrl+`/osm/communes/${wilayaId}`)
            .then(response => response.json())
            .then(data => {

                for (const comun of data) {
                    const option = document.createElement('option');
                    option.value =comun.ref ;
                     option.id = comun.osmId;
                    option.textContent = comun.ref + " "+ comun.name;
                    option.addEventListener('click', function() {
                        viewOnMap(comun.osmId);
                    });
                    //option.onclick = "viewOnMap(" + comun.id+")" ;
                    comunsSelect.appendChild(option);
                }
            })
            .catch(error => {
                //console.error(error);
                console.log(error)
            });
    } else {
        console.log('Please select a wilaya.');
    }

    viewOnMap();
}

function getSelectedOptionId(selectId) {
    var selectElement = document.getElementById(selectId);
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    console.log( selectedOption.id);
    return selectedOption.id;
}
function removeAllOptions() {
    // const wilayaSelect = document.getElementById('wilayaSelect');
    while (comunsSelect.firstChild) {
        comunsSelect.removeChild(comunsSelect.firstChild);
    }
}
var d;
function  viewOnMap(){

    const osmId = $("#comunsSelect option:selected").attr("id");
        console.log(osmId);
    viewOnMap2(osmId);

}


var r;
function viewOnMap2(osmId)
{
    if(!osmId)
        return "undefinde osmId";

    fetch(baseUrl+"/osm/geojson?osm_id="+osmId)
          // .then(response => response.json())
        .then(datas => {

           const data = datas[0];
            r=data;
           console.log("osmId : " + osmId );
            console.log("data :");
                //console.log(data);
            console.table(r.way)
           // const way = JSON.parse(data.way);
          //  console.log(way)
           /*     const geoJsonLayer = L.geoJSON(r.way).addTo(map);
                map.fitBounds(geoJsonLayer.getBounds());

*/
            // Assuming you have already created the map instance (var map = new ol.Map({ ... }));

// Create a vector source from the GeoJSON data
            var vectorSource = new ol.source.Vector({
                features: new ol.format.GeoJSON().readFeatures(r.way)
            });
// Create a vector layer using the vector source
            var vectorLayer = new ol.layer.Vector({
                source: vectorSource
            });
// Add the vector layer to the map
            map.addLayer(vectorLayer);
// Fit the map view to the extent of the vector layer
            map.getView().fit(vectorSource.getExtent());
        })
        .catch(error => {
            console.error(error);
        });
}


//getAllWilayas();
var results;


function performSearch(keyword) {


    if(!keyword) keyword = document.getElementById('keyword').value;

    var searchDto = {
        keyword: keyword,
        type: result_type,
        offset: 0,
        limit: 10
    };
    var url = baseUrl +  '/map/search';

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(searchDto)
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            makeToastInfo('Error: '+response.status ,response);
        }
    })
        .then(result => {
            results = result;
            // Process the search results
         //    console.log(data)
            processSearchResultsLeaflet(results);
        }).catch(err=>
    {
        makeToastInfo(err.message , err);
    }).finally(() => {
        Pace.stop();
    });

}
var rr;
var table = document.getElementById('tb_search');
var result_type='.' ;
//var tableBody = document.getElementById("table-body");


function processSearchResultsLeaflet(results,tb_search="tb_search" , icon) {
    // ClearExistingMarkers from the map
    // Assuming you have a variable named 'map' representing the Leaflet map object

    if(tb_search) {

        var table = document.getElementById('tb_search');
        table.tBodies[0].remove()

        var tbody = document.createElement('tbody');
        tbody.id = 'table-body';
        table.appendChild(tbody)
    }
    //if( result_type === '.')
    // Process each result in the list
    results.forEach(function (result)
        {
        // Check if the result has coordinates (latitude and longitude)
            if(tb_search) addToTable(result , tbody);
        var geojson = JSON.parse(result.way);
        createMarker(geojson , result , icon,iconSize=16);

        });
   // else processData(results)
}
function  createPolygone(geojson){

    processData(geojson);

}

function addToTable(result , tbody) {

    var newRow = document.createElement("tr");

    newRow.addEventListener("click", function() {
        view(result.osmId , result.way);
    });


    newRow.innerHTML = `
        <td>${result.osmId}</td>
        <td>${result.name}</td>
        <td>${result.adminLevel}</td>
        <td>${result.water}</td>
        <td>${result.waterway}</td>
        <td>${result.ref}</td>
        <td >{result.tags}</td>
        <td>{result.way}</td>
      `;

    tbody.appendChild(newRow);
}

function view(id){
    console.log("searching... "  + id)

    if(result_type== '.')
        ;
    else
        createPolygone(id);
}
//performSearch();



/*
iput exemple 	"fax"=>"+21323923170", "brand"=>"Algérie Poste", "brand:ar"=>"بريد الجزائر", "brand:fr"=>"Algérie Poste", "operator"=>"Algérie Poste", "addr:street"=>"Colonel Amirouche", "brand:email"=>"clientalgerieposte@poste.dz", "operator:ar"=>"بريد الجزائر", "operator:fr"=>"Algérie Poste", "currency:DZA"=>"yes", "brand:website"=>"https://www.poste.dz/", "opening_hours"=>"08:30-12:30,13:30-16:30", "brand:wikidata"=>"Q2836029", "brand:wikipedia"=>"fr:Algérie Poste", "operator:website"=>"https://www.poste.dz/", "operator:wikidata"=>"Q2836029", "operator:wikipedia"=>"fr:Algérie Poste"
 */

const tagsToSkip='level;sport;payment:cash;website;brand:website;brand:wikidata;brand:wikipedia;official_name:fr;__EMPTY'
//const smal =" style='text-size:12;' "

function convertToDMS() {
    var latitudeDD = parseFloat(document.getElementById("latitudeDD").value);
    var longitudeDD = parseFloat(document.getElementById("longitudeDD").value);

    var latitudeDMS = decimalToDMS(latitudeDD);
    var longitudeDMS = decimalToDMS(longitudeDD);

    document.getElementById("latitudeDMS").value = latitudeDMS.join(" ");
    document.getElementById("longitudeDMS").value = longitudeDMS.join(" ");

}

var firstProjection = 'PROJCS["NAD83 / Massachusetts Mainland",GEOGCS["NAD83",DATUM["North_American_Datum_1983",SPHEROID["GRS 1980",6378137,298.257222101,AUTHORITY["EPSG","7019"]],AUTHORITY["EPSG","6269"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.01745329251994328,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4269"]],UNIT["metre",1,AUTHORITY["EPSG","9001"]],PROJECTION["Lambert_Conformal_Conic_2SP"],PARAMETER["standard_parallel_1",42.68333333333333],PARAMETER["standard_parallel_2",41.71666666666667],PARAMETER["latitude_of_origin",41],PARAMETER["central_meridian",-71.5],PARAMETER["false_easting",200000],PARAMETER["false_northing",750000],AUTHORITY["EPSG","26986"],AXIS["X",EAST],AXIS["Y",NORTH]]';
var secondProjection = "+proj=gnom +lat_0=90 +lon_0=0 +x_0=6300000 +y_0=6300000 +ellps=WGS84 +datum=WGS84 +units=m +no_defs";
function convertToDD() {
    var latitudeDMS = document.getElementById("latitudeDMS").value.split(" ");
    var longitudeDMS = document.getElementById("longitudeDMS").value.split(" ");



//I'm not going to redefine those two in latter examples.
    proj4(firstProjection,secondProjection,[-122.305887, 58.9465872]);
// [-2690575.447893817, 36622916.8071244564]


    document.getElementById("latitudeDD").value = latitudeDD;
    document.getElementById("longitudeDD").value = longitudeDD;

    if (marker) {
        map.removeLayer(marker);
    }

    marker = L.marker([latitudeDD , longitudeDD], { icon: getMarkerIcon(iconUrl="img/red-marker.png") }).addTo(map);

}

function patchConvert(){
    patchTxt = document.getElementById(patchTxt).value.split('\n');


}

var searchLocationIf=false,circleIf=false,onEditor=false
function addIconOnClick( latitude='latitudeDD' ,longitude= 'longitudeDD') {
    //console.log('addIconOnClick');

    map.on('click', function(e) {
       // ClearExistingMarkers(markerPiker)
        clearMarkerPicker()

        var latlng = e.latlng;

       if(circleIf) circle(latlng.lat , latlng.lng)

        const lat = document.getElementById('latinput');
        const lng= document.getElementById('longinput');
            if(lat) {
                lat.value = latlng.lat;
                lng .value = latlng.lng;
            }
       if(onEditor) convertToDMS();

        if(_layers[selectedLayerId].getBounds().contains(latlng)) {
            markerPiker = L.marker(latlng, {icon: getMarkerIcon('poi_red')}).addTo(map);

        }
         else{
                console.log("not allowed to add marker here")
            lat.value = '';
            lng.value = '';
        }


      if(searchLocationIf)  searchLocation(e)
    });


}


function  searchLocation(e) {

    var lat= parseFloat(document.getElementById('latitudeDD').value)
        var lng= parseFloat(document.getElementById('longitudeDD').value)
     //keyword: document.getElementById('keyword').value,
       //  radius= document.getElementById('radius').value,
         distance= parseFloat(document.getElementById('distance').value),
        // type= document.getElementById('type').value,
         offset= parseInt(document.getElementById('offset').value),
         limit= parseInt(document.getElementById('limit').value)


    var searchDto = {
        lat: lat,
        lng: lng,
        //radius:radius,
        distance:distance,
        //type:type,
        offset:offset,
        limit : 50,


    };
    console.log(searchDto)
    var url = baseUrl + '/map/searchLocation';

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(searchDto)
    })
        .then(response => response.json())
        .then(result => {
            results = result;
            // Process the search results
            console.log(result)
             if(result && result.length>0)
               processSearchResultsLeaflet(results, tb_search = null,
                   icon = "img/agent-des-douanes.png");


        })
    }
