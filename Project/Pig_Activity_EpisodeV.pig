episodeV_dialouges_table = LOAD 'hdfs:///user/root/episodeV_dialouges.txt' USING PigStorage('\t') AS (Character_Name:chararray,Dialouges:chararray);
episodeV_dialouges_group = GROUP episodeV_dialouges_table BY Character_Name;
count_episodeV_dialouges= FOREACH episodeV_dialouges_group GENERATE group, COUNT(episodeV_dialouges_table) AS cnt;
order_episodeV_dialouges= ORDER count_episodeV_dialouges BY cnt DESC;
STORE order_episodeV_dialouges INTO 'hdfs:///user/root/results/episodeV_dialouges_results';
