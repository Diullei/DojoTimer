// Generated by CoffeeScript 1.3.3
(function() {

  chrome.experimental.app.onLaunched.addListener(function() {
    return chrome.app.window.create('index.html', {
      'width': 410,
      'height': 150
    });
  });

}).call(this);
