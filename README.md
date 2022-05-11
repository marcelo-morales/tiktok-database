# tiktok-database
Marcelo Morales - lmoral10
Peter Novello - pnovell1

# Comments and Concerns

During Phase C of the project, we explained to our CA mentor that we were unable to find reliable data to support
our ambitions of performing queries on our data based on the revenue a song featured on TikTok has generated. Thus,
we decided to use websites explaining the estimation of how much revenue can be generated based on the number of streams
a song receives on a major platform, such as Spotify. We then estimated the revenue each song could have made and paired the revenues with the specific audio id for each of the songs looked at in our database. We hope that this estimation can 
still allow us to bring in our economic domain of interest and compare the popularity, likes, and other characteristics of a 
tiktok video against certain revenue indicators to make the project more interesting. 

Updates for Phase D: We were able to run interesting queries based on the data we have populated in our tables. We will
keep brainstorming to see if we can answer even more interesting questions for the final phase of the project. For the moment, no modifications are needed.

Updates for Phase E: We were able to succesfully implement graphs and devise more creative queries with our data sets. 

# Run set up script

To run the set up script, make you are in the most outmost directory and run 
  ```bash
python set_up_tiktok_info.py 
```
so that your txt files can be filled with data.
Once you are connected to the appropriate database, ensure that you run setup.sql to correctly set up the database. An example of 
running setup.sql would be
  ```bash
mysql -h dbase.cs.jhu.edu -u StaffUsername -D DBName -p < setup.sql
```

in the dbase_setup directory. To run run the smaller version for testing purposes, a user would run
  ```bash
mysql -h dbase.cs.jhu.edu -u StaffUsername -D DBName -p < setup-small.sql
```


