hexo-docker-alpine
---------------
![](https://travis-ci.com/ridesoft/hexo-alpine.svg?branch=master)

Light docker environment for the [Hexo](https://hexo.io) project

## What is Hexo?
Hexo is a fast, simple and powerful blog framework. You write posts in Markdown (or other markup languages) and Hexo 
generates static files with a beautiful theme in seconds. (cit. from Hexo documentation)

## Build
```
docker image build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t hexo-alpine:latest .
```

### Init your blog
```
docker run --rm --name=my-hexo-blog -p 4000:4000 -v $(pwd)/hexo:/home/hexo hexo-alpine:latest sh -c "hexo init {my-blog} && npm install"
```

### Run your blog
```
docker run --rm --name=my-hexo-blog -p 4000:4000 -v $(pwd)/hexo:/home/hexo hexo-alpine:latest sh -c "cd {my-blog} && hexo server"
```
Now you can start working to your post, i.e.
```
docker exec -it my-hexo-blog sh -c "cd blog && hexo new my-article"
```

## Stop blog
```
docker container stop my-hexo-blog
```