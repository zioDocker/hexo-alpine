#!/usr/bin/env bash

docker_run_no_mount()    {
    printf "\n docker_run_no_mount START";
    docker run -d --name=my-hexo-blog-no-mount -p 4000:4000 hexo-alpine:latest;
    docker rm my-hexo-blog-no-mount -f;
    printf "\n docker_run_no_mount OK";
}

mounting_volume()   {
printf "\n mounting_volume START";
mkdir data;
docker run -d --name=my-hexo-blog-mount -p 4000:4000 -v $(pwd)/data/:/home/hexo/blog hexo-alpine:latest
if [ -z "$(ls -A data)" ]; then
   printf "\n DIRECTORY EMPTY";
   ls -altr data;
   exit 1;
else
   printf "\n DIRECTORY NOT EMPTY";
fi
rm -rf data;
docker rm my-hexo-blog-mount -f;
printf "\n mounting_volume OK";
}

docker_run_no_mount
mounting_volume