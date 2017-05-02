var express    = require('express');

var app        = express();
var bodyParser = require('body-parser');

// configuration ===============================================================
app.set('port', process.env.PORT || 3000);
app.use(bodyParser.urlencoded({ extended : true }));
app.use(bodyParser.json());
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

// routing ===============================================================
app.get('/', function(req, res){
    res.render('test2.html');
});

app.listen(app.get('port'), function () {
  console.log('Express server listening on port ' + app.get('port'));
});
