#!/bin/sh
set -x
for i in `cat building.txt`; do
	git clone $i workdir ; 
	cd workdir;
	git checkout -b k6.0.45.1.update ;
	go mod edit -require go.k6.io/k6@v0.45.1 && go mod tidy;
	git commit -a -m "Bump to k6 v0.45.1 to fix build" ;
	gh pr create;
	cd - ; 
	rm -rf workdir
done 
