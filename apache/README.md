# apache

## Build
```bash
$ docker build -t guilhermejr/apache . -f apache.Dockerfile
```

## Run
```bash
$ docker run -d --name apache -p "80:80" -p "443:443" guilhermejr/apache
```

* Workdir: /etc/apache
* ubuntu: 20.04.1
* apache: 2.4.41
* Porta 80 443