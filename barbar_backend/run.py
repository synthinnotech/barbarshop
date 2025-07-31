from app import create_app, db
from flask import jsonify

app = create_app()

@app.route('/')
def home():
    return jsonify({"message": "Flask API running"})

if(__name__ == "__main__"):
    app.run(debug=True)