#!/usr/bin/env bash

init_blog() {
  docker run --rm --name=my-hexo-blog -p 4000:4000 -v $(pwd)/hexo:/home/hexo hexo-alpine:latest sh -c "hexo init blog && npm install"
}

run_blog()  {
  docker run --rm -d --name=my-hexo-blog -p 4000:4000 -v $(pwd)/hexo:/home/hexo hexo-alpine:latest sh -c "cd blog && hexo server"
  if [ -z "$(ls -A hexo/blog)" ]; then
   echo "DIRECTORY EMPTY";
    ls -altr data;
    exit 1;
  else
    echo "NOT EMPTY";
  fi
}

new_post() {
  docker exec -it my-hexo-blog sh -c "cd blog && hexo new my-article"
}

remove_blog() {
  docker container stop my-hexo-blog
}


init_blog;
run_blog;
new_post;
remove_blog;