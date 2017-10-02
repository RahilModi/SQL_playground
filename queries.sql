/*Query - 1: Rewards five oldest users*/

SELECT * FROM users ORDER BY created_at LIMIT 5;

/*Query - 2: Which day of the week most users register on*/

--list all days count
SELECT DAYNAME(created_at) AS day, count(created_at) AS count FROM users GROUP BY day ORDER BY count DESC;

--found that 2 days have maximum count
SELECT DAYNAME(created_at) AS day, count(created_at) AS count FROM users GROUP BY day ORDER BY count DESC LIMIT 2;

/*Query - 3: find who has never posted a photo*/

SELECT username from users LEFT JOIN photos ON users.id = photos.user_id where image_url IS NULL;

-- find who has posted
SELECT DISTINCT(username) from users JOIN photos ON users.id = photos.user_id;
SELECT COUNT(DISTINCT(username)) from users JOIN photos ON users.id = photos.user_id;

--who has posted most photos
SELECT username, COUNT(username) as count from users JOIN photos ON users.id = photos.user_id GROUP BY users.id ORDER BY count DESC LIMIT 1;

/* Query - 4 most popular photos in terms of likes*/
SELECT photos.id, photos.image_url, COUNT(*) as count from photos JOIN likes ON photos.id = likes.photo_id GROUP BY photos.id ORDER BY count DESC LIMIT 1;

--Now find who has posted and when
SELECT username,users.created_at,photos.id, photos.image_url, COUNT(*) as count from photos JOIN likes ON photos.id = likes.photo_id JOIN users ON photos.user_id = users.id  GROUP BY photos.id ORDER BY count DESC LIMIT 1;


/* Query - 5 average posts per users */
SELECT(SELECT count(*) FROM photos)/(SELECT count(*) FROM users) AS Avg_posts_per_users;

/* Query - 6  5 Most popular hashtags */
SELECT tags.tag_name, count(*) AS num_used FROM photo_tags JOIN tags ON photo_tags.tag_id = tags.id GROUP BY tags.id ORDER BY num_used DESC LIMIT 5;

/* Query - 7  find who has liked most photos */
SELECT username,count(*) as num_likes_by_user FROM likes INNER JOIN users ON users.id = likes.user_id GROUP BY users.id HAVING num_likes_by_user = (SELECT count(*) FROM photos);

/* Query - 8 most discussed photos in terms of comments*/
SELECT users.id,username,photos.id, photos.image_url, count(comments.photo_id) as num_comments from comments JOIN photos ON comments.photo_id = photos.id JOIN users ON users.id = photos.user_id GROUP BY comments.photo_id ORDER BY num_comments DESC LIMIT 5;




