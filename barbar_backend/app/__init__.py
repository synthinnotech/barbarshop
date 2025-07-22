from flask import Flask
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    CORS(app)
    from .routes.api_routes import user_bp
    app.register_blueprint(user_bp, url_prefix='/api')

    return app