var express    = require('express');
var mysql      = require('mysql');
var dbconfig   = require('./config/database.js');
var connection = mysql.createConnection(dbconfig);

var app        = express();
var bodyParser = require('body-parser');

var selectQuery = "select i.id, DATE_FORMAT(i.item_date, '%Y-%m-%d') as item_date, " +
                  "       m.name as main_category, s.name as sub_category, " +
                  "       i.contents, p.name as payment, i.income, i.outcome" +
                  "  from   item i, mcat m, scat s, payment p" +
                  "  where i.mcat_id = m.id and i.scat_id = s.id and i.payment_id = p.id" +
                  "        and month(i.item_date) = ? and year(i.item_date) = ?;";

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
  var sql = selectQuery;
  var binds = [req.query.target_month, req.query.target_year]
  sql = mysql.format(sql, binds)
  
  connection.query(sql, function(err, rows) {
    if(err) throw err;
    res.json(rows);
  });
});

app.get('/main_category', function(req, res) {
  connection.query("select * from mcat", function(err, rows) {
    if(err) throw err;
    res.json(rows);
  });
});

app.get('/sub_category', function(req, res) {
    connection.query("select * from scat s where s.mcat_id = ?", req.query.mcat_id, function(err, rows) {
    if(err) throw err;
    res.json(rows);
  });
});

app.get('/payment', function(req, res) {
  connection.query("select * from payment", function(err, rows) {
    if(err) throw err;
    res.json(rows);
  });
});

app.post('/item', function(req, res) {
  var item = {
    'item_date'  : req.query.item_date,
    'mcat_id'    : req.query.mcat_id,
    'scat_id'    : req.query.scat_id,
    'contents'   : req.query.contents,
    'payment_id' : req.query.payment_id,
    'income'     : req.query.income,
    'outcome'    : req.query.outcome
  };
  
  if (req.query.income == null) {
    item.income = 0;
  }
  
  if (req.query.outcome == null) {
    item.outcome = 0;
  }
 
  var queryStr = 'insert into item set ?';
  var queryEx = connection.query(queryStr, item, function(err, rows) {
    if(err) throw err;    
    res.status(200).json(rows);
  });
});

app.delete('/item', function(req, res) {
    connection.query("delete from item where id = ?", req.query.item_id, function(err, rows) {
    if(err) throw err;
    res.json(rows);
  });
});

app.listen(app.get('port'), function () {
  console.log('Express server listening on port ' + app.get('port'));
});
