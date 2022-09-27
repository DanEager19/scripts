import redis

class Redis_DB:
    def __init__(self):
        self.r = redis.StrictRedis(
            host='10.1.0.3',
            port=6379,
            charset="utf-8", 
            decode_responses=True
        )
        try:
            self.r.ping
        except:
            print("Error connecting to the server.")

    def setter(self, key, value):
        try:
            self.r.set(key, value)
        except:
            print("Error setting " + value + " to " + key + ".")

    def getter(self, key):
        try:
            value = self.r.get(key)
            return value
        except:
            print("Error getting value for " + key + ".")

    def get_all(self):
        try:
            pairs = {}
            for key in self.r.scan_iter():
                pairs[key] = self.r.get(key)
            return pairs
        except:
            print("Error getting keys.")

    def delete(self, key):
        try:
            self.r.delete(key)
        except:
            print("Error deleting " + key + ".")