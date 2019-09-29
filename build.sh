instance_name="GOMAP-base"
sudo rm -r $instance_name*
mkdir tmp
sudo singularity build --tmpdir tmp $instance_name.sif Singularity
