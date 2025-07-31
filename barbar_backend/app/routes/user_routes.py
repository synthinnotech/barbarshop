from flask import Blueprint, jsonify
from ..models.user_model import User
from .. import db

user_bp = Blueprint('user', __name__, url_prefix='/users')

@user_bp.route('/')
def get_users():
    users = User.query.all()
    return jsonify([{"id": u.id, "username": u.username, "password": u.password, "phone": u.phone} for u in users])
