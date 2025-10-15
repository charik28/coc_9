
/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

 //loader = L.control.loader().addTo(document);






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




// Function to handle the search action
function handelSearch() {
 // var searchTerm = prompt('Enter a location to search:');



}

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

