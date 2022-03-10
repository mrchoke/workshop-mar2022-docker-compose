#!/usr/bin/bash
set -x
export HOME=/tmp 
yarn --frozen-lockfile \
&& yarn  build \
&& rm -rf node_modules \
&& rm -rf /static/* \
&& cp -r ./dist/* /static/
