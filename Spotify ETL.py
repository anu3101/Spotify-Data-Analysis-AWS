import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Script generated for node artists
artists_node1724155849406 = glueContext.create_dynamic_frame.from_options(format_options={"quoteChar": "\"", "withHeader": True, "separator": ",", "optimizePerformance": False}, connection_type="s3", format="csv", connection_options={"paths": ["s3://staging-spotify-data/artist-data.csv"], "recurse": True}, transformation_ctx="artists_node1724155849406")

# Script generated for node tracks
tracks_node1724155850194 = glueContext.create_dynamic_frame.from_options(format_options={"quoteChar": "\"", "withHeader": True, "separator": ",", "optimizePerformance": False}, connection_type="s3", format="csv", connection_options={"paths": ["s3://staging-spotify-data/tracks-data.csv"], "recurse": True}, transformation_ctx="tracks_node1724155850194")

# Script generated for node albums
albums_node1724155848665 = glueContext.create_dynamic_frame.from_options(format_options={"quoteChar": "\"", "withHeader": True, "separator": ",", "optimizePerformance": False}, connection_type="s3", format="csv", connection_options={"paths": ["s3://staging-spotify-data/albums-data.csv"], "recurse": True}, transformation_ctx="albums_node1724155848665")

# Script generated for node Join Artist and Album
JoinArtistandAlbum_node1724155918150 = Join.apply(frame1=albums_node1724155848665, frame2=artists_node1724155849406, keys1=["id_artist"], keys2=["artist_id"], transformation_ctx="JoinArtistandAlbum_node1724155918150")

# Script generated for node Join Tracks
JoinTracks_node1724155957092 = Join.apply(frame1=JoinArtistandAlbum_node1724155918150, frame2=tracks_node1724155850194, keys1=["track_id"], keys2=["id_tracks"], transformation_ctx="JoinTracks_node1724155957092")

# Script generated for node Drop Fields
DropFields_node1724155993969 = DropFields.apply(frame=JoinTracks_node1724155957092, paths=["id_tracks", "id_artist"], transformation_ctx="DropFields_node1724155993969")

# Script generated for node Destination
Destination_node1724157466345 = glueContext.write_dynamic_frame.from_options(frame=DropFields_node1724155993969, connection_type="s3", format="csv", connection_options={"path": "s3://clean-spotify-data-anu", "compression": "gzip", "partitionKeys": []}, transformation_ctx="Destination_node1724157466345")

job.commit()