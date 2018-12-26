import os

import redis
from flask import Flask

r = redis.Redis(host=os.getenv("REDIS_HOST", "localhost"))

app = Flask(__name__)


@app.route('/')
def hello_world():
    t = r.get("time")
    if t:
        t = t.decode("utf-8")
    else:
        t = "не установлено"
    r.delete("time")
    return 'Hello, World! Time: ' + t


if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
