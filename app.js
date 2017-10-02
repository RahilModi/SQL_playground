const faker = require('faker');
const mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: <username>,
	password: <password>,
	database: <Database_name>
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});


//creates users table in join_us database
var query ='CREATE TABLE users ( email VARCHAR(255) PRIMARY KEY, created_at TIMESTAMP DEFAULT now() );'
connection.query(query, (err,results)=>{
	if(err) throw err;
	console.log(results);
});

//generating fake data using faker
var data = [];
for ( var i = 0 ; i < 500 ; i++ ) {
	data.push([
		faker.internet.email(),
		faker.date.past()
	]);
}

var query = 'INSERT INTO users (email,created_at) VALUES ?';
connection.query(query, [data], (err,results)=>{
	if(err) throw err;
	console.log(results);
});

connection.end();