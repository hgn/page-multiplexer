#!/usr/bin/python3

import os
import http.server
import socketserver
import argparse

parser = argparse.ArgumentParser(description='serves webpages')
parser.add_argument('--directory', default='.')
parser.add_argument('--port', default='8080')
args = parser.parse_args()


os.chdir(args.directory)

Handler = http.server.SimpleHTTPRequestHandler
httpd = socketserver.TCPServer(("", int(args.port)), Handler)
print("serving at port: {}".format(args.port))
httpd.serve_forever()
