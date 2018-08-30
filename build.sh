instance_name="GOMAP-base"
sudo rm -r $instance_name*
sudo singularity build -i $instance_name.simg Singularity.xenial
