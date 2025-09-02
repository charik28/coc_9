


async  function initMapExport(){

    await importScript("/cdn/leaflet/leaflet-image.js")


   // await importScript("/cdn/fileSaver/FileSaver.js")
    //await importScript("/cdn/jspdf.umd.min.js")
    //console.log('initMapExport();')


}


// Function to export the current view as an image (PNG)
function exportMapAsImage() {
    console.log('exportMapAsImage')
    leafletImage(map, function (err, canvas) {
        var img = document.createElement('img');

        if(map.getSize()) {
            var dimensions = map.getSize();

            img.width = dimensions.x;
            img.height = dimensions.y;
        }
        else {
            img.width = 2480  ;
            img.height = 3508 ;
        }
        console.log( 'img size : ',img.width ,img.height  )

        img.src = canvas.toDataURL();


        // Download the image
        downloadFile(img.src, 'exportMapAsImage.png');
    });
}
// Function to download a file
function downloadFile(url, fileName) {
    console.log( 'downloadFile :' ,url, fileName )
    var link = document.createElement('a');
    link.href = url;
    link.download = fileName;
    link.click();
}

// Function to export the current view as a PDF file
function exportMapAsPDF() {

    leafletImage(map, function (err, canvas) {
        var imgData = canvas.toDataURL('image/png');
        var doc = new jsPDF();
        doc.addImage(imgData, 'PNG', 10, 10);

        // Save the PDF file
        doc.save('map.pdf');
    });
}

// Function to export the current view as a Word (DOCX) file
function exportMapAsWord() {
    leafletImage(map, function (err, canvas) {
        var imgData = canvas.toDataURL('image/png');
        var content = '<html><body><img src="' + imgData + '"></body></html>';
        var options = {
            fileName: 'map.docx',
            mimeType: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            text: content,
        };

        // Download the Word file
        saveAs(options);
    });
}

initMapExport();
