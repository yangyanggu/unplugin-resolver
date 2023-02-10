#!/bin/sh

set -e

cd ..

npm publish --tag=beta --access public
cd -

echo "Publish completed"
