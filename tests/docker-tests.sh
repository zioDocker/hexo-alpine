#!/usr/bin/env bash

docker_run_no_mount()    {
    docker run -d --name=my-hexo-blog-no-mount -p 4000:4000 hexo-alpine:latest;
    docker rm my-hexo-blog-no-mount -f;
    echo "docker_run_no_mount OK";
}

mounting_volume()   {
mkdir data;
docker run -d --name=my-hexo-blog-mount -p 4000:4000 -v $(pwd)/data/:/home/hexo/blog hexo-alpine:latest
if [ -z "$(ls -A data)" ]; then
   echo "DIRECTORY EMPTY";
   ls -altr data;
   exit 1;
else
   echo "NOT EMPTY";
fi
rm -rf data;
docker rm my-hexo-blog-mount -f;
echo "mounting_volume OK";
}

docker_run_no_mount
mounting_volume