import base64, json
from flask import Flask, request
app = Flask(__name__)
@app.post('/')
def receive():
    envelope = request.get_json(force=True)
    msg = envelope.get('message', {})
    payload = json.loads(base64.b64decode(msg.get('data', '') or 'e30='))
    print(json.dumps({'message_id': msg.get('messageId'), 'payload': payload}))
    return ('', 204)
