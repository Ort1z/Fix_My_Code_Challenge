#!/usr/bin/python3
"""
Web server 
"""
from api.v1.views import app_views
from flask import Flask, jsonify, make_response

app = Flask(__name__)
app.register_blueprint(app_views)


@app.errorhandler(404)
def not_found(error):
    """ json 404 page """
    return make_response(jsonify({"error": "Not found"}), 404)


if __name__ == "__main__":
    # python -m api.v1.app 
    Running on http://0.0.0.0:5000/
    
    curl -XGET http://0.0.0.0:5000/api/v1/status
    {
      "error": "Not found"
    }
