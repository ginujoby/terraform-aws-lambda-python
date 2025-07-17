#!/bin/bash

# Install Python requirements

pip3 install -r requirements.txt -t packages/python/

# python3.13 -m venv create_layer
# source create_layer/bin/activate
# pip install -r requirements.txt

# mkdir python
# cp -r create_layer/lib python/
# zip -r layer_content.zip python/