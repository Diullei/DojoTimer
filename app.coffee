chrome.experimental.app.onLaunched.addListener ->
    chrome.app.window.create 'index.html', {
        'width': 400,
        'height': 150
    }