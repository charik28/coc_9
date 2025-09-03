/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

function getLogEvt(){

}
// Get a reference to the element
var element = $0

// Get the click event listeners attached to the element
var clickListeners = getEventListeners($0).click;

// Loop through the click event listeners and log their definitions
clickListeners.forEach(function(listener) {
    console.log(listener.listener);
});


// v2
// Get a reference to the element
var element =$0// document.getElementById($0);



// Store the click event listeners in an array
var clickListeners = [];

// Define a function to track click event listeners
function trackClickListeners(event) {
    clickListeners.push(event);
}

// Attach the tracking function to the element's click event
element.addEventListener("click", trackClickListeners);

// Access the click event listeners from the array
clickListeners.forEach(function(listener) {
    console.log(listener);
});