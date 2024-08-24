SPOTIFY_DATASPOTIFY_DATA.PUBLICUSE ROLE ACCOUNTADMIN;

USE WAREHOUSE COMPUTE_WH;

SELECT * FROM SPOTIFY_DATA.PUBLIC.SPOTIFY;

create or replace TABLE SPOTIFY_DATA.PUBLIC.SPOTIFY (
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

--Data Checks
SELECT * FROM SPOTIFY 
LIMIT 20;

--COUNT Songs and Genre
SELECT genre, COUNT(track_id) AS track_counts
FROM spotify
GROUP BY genre
ORDER BY track_counts DESC
LIMIT 20;

--Top 20 most popular songs and their artits

SELECT track_name, track_popularity, artist_name
FROM spotify
ORDER BY track_popularity DESC
LIMIT 20;

--Track popularity by genre
SELECT UPPER(genre), AVG(track_popularity) AS avg_track_popularity
FROM spotify
GROUP BY genre
ORDER BY avg_track_popularity DESC
LIMIT 20;

--TOP 10 Artists
SELECT DISTINCT artist_name, followers
FROM SPOTIFY
ORDER BY followers DESC
LIMIT 10;

--Artists Tracks Counts
SELECT artist_name, COUNT(track_id) AS total_tracks
FROM SPOTIFY
GROUP BY artist_name
ORDER BY total_tracks DESC
LIMIT 20;

--Albums Popularity and Artists 
SELECT artist_name, album_name, MAX(album_popularity) AS most_popular_album
FROM SPOTIFY
GROUP BY artist_name, album_name
ORDER BY most_popular_album DESC
LIMIT 20;

--Avg duration of songs in different genre
SELECT genre, AVG(duration_sec) AS avg_duration
FROM spotify
GROUP BY genre
ORDER BY avg_duration DESC
LIMIT 20;


