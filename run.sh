instance_name="GOMAP-base"
# --bind $PWD/test:/workdir \
singularity shell -c GOMAP-base $@
# sudo singularity instance.stop $instance_name
# --bind $PWD/GO-MAP-data/mysql/run:/var/run/mysqld \