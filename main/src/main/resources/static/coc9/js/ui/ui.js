


var dropdownMenu = document.querySelector('.dropdown-menu.dropdown-menu-lg.dropdown-menu-right');

if (dropdownMenu) {
    dropdownMenu.innerHTML += msg;
}




//https://adminlte.io/docs/3.0/javascript/push-menu.html
function  toggleSideBare(){
$('[data-widget="pushmenu"]').PushMenu('toggle')
}


var options= {
    autoCollapseSize :true,
    enableRemember:true,
    noTransitionAfterReload:true

}
$('.sidebar-toggle-btn').PushMenu(options)



/**
 * Toggles the loading screen visibility.
 * @param {boolean} show - Determines whether to show or hide the loading screen.
 */
function toggleLoadingScreen(show) {
    //todo complete

    const layout = $.AdminLTE.layout;
    show ? layout.activate() : layout.deactivate();
}

/**
 * Toggles the loading state of buttons.
 * @param {boolean} Loading - Determines whether to show or hide the loading state on buttons.
 */
function toggleLoadingButton(Loading, btnId) {
    const loadingButton = $('.'+btnId);
    Loading ? loadingButton.addClass('disabled').attr('disabled', true) :
        loadingButton.removeClass('disabled').removeAttr('disabled');
}
function toggleLoadingMouce(Loading ){
    if(Loading)
        $('body').css('cursor', 'progress');
    else
        $('body').css('cursor', 'default');
}