
/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

 //loader = L.control.loader().addTo(document);


var btn1 = L.easyButton("fa-home", function() {
  mapInstance.setView([28.2156279, 2.9081565], 5.35, { animate: true, duration: 0.5 });
}).addTo(mapInstance);



/*info.update = function(obj) {
  console.log("update"+obj)

  this._div.innerHTML =
      CreateMarkerTable(obj)*/
      /*"<h4>title</h4>" +
      (props
          ? "<b>" +
          "name" +
          " " +
          "props.city_code" +
          "</b><br />" +
          "<b>" +
          "props.name_ar" +
          "</b><br />" +
          "<b> <img src='./icon/drd.png' ></img>" +
          +
              "</b><br />" +
          "ty"

          : "Hover over a Wilaya");


};
*/

//info.addTo(map);



function resetHighlight(e) {
  geojson.resetStyle(e.target);
  info.update();
}

function zoomToFeature(e) {
  mapInstance.fitBounds(e.target.getBounds());
}

function onEachFeature(feature, layer) {
  layer.on({
    mouseover: highlightFeature,
    mouseout: resetHighlight,
    click: zoomToFeature
  });
}

function highlightFeature(e) {
  var layer = e.target;

  layer.setStyle({
    weight: 4,
    color: "#666",
    dashArray: "",
    fillOpacity: 0.7
  });

  if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
    layer.bringToFront();
  }

  info.update(layer.feature.properties);
}
function style(feature) {


  return {
    weight: 2,
    opacity: 1,
    color: "white",
    dashArray: "3",
    fillOpacity: 0.7,
    fillColor: getColor(feature)
  };

}
function processData(json) {
  console.log("processData")
  geojson = L.geoJson(json, {
    style: style,
    onEachFeature: onEachFeature
  }).addTo(mapInstance);
}

var legend = L.control({ position: "bottomright" });

legend.onAdd = function(map) {
  var div = L.DomUtil.create("div", "info legend");


  div.innerHTML = "infooooooooooos";
  return div;
};
  legend.addTo(mapInstance);



// Create a button for setting the map view to a specific location
//if(L == null )

//console.log("L " + L)
var btn10 = L.easyButton({
    states: [{
      stateName: 'home',
      icon: 'fa-home',
      title: 'Go to Home',
      onClick: function(btn, map) {
        map.setView([28.2156279, 2.9081565], 5.35, { animate: true, duration: 0.5 });
        geojsonLayer.addTo(map);
      }
    }]
  }).addTo(mapInstance);

  // Create a button for searching a location
  var btn2 = L.easyButton({
    states: [{
      stateName: 'search',
      icon: 'fa-search',
      title: 'Search',
      onClick: handelSearch
    }]
  }).addTo(mapInstance);
// Function to handle the search action
function handelSearch() {
 // var searchTerm = prompt('Enter a location to search:');



}
  // Create a button for coloring the map by population
  var btn3 = L.easyButton({
    states: [{
      stateName: 'color-population',
      icon: 'fa-paint-brush',
      title: 'Color Map by Population',
      onClick: function(btn, map) {
        // Perform your coloring functionality here
        changeTileLayer(3)
      }
    }]
  }).addTo(mapInstance);

  // Create a button for viewing government architecture
  var btn4 = L.easyButton({
    states: [{
      stateName: 'government-architecture',
      icon: 'fa-building',
      title: 'View Government Architecture',
      onClick: function(btn, map) {
        // Perform your government architecture functionality here
        changeTileLayer(4)
      }
    }]
  }).addTo(mapInstance);

  // Create a button for switching layers
  var btn5 = L.easyButton({
    states: [{
      stateName: 'switch-layers',
      icon: 'fa-exchange',
      title: 'Switch Layers',
      onClick: function(btn, map) {
        // Perform your layer switching functionality here
        changeTileLayer(5)
      }
    }]
  }).addTo(mapInstance);

  var btn6 = L.easyButton({
    states: [{
      stateName: 'switch-layers',
      icon: 'fa-exchange',
      title: 'Switch Layers',
      onClick: function(btn, map) {
        // Perform your layer switching functionality here
        changeTileLayer(6)
      }
    }]
  }).addTo(mapInstance);

  var btn7 = L.easyButton({
    states: [{
      stateName: 'switch-layers',
      icon: 'fa-exchange',
      title: 'Switch Layers',
      onClick: function(btn, map) {
        // Perform your layer switching functionality here
        changeTileLayer(7)
      }
    }]
  }).addTo(mapInstance);

  function changeTileLayer(layerIndex) {
    if (layerIndex >= 0 && layerIndex < couches.length) {
      mapInstance.eachLayer(function (layer) {
        if (layer instanceof L.TileLayer) {
          mapInstance.removeLayer(layer);
        }
      });
      L.tileLayer(couches[layerIndex], {
        attribution: 'Map data &copy; <a href="https://www.charik.dz/">CNTSID Street Map</a> contributors <div id="xy"></div>',
        maxZoom: 18,
      }).addTo(mapInstance);
      currentLayerIndex = layerIndex; // Update the current layer index
    }
  }

     function getColor(feature){
    console.log("getColor");
       return "#fe4c99";
     }

