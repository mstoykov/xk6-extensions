#!/bin/sh
for i in `cat list.txt`; do
	gh repo clone ${i##https://github.com/} workdir
	cd workdir
	git checkout -b useSobek
	go mod edit -require go.k6.io/k6@bd114fdbd683238fae72efddf13a56f511685d62 && go mod tidy -go=1.20
	find . -name "*.go" -type f -exec sed -i -e 's|goja\.|sobek\.|g' {} \;
	find . -name "*.go" -type f -exec sed -i -e 's|"github.com/dop251/goja"|"github.com/grafana/sobek"|g' {} \;
	rm -rf ./vendor
	go mod tidy
	gofumpt -w ./..
	git commit -a -F ../body.txt
	gh pr create -f --web
	cd -
	rm -rf workdir
done 
