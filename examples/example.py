
def main(environ, start_response):
    """
    Example WSGI application, from fastwsgi repository.
    https://github.com/jamesroberts/fastwsgi
    """
    headers = [('Content-Type', 'text/plain')]
    start_response('200 OK', headers)
    return [b'Hello, World!']
