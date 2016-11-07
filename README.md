Scripts for dockerized da bitcore
====================================

This repo is for running dacash bitcore (with insight).

Note that the dacashd 0.12.1 binary with bitcore patches is pre-built here for convenience.

Requirements
----
Just docker.

All the scripts work with the assumptions that your user have enough priviledges to run `docker`. If it doesn't, you will need to run with `sudo`.

Getting the binary
------------------
You need to get the binary only once.

Three ways of getting the zcashd binary.

* install [git lfs](https://git-lfs.github.com/) before cloning this repo, it will be in `dashd` auto-magically

OR 

* `rm zcashd && wget https://github.com/runn1ng/dash-bitcore-docker/raw/master/dashd` 

OR

* build it in docker by `cd build && ./run.sh`; note that it takes quite a long time to build.

Install bitcore
-------
`./install.sh` for installing str4d version of bitcore libraries.

Clean up
--------
`sudo rm -rf nodedir` for cleaning up node modules (blockchain will stay). You will need to install again.

`sudo rm -rf datadir` for deleting blockchain.

Don't do when running.

Running
-------
`./run.sh`

Insight will be visible at `http://localhost`.

Don't run more than one insight.

Stopping
--------
`docker stop dash && docker rm dash`
