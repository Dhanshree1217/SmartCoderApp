# Flask Application

This is a simple Flask application that serves a web page with styled content.

## Project Structure

```
flask-app
├── app.py
├── requirements.txt
├── static
│   └── css
│       └── styles.css
├── templates
│   └── index.html
└── README.md
```

## Setup Instructions

1. **Clone the repository** (if applicable):
   ```
   git clone <repository-url>
   cd flask-app
   ```

2. **Create a virtual environment** (optional but recommended):
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. **Install the required packages**:
   ```
   pip install -r requirements.txt
   ```

## Running the Application

To run the Flask application, execute the following command:
```
python app.py
```

The application will be accessible at `http://127.0.0.1:5000/`.

## Usage

Once the application is running, open a web browser and navigate to the URL above to view the main page. The page is styled using the CSS defined in `static/css/styles.css`.