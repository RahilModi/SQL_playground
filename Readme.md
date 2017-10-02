# sql practice

1) ig_clone.sql => to create databse and tables like users, photos, likes,comments,followers, tags, photo_tags

2) ig_clone_data.sql => to populate tables with large dataset

3) queries.sql => executes few queries.

run all sql files using **source sql_file_name** in mysql.  

---------------------------------------------------------------------------------------------------------------------------
Modify app.js with mysql username, password and database name to connect Mysql.  

Install faker and mysql module using following commands  
**npm install faker mysql**  

Run **node app.js**  

Above command will create users table and populate it with real type but fake data of 500 users.  

-----------------------------------------------------------------------------------------------------------------------------

Modify index.js with mysql username, password and database name to connect Mysql.  

Webapp folder contains solution of webapp:  
Run following copmmands  
**1. npm install => install depended modules  
2. nodemon**

Now web app is running on localhost at port 3456. **http://localhost:3456**

This web app is basically for how to connect node app to mysql.  
Once user register with email id count of registered users will be incremented by 1.  
When user attempts to enter same email-id more than once will not inserted into table and count will not be updated.












