# UAS-Vision-2016-TargetDetection

Convolutional Neural Net to identify if a target exists in an image (MATLAB)

This code trains a Convolutional Neural Network to be able to identify whether a target as described by the IMechE Competition's Target Description (https://www.imeche.org/get-involved/young-members-network/auasc) exists in the input image. The network is currently trained to be able to detect a target with an accuracy of 99.58% with grayscale input image, a single convolutional layer and a single fully-connected hidden layer at the end. There are 4 different types of training data used:

Rectangular Targets       Target Exists = True
Circular Targets          Target Exists = False
Triangular Targets        Target Exists = False
No Targets(Plain Ground)  Target Exists = False

The network is based on the Convolution Neural Network produced after finishing the Stanford UFLDL Tutorial (http://ufldl.stanford.edu/tutorial/), although it has been changed a lot.

INSTRUCTIONS Begin the program by running the cnnTrain script. The network characteristics can be changed from the same script. The optimumTheta.mat file contains the optimum parameters required to achieve 99.58% accuracy. In order for these parameters to work the network needs to have the following characteristics:

image dimensions  : 30
number of classes : 1
filter dimensions : 9
number of filter  : 20 
pooling dimensions: 2 
fully-connected layer sizes: [128, (number of classes)]

If training of a new network is required, make sure to first copy the current optimum parameters to another directory since they will be overwritten as soon as training finishes
