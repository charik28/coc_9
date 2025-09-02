
/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */
function loadComponent(componentUrl, componentId = 'indexContentPlaceholder') {

    console.log("start loading ... " + componentUrl)
     return new Promise(function(resolve, reject) {
        if (config.cacheEnabled && 'caches' in window) {
            caches.match(componentUrl).then(response => {
                if (response) {
                    // Content exists in cache, use it
                    response.text().then(htmlContent => {
                        $('#' + componentId).html(htmlContent);
                        localStorage.setItem('currentPage', componentUrl);
                        resolve(componentId);
                    });
                } else {
                    componentUrl = config.prefix + componentUrl + config.sufix;
                    $.ajax({
                        url: componentUrl,
                        type: 'GET',
                        success: function(htmlContent) {
                            $('#' + componentId).html(htmlContent);
                            localStorage.setItem('currentPage', componentUrl);

                            // Cache the fetched content for future use
                            caches.open('htmlCache').then(cache => {
                                cache.put(componentUrl, new Response(htmlContent));
                            });
                            resolve(componentId);
                        },
                        error: function(xhr, status, error) {
                            console.log(error);
                            reject(xhr.statusText);
                        }
                    });
                }
            });
        } else {
            // Browser does not support caching, always fetch from server
            $.ajax({
                url: config.prefix+componentUrl,
                type: 'GET',
                success: function(htmlContent) {
                    console.log(" success -> resolving ...")
                    $('#' + componentId).html(htmlContent);
                   // localStorage.setItem('currentPage', componentUrl);
                    config.currentPageH = componentUrl;
                    localStorage.setItem('lastPageH', componentUrl);
                    //resolve(fragmentId);
                },
                error: function(xhr, status, error) {
                    console.log(error);
                    reject(xhr.statusText);
                }
            });
        }
    });
}

//todo logout lear storage data, cache data , session data , cookies...