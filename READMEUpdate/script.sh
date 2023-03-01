#!/bin/bash
git checkout -b xk6RenameUpdate

READMEFILE=README.md
if [ ! -f "$READMEFILE" ] ; then
    READMEFILE=Readme.md
fi

sed -i  -r  's/https:\/\/github.com\/k6io\/xk6\)/https:\/\/github.com\/grafana\/xk6)/' ${READMEFILE}
sed -i  -r  's/go get github.com\/k6io\/xk6@.*/go install go.k6.io\/xk6\/cmd\/xk6@latest/' ${READMEFILE}
sed -i  -r  's/go install github.com\/k6io\/xk6@.*/go install go.k6.io\/xk6\/cmd\/xk6@latest/' ${READMEFILE}
sed -i  -r  's/go install github.com\/k6io\/xk6\/cmd\/xk6@.*/go install go.k6.io\/xk6\/cmd\/xk6@latest/' ${READMEFILE}
sed -i  -r  's/go get -u github.com\/k6io\/xk6\/cmd\/xk6/go install go.k6.io\/xk6@latest/'  ${READMEFILE}
sed -i  -r  's/go get -u github.com\/k6io\/xk6/go install go.k6.io\/xk6\/cmd\/xk6@latest/'  ${READMEFILE}
git add ${READMEFILE}
git commit -m "Update README as xk6 was moved" 
