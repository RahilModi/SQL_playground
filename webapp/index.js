
const mysql = require('mysql');
const express =  require('express');
const bodyparser = require('body-parser');
const app = express();

app.set("view engine","ejs");
app.use(bodyparser.urlencoded({extended: true}));
app.use(express.static(__dirname + '/public'));

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

app.get("/",(req,res)=>{
	//find out users from db
	var query = "SELECT COUNT(*) AS count FROM users";
	connection.query(query,(err,results)=>{
		if(err) throw err;
		console.log(results);
		let count = results[0].count;
		// res.send("we have "+ count +" users in our db");
		res.render("home",{data: count});
	});
});

app.post('/register',(req,res)=>{
	var email = req.body.email;
	console.log(email);
	var person = {
		email: req.body.email
	}

	//var another_way_query = "INSERT INTO users (email) VALUES (" + email + ")";

	var q = "INSERT INTO users SET ?";
	connection.query(q, person, (err,results)=>{
		if(err) {
			if(err.code == 'ER_DUP_ENTRY'){
				console.log(err.code);
			}else{
				throw err;
			}
		}else{
			console.log(results);
		}
	});
	//res.send("Thanks for Joining US");
	res.redirect("/");

});

app.listen(3456, ()=>{
	console.log("app is running on the port 3456!");
});
