instance_name="GOMAP-base"
sudo rm -r $instance_name*
sudo singularity build --tmpdir tmp $instance_name.simg Singularity
