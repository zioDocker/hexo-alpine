#!/usr/bin/env bash

mounting_volume()   {
mkdir data;
docker run -d --name=my-hexo-blog -p 4000:4000 -v $(pwd)/data/:/home/hexo/blog hexo-alpine:latest
if [ -z "$(ls -A data)" ]; then
   echo "DIRECTORY EMPTY";
   ls -altr data;
   exit 1;
else
   echo "NOT EMPTY";
fi
docker stop my-hexo-blog;
}

mounting_volume