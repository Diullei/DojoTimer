chrome.experimental.app.onLaunched.addListener ->
    chrome.app.window.create 'index.html', {
        'width': 410,
        'height': 150
    }