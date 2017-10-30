Docker ApiDoc
=============

> [ApiDoc](http://apidocjs.com) container with inotify feature to rebuild
documentation on file change.

![Docker build status][badge-build-status] ![Image size][badge-image-size]

[badge-build-status]: https://img.shields.io/docker/build/etiennetremel/apidoc.svg
[badge-image-size]: https://img.shields.io/imagelayers/image-size/etiennetremel/apidoc/latest.svg


## Getting started

```
# Build
$ docker build -t apidoc .

# Create shared volume
$ docker volume create apidoc

# Clone the ApiDoc example documentation
$ git clone https://github.com/apidoc/apidoc.git
$ cd apidoc/example

# Run API Doc
$ docker run -d \
    --name=apidoc \
    -v $PWD:/src:ro \
    -v apidoc:/dest \
    apidoc --input=/src --output=/dest

# Run Nginx
$ docker run -d \
    --name=nginx \
    -v apidoc:/usr/share/nginx/html:ro \
    -p 8080:80 \
    nginx:alpine
```

Open [http://localhost:8080](http://localhost:8080)


## Known issues

If running on OSX, iNotify will not work as expected as the events doesn't get
correcty propagated.
