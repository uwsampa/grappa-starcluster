# /home is NFS mounted
pushd /home

git clone https://github.com/uwsampa/grappa-docker.git
pushd grappa-docker/grappa
./install_dependencies.sh
popd

git clone https://github.com/uwsampa/grappa.git
pushd grappa
cd /grappa && \
  ./configure --cc=$(which gcc) --gen=Ninja \
              --third-party=/grappa-third-party && \
  cd build/Ninja+Release && \
  ninja
popd

push grappa-docker/grappa
./setup_environment.sh


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export GRAPPA_THIRD_PARTY=/grappa-third-party
export GRAPPA_ALLOW_RUN_AS_ROOT=1

