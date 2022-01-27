#!/bin/sh

set -e

cd ..

npm publish --access public
cd -

echo "Publish completed"
