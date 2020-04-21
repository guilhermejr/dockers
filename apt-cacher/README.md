# apt-cacher

## Build
```bash
$ docker build -t guilhermejr/apt-cacher -f apt-cacher.Dockerfile apt-cacher
```

## Run
```bash
$ docker run -d --name apt-cacher -p "3142:3142"  guilhermejr/apt-cacher
```

* ubuntu: 18.04.3
* Porta 3142