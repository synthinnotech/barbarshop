from flask import Blueprint
from app.controllers.api_controller import (get_user, success)

user_bp = Blueprint('user_bp', __name__)

user_bp.route('/', methods=['GET'])(success)
user_bp.route('/users', methods=['GET'])(get_user)