var express    = require('express');
var mysql      = require('mysql');
var dbconfig   = require('./config/database.js');
var connection = mysql.createConnection(dbconfig);

var app        = express();
var bodyParser = require('body-parser');

var selectQuery = "select DATE_FORMAT(i.datetime, '%Y/%m/%d') as datetime, " +
                  "       m.name as main_category, s.name as sub_category, " +
                  "       i.contents, p.name as payment, i.income, i.outcome" +
                  "  from   item i, mcat m, scat s, payment p" +
                  "  where i.mcat_id = m.id and i.scat_id = s.id and i.payment_id = p.id;";

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

app.get('/item', function(req, res) {
  connection.query(selectQuery, function(err, rows) {
    if(err) throw err;
    res.json(rows);
    console.log(rows);
  });
});

app.get('/main_category', function(req, res) {
  connection.query("select * from mcat", function(err, rows) {
    if(err) throw err;
    res.json(rows);
    console.log(rows);
  });
});

app.get('/sub_category', function(req, res) {
    console.log(req.params);
    connection.query("select * from scat s where s.mcat_id = ?", req.params.mcat_id, function(err, rows) {
    if(err) throw err;
    res.json(rows);
    console.log(rows);
  });
});

//app.post('/item', function(req, res) {
//  var item = {
//    'datetime'   : req.body.datetime,
//    'mcat_id'    : req.body.mcat_id,
//    'scat_id'    : req.body.scat_id,
//    'contents'   : req.body.contents,
//    'payment_id' : req.body.payment_id,
//    'income'     : req.body.income,
//    'outcome'    : req.body.outcome
//  };
//
//  var queryStr = 'insert into item(datetime, mcat_id, scat_id, contents, payment_id, income, outcome) set ?';
//  var queryEx = connection.query(queryStr, item, function(err, rows) {
//    if(err) throw err;
//    res.status(200).send('success')
//  });
//});

app.listen(app.get('port'), function () {
  console.log('Express server listening on port ' + app.get('port'));
});
