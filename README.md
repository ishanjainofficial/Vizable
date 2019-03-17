# Vizable
### Overview
A cross platform application that uses machine learning models (Resnet 50 for iOS and Object Detection from Tensor Flow for Android) to detect objects upon the smartphone's camera being pointed to. Once done, we created a function that processes image and compares it with that of the model by using CoreML (for iOS) and Tensor Flow (for Android). When a string value is spitted out, we pass it into a speech library that uses the speech features of a smartphone. In general, the applications successfully enable blind users to sucessfully see!

Application can run either on device only, not the simulator.

### Backend
We utilize Firebase as our backend for saving detected objects in a secure and efficient manner. Our JSON tree is well-structured to allow the retrieving process simpler.

## Authors
* Ishan Jain
* Anish Palvai
* Aasish Virjala

### Prerequisites
* Android or iOS compaitble smartphone
* Access to WiFi (for communication with server)
