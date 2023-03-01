#!/bin/sh
 for i in `curl 'https://raw.githubusercontent.com/grafana/k6-docs/master/src/data/doc-extensions/extensions.json' | jq -r '.extensions | .[] | .url'` ; do  xk6 build master --with ${i##https:\/\/} || echo $i >> broken.txt; done
