load 'train.txt'

[layers, options] = createNeuralNetwork(145 * 2, 320, 1, 10, false, []);

[net6, r, ~] = trainNeuralNetwork(layers, options, train, 'train2/train.mp4', 40);

