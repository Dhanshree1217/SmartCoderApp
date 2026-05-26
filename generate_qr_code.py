import qrcode

# Create QR for the web app file
web_app_path = "file:///c:/Users/DHANASHREE/OneDrive/Desktop/smart_coder/smart_coder_web.html"

print("Creating QR code for Smart Coder app...")

# Create QR code
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_M,
    box_size=12,
    border=4,
)

qr.add_data(web_app_path)
qr.make(fit=True)

# Create QR image
img = qr.make_image(fill_color="#FF8C42", back_color="white")
img.save("smart_coder_qr_code.png")

print("QR code saved: smart_coder_qr_code.png")
print("Scan this QR to open Smart Coder app in browser!")
print(f"Path: {web_app_path}")