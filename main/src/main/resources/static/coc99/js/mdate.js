


function currentDate(){

const currentDate = new Date();
const options = {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false
};
const formattedDateTime = currentDate.toLocaleString('en-US', options);

//console.log(formattedDateTime);
return formattedDateTime
}