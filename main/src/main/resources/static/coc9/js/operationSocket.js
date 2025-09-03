/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

 var socket;
var op;
var er1,er2;
var sessionId;
function connect() {
    var socketUrl = "ws://localhost/socket/100";

    console.log("socketUrl:", socketUrl);

    if(!useSocketConncetion) {
        console.log('sockect is disabled')
        return
    }

    try {
        socket = new WebSocket(socketUrl);

        socket.onopen = function () {
            sessionId = socket.protocol;
            //if(sessionId)
             //   console.log("WebSocket connection opened. ID: ", sessionId);
        };

        socket.onmessage = function (event) {

            if (event.data.includes("sessionId:")) {
                sessionId = event.data.split(':')[1];
             //   console.log("Received session ID:", sessionId);
                return
            }
            console.log("onmessage" , event.data);

            //makeToastInfo("recived msg:" , event.data)

            printMsg("recived msg:" , event.data)
            //printNotification(16 , event.data , "now" )


        };

        socket.onclose = function () {
            console.log("WebSocket connection closed.");
        };

        socket.onerror = function (error) {
            er1=error
            logg("WebSocket connection error:", error);
        };
    } catch (error) {
        er2=error

        logg("Error occurred while establishing WebSocket connection:", error);
    }
}

function disconnect() {
    if (socket) {
        socket.close();
        socket = null;
        logg("WebSocket connection disconnected.");
    }
    else
        logg("socket undefined , WebSocket connection disconnected.");

}

function sendMessage() {
    var message = $("#message").val();

    if(!message)
        message = "hi from operation socket .js"
    if (socket && socket.readyState === WebSocket.OPEN) {
        socket.send(message);
        console.log("Sent message to server: " + message);
    }
}

function displayMessage(message) {
    console.log("socket msg: " + message)
    var messageDiv = $("#messageDiv");
    messageDiv.append("<p>" + message + "</p>");
}
//connect();


function logg(msg, level = 'error') {
    const timestamp = new Date().toISOString();

    if (level === 'error') {
        console.error(msg);
    } else {
        console.log(msg);
    }

    sendLogMessage(msg, level, timestamp);
}

function sendLogMessage(content, level, timestamp) {
    const logData = {
        level: level,
        timestamp: timestamp,
        content: content
    };

    const logDataString = JSON.stringify(logData);

    if(!socket || socket.readyState !== WebSocket.OPEN)
        connect();

    if (!socket || socket.readyState !== WebSocket.OPEN) {
        fetch('/log', {
            method: 'POST',
            body: logDataString
        })
            .catch(error => console.error('No socket connection', error));
    } else {
        socket.send(logDataString);
    }
}