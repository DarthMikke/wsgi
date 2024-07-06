# WSGI container

A base container for serving Python WSGI/ASGI applications.

This container builds upon [FastWSGI](https://github.com/jamesroberts/fastwsgi).

This project is in an early stage of development, and the configuration
may still change in the future. This means things such as commands and
environment variable names. To ensure that your application doesn't break at
a new pull, please bind it to a tag.

## Install

```shell
$ docker pull ghcr.io/darthmikke/wsgi:0.0.1
```

## Usage

### `production` -- run your app

```shell
$ docker run -p 5000:5000 wsgi --volumes $(pwd)/app:/app
```

Will automatically install dependencies from `/app/requirements.txt` into
`/app/venv` before running your ASGI app.

### `install`

```shell
$ docker run -p 5000:5000 wsgi --volumes $(pwd)/app:/app
```

Will install dependencies from `/app/requirements.txt` into `/app/venv` and
exit.


## Configuration

`wsgi` supports the following environment variables:

| Name | Default | Description
| --- | --- | ---
| VENV | `/app/venv` | Path to the virtual environment
| APP_DIR | `/app` | Path to the application directory
| ASGI_APPLICATION | `asgi:main` | The ASGI application to run
