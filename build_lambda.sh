#!/bin/bash

set -e

rm -rf build lambda_function.zip

mkdir build

pip install -r lambda_processor/requirements.txt -t build

cp lambda_processor/app.py build/

cd build
zip -r ../lambda_function.zip .
cd ..

echo "Lambda package created successfully."
