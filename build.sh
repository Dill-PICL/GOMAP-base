instance_name="GOMAP-base"
sudo rm -r $instance_name*
sudo singularity build $instance_name.sif Singularity
