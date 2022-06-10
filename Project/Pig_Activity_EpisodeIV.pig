episodeIV_dialouges_table = LOAD 'hdfs:///user/root/episodeIV_dialouges.txt' USING PigStorage('\t') AS (Character_Name:chararray,Dialouges:chararray);
episodeIV_dialouges_group = GROUP episodeIV_dialouges_table BY Character_Name;
count_episodeIV_dialouges= FOREACH episodeIV_dialouges_group GENERATE group, COUNT(episodeIV_dialouges_table) AS cnt;
order_episodeIV_dialouges= ORDER count_episodeIV_dialouges BY cnt DESC;
STORE order_episodeIV_dialouges INTO 'hdfs:///user/root/results/episodeIV_dialouges_results';