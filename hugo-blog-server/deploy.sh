#!/bin/bash
# ToDO
commitMsg=$1

git add hugo-blog-server

git commit -m ${commitMsg}
hugo -e production

npm run algolia