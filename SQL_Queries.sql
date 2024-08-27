SPOTIFY_DATASPOTIFY_DATA.PUBLICUSE ROLE ACCOUNTADMIN;

USE WAREHOUSE COMPUTE_WH;

CREATE TABLE SPOTIFY_DATA.PUBLIC.SPOTIFY (
	ARTIST_ID VARCHAR(500),
	ARTIST_NAME VARCHAR(500),
	ARTIST_POPULARITY NUMBER(38,0),
	FOLLOWERS NUMBER(38,0),
	GENRE VARCHAR(500),
	TRACK_NAME VARCHAR(500),
	TRACK_ID VARCHAR(500),
	TOTAL_TRACKS NUMBER(38,0),
	ALBUM_NAME VARCHAR(500),
	RELEASE_DATE VARCHAR(500),
	LABEL VARCHAR(500),
	ALBUM_POPULARITY NUMBER(38,0),
	ALBUM_ID VARCHAR(5SPOTIFY_DATA.INFORMATION_SCHEMASPOTIFY_DATA.PUBLIC00),
	DURATION_SEC NUMBER(10,5),
	TRACK_POPULARITY NUMBER(38,0)
);

UPDATE spotify
SET Genre='Unknown'
WHERE genre ='Not_known';

SELECT * FROM SPOTIFY 
LIMIT 20;

--Count total tracks in data
SELECT COUNT(track_id) AS total_tracks FROM spotify;

--Count unique artists
SELECT COUNT(DISTINCT artist_name) AS unique_artists 
FROM spotify;

--List all unique genres
SELECT DISTINCT genre 
FROM spotify
WHERE genre IS NOT NULL;

--Most 5 popular artists
SELECT DISTINCT artist_name, followers 
FROM spotify
ORDER BY followers DESC 
LIMIT 5;


--Average duration in min
SELECT ROUND(AVG(duration_sec/60),2) AS avg_duration_sec 
FROM SPOTIFY;

--Albums with more than 50 songs
SELECT album_name, total_tracks 
FROM spotify
WHERE total_tracks > 50
GROUP BY album_name, TOTAL_TRACKS
ORDER BY total_tracks DESC;


--Top 20 most popular songs and their artits
SELECT track_name, track_popularity, artist_name
FROM spotify
ORDER BY track_popularity DESC
LIMIT 20;

--COUNT genre wise tracks
SELECT genre, COUNT(track_id) AS track_counts
FROM spotify
GROUP BY genre
ORDER BY track_counts DESC
LIMIT 20;


--Average Genre Popularity
SELECT UPPER(genre), AVG(track_popularity) AS avg_track_popularity
FROM spotify
GROUP BY genre
ORDER BY avg_track_popularity DESC
LIMIT 20;


--Most songs by artists
SELECT artist_name, COUNT(track_id) AS total_tracks
FROM SPOTIFY
GROUP BY artist_name
ORDER BY total_tracks DESC
LIMIT 20;

--Most popular albums of artists
SELECT artist_name, album_name, MAX(album_popularity) AS most_popular_album
FROM SPOTIFY
GROUP BY artist_name, album_name
ORDER BY most_popular_album DESC
LIMIT 20;

-- Average Songs duration in differnet genre
SELECT genre, AVG(duration_sec) AS avg_duration
FROM spotify
GROUP BY genre
ORDER BY avg_duration DESC
LIMIT 20;

--Top 10 songs of Taylor Swift
SELECT track_name, track_popularity 
FROM spotify
WHERE artist_name = 'Taylor Swift' 
ORDER BY track_popularity DESC 
LIMIT 10;


SELECT genre, track_name, track_popularity
FROM (
    SELECT genre, track_name, track_popularity,
           ROW_NUMBER() OVER (PARTITION BY genre ORDER BY track_popularity DESC) AS rank
    FROM spotify
) AS ranked_tracks
WHERE rank <= 3;

SELECT DISTINCT artist_name, track_name, release_date
FROM spotify AS outer_table
WHERE release_date = (
    SELECT MAX(release_date)
    FROM spotify AS inner_table
    WHERE inner_table.artist_name = outer_table.artist_name
);

