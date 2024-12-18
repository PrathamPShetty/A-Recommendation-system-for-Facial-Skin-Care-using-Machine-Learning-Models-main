import os
import logging
import numpy as np
from fastapi import FastAPI, HTTPException, UploadFile, File
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
from PIL import Image
from io import BytesIO

# Configure logging
logging.basicConfig(
    level=logging.DEBUG,  # Set to DEBUG for verbose output
    format='%(asctime)s %(levelname)s: %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S',
    handlers=[
        logging.FileHandler("server.log"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

# Initialize FastAPI app
app = FastAPI()

# Skin type class names
class_names1 = ['Dry_skin', 'Normal_skin', 'Oil_skin']

# Load the Keras model
def get_model():
    global model
    try:
        model = load_model('./models/skin_type_classifier.h5')
        logger.info("Model loaded successfully.")
    except Exception as e:
        logger.error(f"Failed to load model: {e}")

get_model()

# Preprocess the image for prediction
def load_image(img_path):
    try:
        img = image.load_img(img_path, target_size=(224, 224))
        img_tensor = image.img_to_array(img)
        img_tensor = np.expand_dims(img_tensor, axis=0)
        img_tensor /= 255.0
        logger.debug(f"Image loaded and preprocessed from path: {img_path}")
        return img_tensor
    except Exception as e:
        logger.error(f"Error in loading and preprocessing image: {e}")
        raise

# Make a prediction with the model
def prediction_skin(img_path):
    try:
        new_image = load_image(img_path)
        pred1 = model.predict(new_image)
        pred_class1 = class_names1[np.argmax(pred1[0])]
        logger.info(f"Prediction made for image: {pred_class1}")
        return pred_class1
    except Exception as e:
        logger.error(f"Prediction failed: {e}")
        raise

# API endpoint to upload and process an image
@app.post("/upload")
async def upload_image(file: UploadFile = File(...)):
    try:
        logger.debug("Image file received in the POST request")

    
        content = await file.read()
        im = Image.open(BytesIO(content))

        # Save the image
        filename = 'image.png'
        file_path = os.path.join('./static', filename)
        os.makedirs('./static', exist_ok=True)
        im.save(file_path)
        logger.info(f"Image saved at: {file_path}")

        # Make prediction
        skin_type = prediction_skin(file_path).split('_')[0]
        acne_type = "mild"  # Simulating for the demo
        tone = "fair to light"

        logger.info(f"Prediction response: Type: {skin_type}")
        return {"type": skin_type, "tone": tone, "acne": acne_type}

    except Exception as e:
        logger.error(f"Error processing the request: {e}")
        raise HTTPException(status_code=500, detail="Error processing the image")



