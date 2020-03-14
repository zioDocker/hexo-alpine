hexo-docker-alpine
---------------
![](https://travis-ci.com/MaurizioBrioschi/hexo-alpine.svg?branch=master)

Light docker environment for the [Hexo](https://hexo.io) project

## What is Hexo?
Hexo is a fast, simple and powerful blog framework. You write posts in Markdown (or other markup languages) and Hexo 
generates static files with a beautiful theme in seconds. (cit. from Hexo documentation)

## Build
```
docker image build --build-arg UID=$(id -u) --build-arg=$(id -g) -t hexo-alpine:latest .
```

## Run image
```
docker run --rm -d --name=my-hexo-blog -p 4000:4000 hexo-alpine:latest 
```

## executing hexo
```
docker exec -it my-hexo-blog sh -c "hexo new my-first-post"
```

## Stop blog
```
docker container stop my-hexo-blog
```