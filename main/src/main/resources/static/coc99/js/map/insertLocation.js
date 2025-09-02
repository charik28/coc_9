
/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */
//console.log('testtt15')

//longitudeDMS.addEventListener("keyPress", keyPressed(e));

function keyPressed (event) {
    // console.log('key')
    if (event.key === "Enter") {
        //   console.log("Enter key Pressed!");
        convertToDD()
    }
}

document.getElementById('longitudeDMS').addEventListener("keypress", keyPressed);
document.getElementById('latitudeDMS').addEventListener("keypress", keyPressed);


function keyPressed2 (event) {
    // console.log('key')
    if (event.key === "Enter") {
        //   console.log("Enter key Pressed!");
        convertToDMS()
    }
}

document.getElementById('latitudeDD').addEventListener("keypress", keyPressed2);
document.getElementById('longitudeDD').addEventListener("keypress", keyPressed2);