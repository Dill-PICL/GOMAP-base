## Automating Build on Singularituy-hub
* Have to install the securebuild version to test whether any of the instructions are failing. Get the commands from [github](https://github.com/singularityware/singularity-python/blob/master/singularity/build/scripts/singularity-prepare-instance.sh#L55)
* Use the isolated tag with the build command to simulate build environment on singularity-hub

git clone -b vault/release-2.5 https://github.com/singularityware/singularity.git
./autogen.sh
./configure --prefix=/usr/local && make && sudo make install && sudo make secbuildimg

The securebuild was not the problem for evlab machine. The TMPDIR being set was the problem
