Speed Prediction
=========

Use video and files from Comma.Ai: http://commachallenge.s3-us-west-2.amazonaws.com/speed_challenge_2017.tar


video2framesFuzzy.m converts the videos to a series of images and simplifies them with fuzzy logic edge detection.
video2framesFlow.m does the same but produces matrices of vectors for flow usign Farneback optical flow.
createNeuralNetwork.m creates the neural network layers and training options. The function is forced to train gpu but can easily changed in the options function.


data/ contains two neural networks that perform very well. MSE for both is <2