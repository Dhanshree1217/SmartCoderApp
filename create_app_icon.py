from PIL import Image, ImageDraw, ImageFont
import os

def create_app_icon():
    # Create a 512x512 image with gradient background
    size = 512
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Create gradient background
    for y in range(size):
        # Orange to red gradient
        r = int(255 * (1 - y / size) + 229 * (y / size))
        g = int(140 * (1 - y / size) + 90 * (y / size))
        b = int(66 * (1 - y / size) + 78 * (y / size))
        color = (r, g, b, 255)
        draw.line([(0, y), (size, y)], fill=color)
    
    # Add rounded corners
    mask = Image.new('L', (size, size), 0)
    mask_draw = ImageDraw.Draw(mask)
    mask_draw.rounded_rectangle([0, 0, size, size], radius=size//8, fill=255)
    
    # Apply mask
    img.putalpha(mask)
    
    # Add code brackets
    try:
        # Try to use a system font
        font_size = size // 6
        font = ImageFont.truetype("arial.ttf", font_size)
    except:
        # Fallback to default font
        font = ImageFont.load_default()
    
    # Draw code symbols
    bracket_color = (255, 255, 255, 255)
    
    # Left bracket
    draw.text((size//4, size//3), "{", fill=bracket_color, font=font, anchor="mm")
    
    # Right bracket  
    draw.text((3*size//4, 2*size//3), "}", fill=bracket_color, font=font, anchor="mm")
    
    # Add brain emoji effect (circle with lines)
    center_x, center_y = size//2, size//2
    brain_radius = size//8
    
    # Draw brain circle
    draw.ellipse([center_x - brain_radius, center_y - brain_radius, 
                  center_x + brain_radius, center_y + brain_radius], 
                 fill=(255, 255, 255, 200), outline=(255, 255, 255, 255), width=3)
    
    # Add brain lines
    for i in range(3):
        y_offset = (i - 1) * brain_radius // 3
        draw.line([center_x - brain_radius//2, center_y + y_offset, 
                   center_x + brain_radius//2, center_y + y_offset], 
                  fill=(255, 140, 66, 255), width=3)
    
    # Save the icon
    icon_path = "lib/assets/image/app_icon.png"
    img.save(icon_path, "PNG")
    print(f"App icon created successfully at {icon_path}")
    
    # Create smaller versions for different densities
    sizes = [192, 144, 96, 72, 48, 36]
    for s in sizes:
        small_img = img.resize((s, s), Image.Resampling.LANCZOS)
        small_path = f"lib/assets/image/app_icon_{s}.png"
        small_img.save(small_path, "PNG")
        print(f"Icon {s}x{s} created at {small_path}")

if __name__ == "__main__":
    # Ensure directory exists
    os.makedirs("lib/assets/image", exist_ok=True)
    create_app_icon()