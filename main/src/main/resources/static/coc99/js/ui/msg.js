var audio //= new Audio('wav/mixkit-positive-notification-951.wav');


function printMsg( sender, body, time,href='#', img = "./img/user1-128x128.jpg") {
    //todo msg count

    var msg =
        '<a href='+
        href +
        'class="dropdown-item">' +
        '<div class="media">' +
        '<img src="' +
        img +
        '" alt="User Avatar" class="img-size-50 mr-3 img-circle">' +
        '<div class="media-body">' +
        '<h3 class="dropdown-item-title">' +
        sender +
        '<span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>' +
        '</h3>' +
        '<p class="text-sm">' +
        body +
        '</p>' +
        '<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i>' +
        time +
        '</p>' +
        '</div>' +
        '</div>' +
        '</a>' +
        '<div class="dropdown-divider"></div>';

    var msgContainer = document.getElementById('msg-container');

    if(msgContainer&&msgContainer.innerHTML) {
        msgContainer.innerHTML = msg + msgContainer.innerHTML;
        var msgCount = parseInt( document.getElementById('navbar-badge').innerText)

        document.getElementById('navbar-badge').innerText=msgCount+1;

        try{
            audio.play();
            
        }catch (e) {

        }
    }
}

//printMsg("Abbdessamie", "Hello, how are you?", "9:30 AM", "./img/avatar5.png");


// todo
function printNotification(count,body,time ,href='"#"' ,icon='<i className="fas fa-envelope mr-2"></i>' ){
    if(count)
        notificationCount=count;

    var notification =
    '<span className="dropdown-item dropdown-header">' +
        notificationCount +
        ' Notifications</span>'+
        '<div className="dropdown-divider"></div>'+
    '<a href="+' +
        href +
        'className="dropdown-item">'+
    icon+
        '<br>'+
        body+
        '<br><span className="float-right text-muted text-sm">'+
        time+
        '</span>' +
        '</a>'+
        ' <div class="dropdown-divider"></div>\n' +
        '        <a href="#" class="dropdown-item">\n' +
        '          <i class="fas fa-file mr-2"></i> 3 nouveaux rapports\n' +
        '          <span class="float-right text-muted text-sm">2 jours</span>\n' +
        '        </a>\n'
       /* +'        <div class="dropdown-divider"></div>' +
        '<a href="#" className="dropdown-item dropdown-footer">Voir toutes les notifications</a>'
*/

    var notifications_container = document.getElementById('notifications_container');

    if(notifications_container && notifications_container.innerHTML)
    notifications_container.innerHTML = notification + notifications_container.innerHTML;
    audio.play();

}
//printNotification(16 , "new  Notification" , "now" )
