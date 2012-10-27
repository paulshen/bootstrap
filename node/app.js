var express = require('express');
require('ejs');
var expressLayouts = require('express-ejs-layouts')

var app = express();

// Configuration
app.configure(function() {
  app.set('view engine', 'ejs');
  app.use(expressLayouts)
  app.use(express.static(__dirname + '/public'));
});

app.get('/', function(req, res) {
  res.render('index.ejs');
});

app.listen(process.env.VMC_APP_PORT || 1337);
