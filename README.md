# dockerfiles
Random assortment of dockerfiles for personal use


```
docker run --rm docker.izmno.be/dockerfiles/gh-ost:latest \
--max-load=Threads_running=25 \
--critical-load=Threads_running=1000 \
--chunk-size=1000 \
--max-lag-millis=1500 \
--conf=credentials.cnf \
--host=delta-master.c43tl6ffxg8d.eu-west-1.rds.amazonaws.com \
--database="delta_production" \
--table="HourlyMarketCaps" \
--verbose \
--alter="PARTITION BY HASH(TO_DAYS(time)) PARTITIONS 100;" \
--switch-to-rbr \
--allow-master-master \
--allow-on-master \
--cut-over=default \
--exact-rowcount \
--concurrent-rowcount \
--default-retries=120 \
--execute 
;