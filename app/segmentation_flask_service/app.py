import os

from utils.metrics import dice_coef, dice_loss, iou

os.environ["SM_FRAMEWORK"] = "tf.keras"

import segmentation_models as sm

sm.set_framework('tf.keras')
sm.framework()
from flask import send_file
from keras.models import load_model
import cv2

from flask import Flask, request
import numpy as np

# Load the model
custom_objects = {
    'dice_coef': dice_coef,
    'dice_loss': dice_loss,
    'iou': iou,
}

model = load_model('final-model', custom_objects)

app = Flask(__name__)


# Define route for processing images
@app.route('/segment/retina/vessels', methods=['POST'])
def segment():
    # Get image from request
    image = request.files['image']
    # Convert image to numpy array
    image = np.array(cv2.imdecode(np.frombuffer(image.read(), np.uint8), cv2.IMREAD_COLOR))
    # Resize image to 512
    image = cv2.resize(image, (512, 512))
    # Normalize image
    image = image / 255.0
    # Add batch size
    image = np.expand_dims(image, axis=0)
    # Apply segmentation model
    mask = model.predict(image)
    # Remove batch size
    mask = np.squeeze(mask, axis=0)
    # Convert mask to black and white image
    mask = (mask > 0.5).astype(np.uint8) * 255
    # Save mask to temporary file
    cv2.imwrite('mask.png', mask)
    # Send mask as response
    return send_file('mask.png', mimetype='image/png')


# Run flask app
if __name__ == '__main__':
    app.run()
