# uttyfest

## Build
```bash
$ docker build -t guilhermejr/uttyfest . -f uttyfest.Dockerfile
```

## Run
```bash
$ docker run -d --name uttyfest -p "80:80" -v "$(pwd)/cake:/var/www/html" guilhermejr/uttyfest
```