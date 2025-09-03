/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

importScript('cdn/xlsx.full.min.js')

document.getElementById('filePickerBtn').addEventListener('click', function() {
    var fileInput = document.createElement('input');
    fileInput.type = 'file';
    fileInput.accept = '.xlsx'; // Specify the allowed file types here

    fileInput.onchange = function(event) {
        var file = event.target.files[0];

        var reader = new FileReader();
        reader.onload = function(e) {
            var data = new Uint8Array(e.target.result);
            var workbook = XLSX.read(data, { type: 'array' });

            var worksheet = workbook.Sheets[workbook.SheetNames[0]];
            var jsonData = XLSX.utils.sheet_to_json(worksheet);
            var html = XLSX.utils.sheet_to_html(worksheet);
            //console.log(html)

          //  displaySheetAsHtml(html)

            var jsonContent = JSON.stringify(jsonData, null, 2);

            editor.setValue(jsonContent);
            addOrgJsonToMap(jsonData)
        };

        reader.readAsArrayBuffer(file);
    };

    fileInput.click();
});
function displaySheetv3(html) {
    var table = $('#example1').DataTable({
        scrollX: true,
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
}
function displaySheetAsHtml(html){
    document.getElementById("example1").innerHTML = html;

    //displaySheetv3(html)

}

// whene no header is the excel file:
function displaySheetNoHeader(html) {
    var table = $('#example1').DataTable({
        scrollX: true,
         }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

// Convert the HTML string to a DOM object
    var parser = new DOMParser();
    var doc = parser.parseFromString(html, 'text/html');

    //todo if not contains th headers do:
// Find the first row in the table body
    var table = doc.querySelector('table');
    var firstRow = table.querySelector('tr'); // todo can be tbody?
    //console.log(firstRow)

// Convert the first row's <td> elements to <th> elements
    var thElements = Array.from(firstRow.querySelectorAll('td'))
        .map(function(td) {
            var th = document.createElement('th');
            th.textContent = td.textContent;
            return th;
        });

// Replace the <td> elements with <th> elements in the first row
    while (firstRow.firstChild) {
        firstRow.firstChild.remove();
    }
    thElements.forEach(function(th) {
        firstRow.appendChild(th);
    });

// Convert the modified DOM object back to an HTML string
    //html = doc.documentElement.outerHTML;

    table.innerHTML=(html);
    console.log(html)
/*
    $("#example1").DataTable(
        {
            "responsive": true, "lengthChange": true, "autoWidth": true,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
*/

    $("#example1").DataTable()

    /*
    // Check if DataTable is already initialized
    if (!$.fn.DataTable.isDataTable(table)) {
        table.innerHTML=(html);
        table.DataTable({
            responsive: true,
            lengthChange: true,
            autoWidth: true,
            paging: true,
            searching: true,
            ordering: true,
            info: true
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    } else {
        table.DataTable().destroy();

        table.innerHTML = (html);

        table.DataTable({
            responsive: true,
            lengthChange: true,
            autoWidth: true,
            paging: true,
            searching: true,
            ordering: true,
            info: true
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    }*/
}
function displaySheetHtmlParser(jsonData) {
    var table = document.getElementById('example1');
    var html = '';

    // Generate the table headers
    html += '<thead><tr>';
    if (Array.isArray(jsonData[0])) {
        jsonData[0].forEach(function (header) {
            html += '<th>' + header + '</th>';
        });
    } else console.log("no array headers")
    html += '</tr></thead>';

    // Generate the table body
    html += '<tbody>';
    for (var i = 1; i < jsonData.length; i++) {
        if (Array.isArray(jsonData[i])) {
            html += '<tr>';
            jsonData[i].forEach(function (cell) {
                html += '<td>' + cell + '</td>';
            });
            html += '</tr>';
        }
    }
    html += '</tbody>';
    console.log(html)

    table.innerHTML = html;
    // Initialize the DataTable plugin
    $("#example1").DataTable({
        responsive: true,
        lengthChange: true,
        autoWidth: true,
       // paging: true,
        searching: true,
       // ordering: true,
       // info: true
    });
}



function  addFictive(orgJson){
    // orgJson = JSON.parse(orgJson)
    var count=0;
    for (var i = 0; i < orgJson.length; i++) {
        var obj = orgJson[i];

        if(obj.dr ){
            var dr=Get0rgIdByName(obj.org) // IDD ou DR
        }
        if(obj.idd ){
            var idd=GetBRIGADEIdByName(obj.org) // IDD ou DR
        }
        var brigadeId=GetBRIGADEIdByName(obj.org) // IDD ou DR


        if(!obj.latitude || !obj.longitude)
        {
            //console.log()
            console.error(obj, "no latitude or longitude on this obj")
            continue
        }
        //todo var icon = obj.type
        try {
            var marker = L.marker(
                [obj.latitude, obj.longitude],
                {icon: getMarkerIcon(iconUrl = 'drd.png', iconSize = 16)}
            );
            count++;
        }catch(err) {
            console.log(i , err.message)
            continue
        }
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

        marker.addTo(map);
        // notRemovableMarkers.add(marker);
    }
    console.log(count , " marker founded")

    info.update = function (obj) {
        // console.log("update", obj);
        this._div.innerHTML = obj ? CreateMarkerTable(obj) : '';
    };

    info.addTo(map);

}
