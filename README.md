![image](https://github.com/abisliouk/retinal-segmentation/assets/101648535/063f7ea5-80f5-4bba-bb6f-94c3718282fc)
# retinal-segmentation

## Object of research 
The methodology of using the architecture of the convolutional neural network U-net for retinal segmentation, as well as the field of artificial intelligence Computer Vision.

## Purpose
Comprehensive analysis of the current field of artificial intelligence Computer Vision as a software development tool for retinal segmentation using the U-net convolutional neural network architecture based on the TensorFlow framework in conjunction with the Python programming language.

## Methods of research 
- **theoretical**: research of sources on the topic of image segmentation, architecture of the convolutional neural network U-net;
- **practical**: analysis, specification design and development of a neural network.

## Result
Neural network capable of segmenting images of the retina, highlighting its blood vessels, which allows the specialist to assess the current state of the eye and give appropriate recommendations to the patient.

## Scope
Use as a means for non-invasive diagnostics, detection of pathologies, as well as analysis of the current state of the retina.

## Implementation
- **Neural Network architecture**: [U-net](https://arxiv.org/pdf/1505.04597.pdf)
- **Dataset**: IDRiD [(Indian Diabetic Retinopathy Image Dataset)](https://paperswithcode.com/dataset/idrid)
- **Backend**: Powered by [Flask framework](https://flask.palletsprojects.com/en/3.0.x/)
- **Frontend**: IOS/Android mobile cross platform application powered by [Flutter](https://flutter.dev/)

## Demo
- **Showcase** of the mobile application for the retina blood vessels segmentation you can download [here](https://github.com/abisliouk/retinal-segmentation/blob/main/Bisliouk%20thesis%20application%20showcase.mov)
- **Screenshots**
  - <img width="160" height="350" alt="Screenshot 2024-04-14 at 16 13 38" src="https://github.com/abisliouk/retinal-segmentation/assets/101648535/0c8ed569-4dd6-480b-8acc-81bea4425e0e"><img width="160" height="350" alt="Screenshot 2024-04-14 at 16 12 46" src="https://github.com/abisliouk/retinal-segmentation/assets/101648535/2ac1d4c1-55d1-45c0-96be-f493f7a21436"><img width="160" height="350" alt="Screenshot 2024-04-14 at 16 10 06" src="https://github.com/abisliouk/retinal-segmentation/assets/101648535/b70a98d4-625e-4642-be6f-2f79f9b8aeef">

## Project Structure
- [Mobile client](https://github.com/abisliouk/retinal-segmentation/tree/main/app/segmentation_flutter_client) of the application
- [Backend](https://github.com/abisliouk/retinal-segmentation/tree/main/app/segmentation_flask_service) server part of the application
- [Training](https://github.com/abisliouk/retinal-segmentation/tree/main/app/segmentation_neural_network) a neural network model for segmentation

