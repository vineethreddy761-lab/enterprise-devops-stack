from http.server import HTTPServer, BaseHTTPRequestHandler
import json

class WebhookHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        content_length = int(self.headers.get('Content-Length', 0))
        body = self.rfile.read(content_length)
        try:
            data = json.loads(body.decode('utf-8'))
            print("\n--- [ALERT RECEIVED FROM ALERTMANAGER] ---")
            print(json.dumps(data, indent=2))
        except Exception as e:
            print(f"Failed to parse payload: {e}")
        
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(b'{"status":"success"}')

    def log_message(self, format, *args):
        # Suppress default http server access logs for cleaner output
        return

def run(port=5001):
    server_address = ('', port)
    httpd = HTTPServer(server_address, WebhookHandler)
    print(f"Alertmanager Webhook Receiver running on port {port}...")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nShutting down webhook receiver.")
        httpd.server_close()

if __name__ == '__main__':
    run()
