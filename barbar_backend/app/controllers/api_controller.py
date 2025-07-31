from flask import jsonify, request
from app.models.user_model import User
from app import db

def success():
    return jsonify({'status': 'success', 'message': 'All good...'}), 200

def get_user():
    users = User.query.all()
    user_list = [
        {
            "id": user.id,
            "username": user.username,
            "phone": user.phone
        } for user in users
    ]
    return jsonify(user_list), 200
