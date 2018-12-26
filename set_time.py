import os
from datetime import datetime

import redis

r = redis.Redis(host=os.getenv("REDIS_HOST", "localhost"))
r.set("time", str(datetime.now()))
