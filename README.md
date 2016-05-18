# grappa-starcluster

## Setup

[Install StarCluster](http://star.mit.edu/cluster/docs/latest/installation.html).

Create your config file by running `python create_config.py`. The config is
written to `grappacluster.config`.

## Launch a cluster

Start a new cluster named `mygrappacluster`. See starcluster for other options.

```bash
starcluster -c grappacluster.config start -s 2 -i r3.xlarge mygrappacluster
```

When the cluster has started, ssh into the master.

```bash
starcluster -c grappacluster.config sshmaster
``` 

## Use the cluster

grappa-starcluster uses starcluster's default sgeadmin user for running MPI jobs.
We suggest using sgeadmin for everything, other than when you require root. 

```bash
su sgeadmin
cd ~
```

In the home directory, you'll find `grappa/` with everything already default configured and
installed. If you ever need to re-configure, you can use the command in `~/build_grappa.sh`.

Let's run an example job to make sure things work.

```bash
cd ~/grappa/build/Make+Release
make -j demo-hello_world
mpirun -np 12 -- applications/demos/hello_world.exe
```

## Rebuilding your own AWS image

Coming soon...
