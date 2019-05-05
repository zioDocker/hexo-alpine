hexo-alpine
---------------
Docker image for Hexo node js blog

## Build
```
docker image build --build-arg UID=$(id -u) --build-arg=$(id -g) -t hexo-alpine:latest .
```

## Run image
```
docker run -d --name=my-hexo-blog -p 4000:4000 hexo-alpine:latest 
```

## executing hexo
```
docker exec -it my-hexo-blog hexo new my-first-post
```

