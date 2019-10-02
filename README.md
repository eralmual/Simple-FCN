# Backpropagation - Proyecto 1
Introducción al Reconocimiento de Patrones
-------------
# Tecnológico de Costa Rica
Escuela de Ingeniería Electrónica
Prof: Pablo Alvarado Moya, Ph.D.
Ignacio Mora Jiménez, carné 2016133524
Erick Muñoz Alvarado, carné 2016130685
Allan Navarro Brenes, carné 200943530
Jorge Rodríguez Esquivel, carné 2013389899
##### 30 de Setiembre, 2019


### Requirements
* Octave 4.4.1 or greater installed.

### Execution instructions

#### Running the main program
Running main.m will train a new neural network, which takes some time, you'll see a graph showing the live progress of the training session. If you run main.n, the training will begin from scratch, so any weights previously saved with the same ds_size and amount of classes will be overwritten. 
1. Run octave-cli on the directory of the project.
2. Execute the command main


#### Train Individually
Running the traing function will train the neural network. See train.m for aditional info about the parameters that the function takes. Note that the saved weights for different models are identified by shape, training size, and amount of classes, and will be saved in the weights directory. Also note that you can keeptraining a network using previously saved weights. A graph showing the loss evolution will be shown.

1. Run octave-cli on the directory of the project.
2. Execute the command train(shape="vertical", num_classes=3, batch_size=8, ds_size=1000, lr = 0.01, epochs = 100, optim = "dg", keep_training = true). See train.m for information about the parameters.


#### Test Individually
Running the tests will display on the command line the metrics generated by the confusion matrix, and will show graphics depicting what the model predicts in a small plane, it also shows heat maps for the prediction of each class.

1. Run octave-cli on the directory of the project.
2. Execute the command test(shape="vertical",ds_size = 1000,  numdata_test=128, num_classes = 3). See train.m for information about the parameters.

For reference, this network has already been trained, you can run the following commands which will show the tests performed on the provided weight sets:
* test(shape="pie", ds_size = 5000,  numdata_test=128, num_classes = 5)
* test(shape="vertical", ds_size = 1000,  numdata_test=128, num_classes = 4)
* test(shape="horizontal", ds_size = 1000,  numdata_test=128, num_classes = 5)
* test(shape="radial", ds_size = 5000,  numdata_test=128, num_classes = 6)

### Notes
* You can change the activation function in the hidden layer in the FCN contructor to:
  * fcn.func.ReLu
  * fcn.func.Sigmoid
* This project can be found on GitHub at: https://github.com/Btrwrld/Simple-FCN



