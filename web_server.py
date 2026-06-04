import http.server
import socketserver
import webbrowser
import socket

def get_local_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except:
        return "localhost"

class WebAppServer(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/' or self.path == '/app':
            # Serve the web app
            with open('smart_coder_web.html', 'r', encoding='utf-8') as f:
                content = f.read()
            
            self.send_response(200)
            self.send_header('Content-type', 'text/html; charset=utf-8')
            self.end_headers()
            self.wfile.write(content.encode('utf-8'))
        else:
            super().do_GET()

# Start server
PORT = 8080
local_ip = get_local_ip()

print("🚀 Smart Coder Web App Server Starting...")
print("=" * 50)
print(f"📱 Local URL: http://localhost:{PORT}")
print(f"🌐 Network URL: http://{local_ip}:{PORT}")
print("=" * 50)
print("📲 Create QR code with: python create_web_qr.py")
print("⏹️  Press Ctrl+C to stop server")
print("=" * 50)

try:
    with socketserver.TCPServer(("", PORT), WebAppServer) as httpd:
        # Open browser
        webbrowser.open(f"http://localhost:{PORT}")
        httpd.serve_forever()
except KeyboardInterrupt:
    print("\n👋 Server stopped!")
except OSError as e:
    print(f"❌ Port {PORT} is busy. Try closing other applications.")
    print("Or change PORT number in the script.")