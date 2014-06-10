# encoding: utf-8
import os
from flask import Flask


app = Flask('main')


@app.route('/')
def index():
    return 'index page'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.getenv('APP_PORT', '8080')), debug=True)
