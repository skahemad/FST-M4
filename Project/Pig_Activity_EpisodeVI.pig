episodeVI_dialouges_table = LOAD 'hdfs:///user/root/episodeVI_dialouges.txt' USING PigStorage('\t') AS (Character_Name:chararray,Dialouges:chararray);
episodeVI_dialouges_group = GROUP episodeVI_dialouges_table BY Character_Name;
count_episodeVI_dialouges= FOREACH episodeVI_dialouges_group GENERATE group, COUNT(episodeVI_dialouges_table) AS cnt;
order_episodeVI_dialouges= ORDER count_episodeVI_dialouges BY cnt DESC;
STORE order_episodeVI_dialouges INTO 'hdfs:///user/root/results/episodeVI_dialouges_results';
