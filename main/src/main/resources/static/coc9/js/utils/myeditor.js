/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

var editor;



 function initEditor(){
     console.log("initEditor")

        editor = CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
       // mode: "htmlmixed",
            // The mode to use. When not given, this will default to the first mode that was loaded. It may be a string,
            // which either simply names the mode or is a MIME type associated with the mode. The value "null" indicates no highlighting should be applied.
         theme: "monokai"
    });

        document.getElementById("formaliseOcrCharsBtn").addEventListener("click", formatTxt);
        document.getElementById("toXBtn").addEventListener("click", toDecimalDegre);
        document.getElementById("copierBtn").addEventListener("click", copier);
        document.getElementById("couperBtn").addEventListener("click", couper);
        document.getElementById("collerBtn").addEventListener("click", coller);
        document.getElementById("convertBtn").addEventListener("click", convert);
        document.getElementById("convertToCsvbtn").addEventListener("click", toX4);

        document.getElementById("convertToNBtn").addEventListener("click", function() {
            convertToNE('N');
        });

        document.getElementById("convertToEBtn").addEventListener("click", function() {
            convertToNE('E');
        });

     editor.addKeyMap({
         "Ctrl-Enter": function(cm) {
             askAi();
         }
     });


     loadContent0( 'components/dataTable', 'excelTable')

     //navbareSearch
     search_input = document.getElementById('search_input');
     search_input.addEventListener("keydown", (event) => {
         if (event.key === "Enter") {
             logg("searching in map db")
             //todo search_input.editable=false
             Pace.start();
                          const keyword = search_input.value;
             performSearch(keyword);
         }
     });


 }

function formatTxt() {
    let txt = editor.getValue();
    //txt = txt.replace('°', ',').replace('/', ',');
    txt = txt.replace(/[^\d\n /,.NE]/g, '');
    editor.setValue(txt);
  //  return txt;
}

function toDecimalDegre() {  //(WGS84)
    logg("toDecimalDegre, clicked")
    var txt = formatTxt();
    var txt = editor.getValue();

    var res = '';
    var lines = txt.split('\n');
    lines.forEach(line => {
        var degre = parseFloat(line.substring(0, 2));
        var minit = parseFloat(line.substring(2, 4));
        var sec = parseFloat(line.substring(4, line.length));

        var x = degre + minit / 60

        if (  !isNaN(sec)) {
            x += sec / 3600;

        }

        res += x + '\n';
    });

    editor.setValue(res);
}
//for Laghouat cordinate system
function toX2() {
    formatTxt()
    console.log("clicked");
    var txt = editor.getValue();

    var res = "";
    var lines = txt.split("\n");
    lines.forEach((line) => {
        var degre = parseFloat(line.substring(0, 2));
        var minit = parseFloat(line.substring(2, 4));
        var sec = parseFloat(line.substring(4, line.length));

        var x = degre + minit / 100;

        if(!isNaN(sec))
            x += sec/10000

        // Determine the hemisphere (N or S)
        var hemisphere = line.substring(line.length - 1);

        // Append the hemisphere to the result
        if (hemisphere === "S") {
            x = -x; // Invert the value for the Southern hemisphere
        }

        res += x.toFixed(7) + "\n";
    });

    editor.setValue(res);
}
// Example input format: 33°77/66.69E 2°84/21.07N

/*
33°77/66.69E 2°84/21.07N
45°23/12.34W 12°57/83.21S
 */
function toX3() {
    console.log("clicked");
    var txt = editor.getValue();

    var res = "";
    var lines = txt.split("\n");
    lines.forEach((line) => {
        var latitudeDegrees = parseFloat(line.substring(0, line.indexOf("°")));
        var latitudeFraction = parseFloat(line.substring(line.indexOf("°") + 1, line.indexOf("/")));
        var latitudeDenominator = parseFloat(line.substring(line.indexOf("/") + 1, line.indexOf("N")));

        var longitudeDegrees = parseFloat(line.substring(line.indexOf("E") - 2, line.indexOf("E")));
        var longitudeFraction = parseFloat(line.substring(line.indexOf("E") + 1, line.lastIndexOf("/")));
        var longitudeDenominator = parseFloat(line.substring(line.lastIndexOf("/") + 1, line.lastIndexOf("W")));

        if (isNaN(latitudeDegrees) || isNaN(latitudeFraction) || isNaN(latitudeDenominator) ||
            isNaN(longitudeDegrees) || isNaN(longitudeFraction) || isNaN(longitudeDenominator)) {
           // res += "Invalid input\n";
        } else {
            var latitudeDecimal = latitudeDegrees + (latitudeFraction / latitudeDenominator);
            var longitudeDecimal = longitudeDegrees + (longitudeFraction / longitudeDenominator);

            var latitudeHemisphere = line.substring(line.indexOf("N"));
            var longitudeHemisphere = line.substring(line.indexOf("W"));

            if (latitudeHemisphere === "S") {
                latitudeDecimal = -latitudeDecimal;
            }

            if (longitudeHemisphere === "W") {
                longitudeDecimal = -longitudeDecimal;
            }

            res += latitudeDecimal.toFixed(4) + "° " + latitudeHemisphere + " ;" + longitudeDecimal.toFixed(4) + "° " + longitudeHemisphere + "\n";
        }
    });

    editor.setValue(res);
}
function toX4() {
  //  console.log("clicked");
    var txt = editor.getValue();

    var res = "";
    var lines = txt.split("\n");
    lines.forEach((line) => {
        var parts = line.split(";");
        if (parts.length !== 2) {
            res += "Invalid input\n";
            return;
        }

        var longitude = parts[0];
        var latitude = parts[1];

        var longitudeDegrees = parseFloat(longitude.substring(0, longitude.indexOf("°")));
        var longitudeFraction = parseFloat(longitude.substring(longitude.indexOf("°") + 1, longitude.lastIndexOf("/")));
        var longitudeDenominator = parseFloat(longitude.substring(longitude.lastIndexOf("/") + 1));

        var latitudeDegrees = parseFloat(latitude.substring(0, latitude.indexOf("°")));
        var latitudeFraction = parseFloat(latitude.substring(latitude.indexOf("°") + 1, latitude.lastIndexOf("/")));
        var latitudeDenominator = parseFloat(latitude.substring(latitude.lastIndexOf("/") + 1));

        if (isNaN(latitudeDegrees) || isNaN(latitudeFraction) || isNaN(latitudeDenominator) ||
            isNaN(longitudeDegrees) || isNaN(longitudeFraction) || isNaN(longitudeDenominator)) {
            res += "Invalid input\n";
        } else {
            var latitudeDecimal = latitudeDegrees + (latitudeFraction / latitudeDenominator);
            var longitudeDecimal = longitudeDegrees + (longitudeFraction / longitudeDenominator);

            var latitudeHemisphere = latitude.substring(latitude.lastIndexOf("/") + 1);
            var longitudeHemisphere = longitude.substring(longitude.lastIndexOf("/") + 1);

            if (latitudeHemisphere === "S") {
                latitudeDecimal = -latitudeDecimal;
            }

            if (longitudeHemisphere === "W") {
                longitudeDecimal = -longitudeDecimal;
            }

            res += latitudeDecimal.toFixed(4) + " ;" + longitudeDecimal.toFixed(4)  + "\n";
        }
    });

    editor.setValue(res);
}
function convertToNE(c='') {
    //console.log("toNE clicked")
    let txt = editor.getValue();
    //txt = txt.replace('°', ',').replace('/', ',');
    txt = txt.replace(/[^\d\n°,./]/g, '')

    txt = txt.replace('\n' , c+'\n')
    editor.setValue(txt);
}

// todo
function  convertToNE2(){
    let txt = editor.getValue();
    txt = txt.replace(/[^\d\n°,./]/g, '')
    var coordinateParts = txt.split('\n');

    for (var i = 0; i < coordinateParts.length; i++) {
        if (coordinateParts[i].includes(direction)) {
            var coordinateValue = coordinateParts[i]
                .replace(direction, '')
                .replace('°', '')
                .replace('\'', '')
                .replace('"', '');


        }
    }
}

function copier() {
    var txt = editor.getValue();
    navigator.clipboard.writeText(txt)
      .then(function() {
        console.log("Text copied to clipboard");
      })
      .catch(function(error) {
        console.error("Failed to copy text to clipboard:", error);
      });
  }

  function couper() {
    console.log("couper try")
    var txt = editor.getValue();

    // Temporarily focus the document
    var tempInput = document.createElement("input");
    document.body.appendChild(tempInput);
    tempInput.focus();
    document.execCommand("selectAll");

    // Copy the text to the clipboard
    navigator.clipboard.writeText(txt)
      .then(function() {
        editor.setValue(""); // Clear the editor after cutting
        console.log("Text cut to clipboard");
      })
      .catch(function(error) {
        console.error("Failed to cut text to clipboard:", error);
      })
      .finally(function() {
        // Clean up and restore focus
        document.body.removeChild(tempInput);
        editor.focus();
      });
  }

function coller() {
  navigator.clipboard.readText()
    .then(function(text) {
      editor.setValue(text); // Paste the text into the editor
      console.log("Text pasted from clipboard");
    })
    .catch(function(error) {
      console.error("Failed to paste text from clipboard:", error);
    });
}
