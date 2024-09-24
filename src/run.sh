#!/bin/bash

if [ -z $VENV ]; then
VENV="/app/venv"
fi

if [ -z $APP_DIR ]; then
APP_DIR="/app"
fi

if [ -z $ASGI_APPLICATION ]; then
ASGI_APPLICATION="asgi:main"
fi

echo Configuration:
# echo VENV: $VENV
echo APP_DIR: $APP_DIR
echo ASGI_APPLICATION: $ASGI_APPLICATION

echo "Activating venv..."
source /venv/bin/activate

cd $APP_DIR

# Need to do this to account for the way Python
# resolves imports.
# @link https://docs.python.org/3/library/sys.html#sys.path
export PYTHONPATH=$PYTHONPATH:$(pwd)

if [ -f requirements.txt ]; then
  pip install -r requirements.txt
fi

if [ $1 == "install" ]; then
  exit $?
fi

# Scenarios:
# 1. Run the ASGI server
if [ $1 == "production" ]; then
  python3 -m uvicorn --host 0.0.0.0 ${@:2} $ASGI_APPLICATION
  exit $?
fi

# 2. Pass arguments to manage.py
set -x
python3 manage.py $@
