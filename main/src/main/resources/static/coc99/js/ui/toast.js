function handleCreateEvent() {
    console.log('handleCreateEvent')
}



function makeToastError(title, response, autohide= true) {
    let body = response?.body?.message || "Unknown error";

    $(document).Toasts('create', {
        class: 'bg-danger text-white',
        title: title,
        body: body,
        icon: 'fas fa-times',
        autohide: true,
        delay: 7000
    });
}

function makeToastInfo(title, body) {
    console.error(title , body)
    $(document).Toasts('create', {
        class: 'bg-info text-white',
        title: title,
        body: body,
        icon: 'fas fa-info',
        autohide: true,
        delay: 5000
    });
}

    //$('body').on('created.lte.toast', handleCreateEvent)
