/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

var mapInitialised=false;
var loader;

var data
var _features=[] , _layers=[];
function loadPolygon(src, background = 'transparent', lineColor = 'black') {
    console.log('loadPolygon')
    fetch(src)
        .then(response => response.json())
        .then(data => {
            //this.data=data
            console.log('fetch polygon then data ' , data)
           var polygon = ( L.geoJSON(data, {
                style: function(feature) {
                    _features.push(feature)

                    return {
                        fillColor: background,
                        color: lineColor
                    };
                }
            ,
            onEachFeature: function(feature, layer) {
                _layers.push(layer)

            }
           }


            ).addTo(mapInstance))


            if(PolygonbindTooltip)
            // Bind data.title to the polygon if needed
            polygon.bindTooltip(function (layer) {

                let r = ""
                if(layer.feature.properties.ref)
                    r += "Region : " +layer.feature.properties.ref;

                if(layer.feature.properties.name)
                    r+= " " +  layer.feature.properties.name
                return   r;
            });



        })
        .catch(error => {
            console.error('Error fetching or processing the geojson data:', error);
        });
}
function  addOrgJsonToMap(orgJson ){
    // orgJson = JSON.parse(orgJson)
    var count=0;
    for (var i = 0; i < orgJson.length; i++) {
        var obj = orgJson[i];

        var latitude = obj.latitude
        var longitude=obj.longitude

        if(!latitude  ){
            latitude = obj?.localisation?.latitude
            longitude=obj?.localisation?.longitude
        }


        if(!latitude)
        {
            //console.log()
            console.error(obj, "no latitude or longitude on this obj")
            continue
        }

        //todo var icon = obj.type
     //   llog(obj.TYPE)

        try {

            var _icon = getMarkerIcon(getIconFileName(obj.TYPE), iconSize = 32);
            var marker = L.marker(
                [ parseFloat(latitude), parseFloat( longitude)],
                {icon:_icon }
            );

            markers.push(marker)
            marker.bindPopup(CreateMarkerTable(obj , calculateIconSize(32) )  )
            count++;
        }catch(err) {
         //   console.log(i , err.message)
            continue
        }
        /*
        marker.on('mouseover', (function (obj) {
            return function (event) {
                this.openPopup();
                info.update(obj); // Update the info control with marker popup content
            };
        })
        (obj));

        marker.on('mouseout', (function () {
            return function (event) {
                this.closePopup();
                info.update(); // Clear the info control content
            };
        })());
*/
        marker.addTo(mapInstance);
        // notRemovableMarkers.add(marker);
    }

    // Add an event listener for map errors
    mapInstance.on('error', function(err) {
        // Check if the error code matches any of the known errors
        const errorMessage = errorMessages.get(err.error.code);
        if (errorMessage) {
            // Display the error message
            makeToastError(errorMessage.title, errorMessage.message);
        } else {
            // Handle other map-related errors
            console.error('Map error:', err);
        }
    });

    mapInstance.on('zoomend', function() {
        const iconSize = calculateIconSize(32); // Adjust the base icon size as needed

        // Iterate over each marker and update its icon size
        markers.forEach(marker => {
            const icon = getMarkerIcon(marker.options.icon.options.iconUrl, iconSize);
            marker.setIcon(icon);
        });

        // console.log(iconSize , "curent zoom : " , map.getZoom())
    });

    // console.log(count , " marker founded")

    info.update = function (obj) {
        // console.log("update", obj);
        this._div.innerHTML = obj ? CreateMarkerTable(obj) : '';
    };

    info.addTo(mapInstance);

     loadPolygon('/js/geojson/regionsPolygon.geojson')
      //  loadPolygon('./map/regions')


}


function  getMapTiles(tiles){
    if(Array.isArray(tiles)) {

        titleLayers = {}
        for (var i = 0; i < tiles.length; i++) {
            // Create a new tile layer with the appropriate options
            const tileLayer = L.tileLayer(tiles.url, {
                attribution: tiles[i].attribution,
                maxZoom: tiles[i].maxZoom,
                minZoom: tiles[i].minZoom
            });
            tileLayers.add(tileLayer)
            // Add the title of the tile as the key and the tile layer as the value
            titleLayers.push(tiles[i].title);
        }
        // Add the baseLayers to the map control
        L.control.layers(titleLayers).addTo(mapInstance);
        //   tileLayers.push(data[i])
    }

}

function printZoomInfo(){

    mapInstance.on('zoomend', function() {
        const currentZoom = mapInstance.getZoom();
        // const currentTile = map.getCenterTile();

        const tileUrl = config.TILE_LAYER
            .replace('{z}', currentZoom);
            // .replace('{x}', currentTile.x)
            // .replace('{y}', currentTile.y);

        console.log(tileUrl);
    });

}

// initMap();

function printZoomInfofor(){
    mapInstance.on('zoomend', function() {
        const currentZoom = mapInstance.getZoom();
        const currentBounds = mapInstance.getBounds();
        const tileBounds = L.bounds(
            mapInstance.project(currentBounds.getNorthWest(), currentZoom),
            mapInstance.project(currentBounds.getSouthEast(), currentZoom)
        );
        const tileUrl = TILE_LAYER
            .replace('{z}', currentZoom)
            .replace('{x}', i)
            .replace('{y}', j);

        console.log(tileUrl);
/*
        for (let j = tileBounds.min.y; j <= tileBounds.max.y; j++) {
            for (let i = tileBounds.min.x; i <= tileBounds.max.x; i++) {
                const tileUrl = TILE_LAYER
                    .replace('{z}', currentZoom)
                    .replace('{x}', i)
                    .replace('{y}', j);

                console.log(tileUrl);
            }
        }*/

    });

}



function addORG() {
    // tod-ok do not remove these markers
    for (var i = 0; i < ORGs.length; i++) {
        var direction = ORGs[i];

        var marker = L.marker(
            [direction.localisation.latitude, direction.localisation.longitude],
            { icon: getMarkerIcon(iconUrl = 'drd.png', iconSize = 16) }
        );

        marker.on('mouseover', (function (direction) {
            return function (event) {
                this.openPopup();
                info.update(direction); // Update the info control with marker popup content
            };
        })
        (direction));

        marker.on('mouseout', (function () {
            return function (event) {
                this.closePopup();
                info.update(); // Clear the info control content
            };
        })());

        marker.addTo(mapInstance);
        notRemovableMarkers.add(marker);
    }

    info.update = function (obj) {
        // console.log("update", obj);
        this._div.innerHTML = obj ? CreateMarkerTable(obj) : '';
    };

    info.addTo(mapInstance);
}
function addORGBrahim() {
    // tod-ok do not remove these markers
    for (var i = 0; i < ORGBrahim.length; i++) {
        var direction = ORGBrahim[i];

        if(direction?.localisation) {
            var marker = L.marker(
                [direction.localisation.latitude, direction.localisation.longitude],
                {icon: getMarkerIcon(iconUrl = 'drd.png', iconSize = 16)}
            );

            marker.on('mouseover', (function (direction) {
                return function (event) {
                    this.openPopup();
                    info.update(direction); // Update the info control with marker popup content
                };
            })
            (direction));

            marker.on('mouseout', (function () {
                return function (event) {
                    this.closePopup();
                    info.update(); // Clear the info control content
                };
            })());

            marker.addTo(mapInstance);
            notRemovableMarkers.add(marker);
        }
    }

    info.update = function (obj) {
        // console.log("update", obj);
        this._div.innerHTML = obj ? CreateMarkerTable(obj) : '';
    };

    info.addTo(mapInstance);
}
function initMap(mapContainer = 'map') {
  const lat = 36.0538;
  const lng = 3.4388;
  const centerZoom = 5;

  const mapDiv = document.getElementById(mapContainer);
  if (!mapDiv) {
    console.error('❌ Map container not found:', mapContainer);
    return;
  }

  console.log('🗺️ Initializing map in div:', mapContainer);

  const map = L.map(mapContainer, { crs: L.CRS.EPSG3857 })
    .setView([lat, lng], centerZoom, { animate: true, duration: 0.5 });

  L.tileLayer(config.TILE_LAYER, {
    attribution: config.ATTRIBUTION,
    minZoom: 5,
    maxZoom: 22,
  }).addTo(map);

  map.setMinZoom(2.5);

  const loader = L.control.loader().addTo(map);

  const planLayer = L.tileLayer(config.TILE_LAYER, {
    attribution: config.ATTRIBUTION,
    maxZoom: 18,
  }).addTo(map);

  const satelliteLayer = L.tileLayer('http://geo.si.douane.gov.dz/sat/bing/{z}/{x}/{y}.png', {
    attribution: '&copy; Vectorial map',
    maxZoom: 18,
  });

  const reliefLayer = L.tileLayer('http://geo.si.douane.gov.dz/sat/google.sat/{z}/{x}/{y}.png', {
    attribution: '&copy; Satilitaire map',
    maxZoom: 18,
  });

  const routeLayer = L.tileLayer('http://geo.si.douane.gov.dz/hot/{z}/{x}/{y}.png', {
    attribution: '&copy; Satilitaire map 2',
    maxZoom: 18,
  });

  const titleLayers = {
    'Plans': planLayer,
    'Satellite': satelliteLayer,
    'Relief': reliefLayer,
    'Route': routeLayer,
  };

// Ajouter le panneau de contrôle des couches
  L.control.layers(titleLayers).addTo(map);

    mapInitialised=true
    addORG();
    addORGBrahim();

    console.log('ORGBrahim')
    addOrgJsonToMap(ORGBrahim)

    console.log('ORGs')

    // addOrgJsonToMap(ORGs)

    /*
        document.addEventListener("wheel", function(event) {
            if (isCursorOverMap) {
                map.scrollWheelZoom.enable();
            } else {
                map.scrollWheelZoom.disable();
                setTimeout(function() {
                    map.scrollWheelZoom.enable();
                }, 2000); // Adjust the delay as needed
            }
        });

    map.getContainer().addEventListener("mouseenter", function() {
         isCursorOverMap = true;
    });

    map.getContainer().addEventListener("mouseleave", function() {
         isCursorOverMap = false;
    });*/
    printZoomInfo();
    loader.hide()


}
