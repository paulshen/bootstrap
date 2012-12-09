require.config({
  paths: {
    jquery: 'vendor/jquery-1.8.0.min',
    underscore: 'vendor/underscore-1.4.3.min',
    backbone: 'vendor/backbone-0.9.2.min'
  }
});

require([
  'app',
], function(App) {
  App.initialize();
});
