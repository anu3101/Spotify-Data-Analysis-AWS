# Youtube-Data-Analysis-AWS
# Project Overview
This project aims to analyze YouTube trending data for three countries: the USA, India, and Canada. The analysis involves storing the data in AWS, performing ETL operations using AWS Glue, querying the data in Amazon Redshift, and creating visualizations with Amazon QuickSight. <br>
# Tools and Technologies
AWS S3: Data Storage for raw and processed data.
AWS Glue: Data Cleaning and manipulation AND ETL
AWS Glue: ETL service to transform and prepare data. <br>
Amazon Redshift: Data warehouse for storing and querying processed data. <br>
Amazon QuickSight: Business intelligence tool for creating visualizations and dashboards. <br>
# Steps Involved <br>
<h2>Data Collection <h2>
Data Source: YouTube trending data for the USA, India, and Canada in CSV format.<br>
Data Attributes: The CSV files contain attributes such as video ID, trending date, title, channel title, category, publish time, tags, views, likes, dislikes, comment count, thumbnail link, comments disabled, ratings disabled, video error or removed, and description.<br>
<h2>Data Storage<h2>
Amazon S3: The collected CSV files are stored in Amazon S3, a scalable storage solution provided by AWS. Each country’s data is stored in a separate S3 bucket or folder for better organization.
<h2>ETL Process using AWS Glue<h2>
AWS Glue Setup: AWS Glue is set up to perform Extract, Transform, Load (ETL) operations on the data.<br>
Crawlers: AWS Glue Crawlers are configured to scan the data in the S3 buckets, infer the schema, and create metadata tables in the AWS Glue Data Catalog. <br>
Glue Jobs: AWS Glue Jobs are created to transform the data. This includes cleaning the data (handling missing values, correcting data types), filtering out irrelevant information, and enriching the data (e.g., adding derived fields like the country code). <br>
<h2>Data Storage in Amazon Redshift <h2>
Redshift Cluster: An Amazon Redshift cluster is set up to store the processed data. <br>
Tables Creation: Tables are created in Redshift to store the transformed YouTube data. <br>
Data Loading: The transformed data from AWS Glue is loaded into these Redshift tables. This can be done using the COPY command, which efficiently loads large datasets from S3 into Redshift. <br>
<h2> Data Analysis and Visualization with Amazon QuickSight <h2>
Data Source Connection: Amazon QuickSight is connected to the Amazon Redshift cluster to access the YouTube data. <br>
Visualizations: Various visualizations are created to analyze trends and patterns in the YouTube data. This includes charts, graphs, and dashboards. <br>

# Outcomes and Benefits
Comprehensive Analysis: The project provides insights into YouTube trending videos across different countries. <br>
Scalability: Using AWS services ensures the solution is scalable and can handle large volumes of data. <br>
Automation: The ETL process is automated using AWS Glue, reducing manual effort and potential errors. <br>
Interactive Dashboards: QuickSight enables the creation of interactive dashboards, making it easier to explore and share insights. <br>
This project demonstrates a robust end-to-end data pipeline using AWS services, from data collection and storage to transformation, analysis, and visualization. <br>
