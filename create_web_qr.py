import qrcode
import socket

def get_local_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    ip = s.getsockname()[0]
    s.close()
    return ip

url = f"http://{get_local_ip()}:8080"

qr = qrcode.make(url)
qr.save("smart_coder_qr.png")

print(f"QR Code generated: smart_coder_qr.png")
print(f"URL: {url}")
print("Scan karo apne phone se!")
