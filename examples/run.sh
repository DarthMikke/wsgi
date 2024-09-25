if [[ ! -z $1 ]]; then
TAG=":$1"
else
TAG=""
fi

docker run --rm -it -v ./example.py:/app/asgi.py -p 8000:5000 ghcr.io/darthmikke/wsgi$TAG
