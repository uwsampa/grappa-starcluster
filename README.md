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

Do this once to create your MPI host file
```bash
grep 'node[0-9]\|master' /etc/hosts >~/hosts
```

In the home directory, you'll find `grappa/` with everything already default configured and
installed. If you ever need to re-configure, you can use the command in `~/build_grappa.sh`.

Let's run an example job to make sure things work.

```bash
cd ~/grappa/build/Make+Release
make -j demo-hello_world
mpirun -np 12 --hostfile ~/hosts -- applications/demos/hello_world.exe
```

If your cluster has 2 nodes then the output should look something like:

```
I0518 16:48:48.750394  2201 Grappa.cpp:647]
-------------------------
Shared memory breakdown:
  node total:                   29.7124 GB
  locale shared heap total:     14.8562 GB
  locale shared heap per core:  2.47604 GB
  communicator per core:        0.125 GB
  tasks per core:               0.0156631 GB
  global heap per core:         0.619007 GB
  aggregator per core:          0.00247955 GB
  shared_pool current per core: 4.76837e-07 GB
  shared_pool max per core:     0.619009 GB
  free per locale:              10.221 GB
  free per core:                1.7035 GB
-------------------------
I0518 16:48:48.808346  2202 hello_world.cpp:45] Hello world from locale 0 core 1
I0518 16:48:48.808636  2201 hello_world.cpp:45] Hello world from locale 0 core 0
I0518 16:48:48.808657  2203 hello_world.cpp:45] Hello world from locale 0 core 2
I0518 16:48:48.808764  2204 hello_world.cpp:45] Hello world from locale 0 core 3
I0518 16:48:48.810246  2209 hello_world.cpp:45] Hello world from locale 0 core 5
I0518 16:48:48.810478  2205 hello_world.cpp:45] Hello world from locale 0 core 4
I0518 16:48:48.852023  1348 hello_world.cpp:45] Hello world from locale 1 core 7
I0518 16:48:48.852031  1350 hello_world.cpp:45] Hello world from locale 1 core 8
I0518 16:48:48.852037  1352 hello_world.cpp:45] Hello world from locale 1 core 9
I0518 16:48:48.852037  1359 hello_world.cpp:45] Hello world from locale 1 core 11
I0518 16:48:48.852210  1356 hello_world.cpp:45] Hello world from locale 1 core 10
I0518 16:48:48.852695  1346 hello_world.cpp:45] Hello world from locale 1 core 6
```

## Rebuilding your own AWS image

Coming soon...
