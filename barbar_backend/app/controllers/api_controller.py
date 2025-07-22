from flask import jsonify, request
from app.models.user_model import users

def success():
    return jsonify({'status': 'success', 'message' : 'All good...'}), 200

def get_user():
    return jsonify(users)