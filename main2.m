load 'train.txt'
%%
[layers, options] = createNeuralNetwork(145, 320, 1, 30, false, []);

[net7, r, er] = trainNeuralNetworkMAT(layers, options, train, 'train4/train', 45);

