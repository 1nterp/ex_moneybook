var express    = require('express');
var mysql      = require('mysql');
var dbconfig   = require('./config/database.js');
var connection = mysql.createConnection(dbconfig);

var app        = express();
var bodyParser = require('body-parser');
var pg = require('pg');

// configuration ===============================================================
app.set('port', process.env.PORT || 3000);
app.use(bodyParser.urlencoded({ extended : true }));
app.use(bodyParser.json());

// routing ===============================================================
app.get('/', function(req, res){

  pg.defaults.ssl = true;
  pg.connect(process.env.DATABASE_URL, function(err, client) {
    if (err) throw err;
    console.log('Connected to postgres! Getting schemas...');

    client
      .query('SELECT table_schema,table_name FROM information_schema.tables;')
      .on('row', function(row) {
        console.log(JSON.stringify(row));
      });
  });
  res.send('Root');
});

app.get('/person', function(req, res) {
  connection.query('SELECT * from person', function(err, rows) {
    if(err) throw err;
    res.json(rows);
  });
});

app.post('/person', function(req, res) {
      console.log(req.headers);
        console.log(req.body);
  var person = {
    'id'   : req.body.id,
    'name' : req.body.name,
    'age'  : req.body.age
  };

  var queryStr = connection.query('INSERT INTO person set ?', person, function(err, rows) {
    if(err) throw err;
    res.status(200).send('success')
  });
});

app.listen(app.get('port'), function () {
  console.log('Express server listening on port ' + app.get('port'));
});
