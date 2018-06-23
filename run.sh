instance_name="GOMAP-base"
# --bind $PWD/test:/workdir \
singularity shell -C  \
    -W $PWD/tmp \
    -B mysql/lib:/var/lib/mysql \
    -B mysql/run:/var/run/mysqld \
    $instance_name.simg $@
# sudo singularity instance.stop $instance_name
# --bind $PWD/GO-MAP-data/mysql/run:/var/run/mysqld \
#HdhvFw&p3doo