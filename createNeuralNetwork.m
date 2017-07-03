function [layers, options] = createNeuralNetwork(x, y, z, mxep, redeploy, nn)
    if redeploy == true
       layers = [imageInputLayer([x y z]) ; nn.Layers(2:3); fullyConnectedLayer(1); regressionLayer]; 
    else
        layers = [ ...
        imageInputLayer([x y z])
        convolution2dLayer(12,25)
        reluLayer
        fullyConnectedLayer(1)
        regressionLayer];
    end
    options = trainingOptions('sgdm','InitialLearnRate',0.0001, 'MaxEpochs',mxep, 'Verbose', 1, 'VerboseFrequency', 1);
end