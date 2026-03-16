from PIL import Image
import os

def process_icon():
    img = Image.open('lib/assets/image/app_icon.png').convert('RGBA')
    print(f'Original size: {img.size}')

    # Remove white background
    pixels = img.load()
    w, h = img.size
    for y in range(h):
        for x in range(w):
            r, g, b, a = pixels[x, y]
            if r > 210 and g > 210 and b > 210:
                pixels[x, y] = (0, 0, 0, 0)

    # Crop to non-transparent content
    bbox = img.getbbox()
    print(f'Bounding box: {bbox}')
    img = img.crop(bbox)

    # Make square with padding
    w, h = img.size
    size = max(w, h)
    padding = int(size * 0.05)
    total = size + padding * 2
    square = Image.new('RGBA', (total, total), (0, 0, 0, 0))
    square.paste(img, (padding + (size - w) // 2, padding + (size - h) // 2))

    # Save processed icon
    square.save('lib/assets/image/app_icon.png', 'PNG')
    print(f'Saved clean icon: {square.size}')

    # Generate all Android sizes
    sizes = [
        ('mipmap-mdpi', 48),
        ('mipmap-hdpi', 72),
        ('mipmap-xhdpi', 96),
        ('mipmap-xxhdpi', 144),
        ('mipmap-xxxhdpi', 192),
    ]

    for folder, px in sizes:
        out_dir = f'android/app/src/main/res/{folder}'
        os.makedirs(out_dir, exist_ok=True)
        resized = square.resize((px, px), Image.LANCZOS)
        resized.save(f'{out_dir}/ic_launcher.png', 'PNG')
        resized.save(f'{out_dir}/ic_launcher_round.png', 'PNG')
        print(f'Generated {folder}: {px}x{px}')

    # iOS icon (1024x1024)
    ios_dir = 'ios/Runner/Assets.xcassets/AppIcon.appiconset'
    os.makedirs(ios_dir, exist_ok=True)
    square.resize((1024, 1024), Image.LANCZOS).save(f'{ios_dir}/Icon-App-1024x1024@1x.png', 'PNG')
    print('Generated iOS icon')

if __name__ == '__main__':
    process_icon()
    print('All icons generated successfully!')
