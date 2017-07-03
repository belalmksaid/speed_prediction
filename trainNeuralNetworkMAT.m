function [nnet, rando, err] = trainNeuralNetworkMAT(layers, options, tdata, filep, ss)
    tdata(1) = [];
    rando = randperm(length(tdata));
    train = rando(1:floor(0.9 * length(tdata)));
    test = rando((length(train) + 1):length(rando));
    target = tdata(train);
    save rando.txt rando
    a = 1;
    b = ss;
    nnet = [];
    err = [];
    while b < (length(train) - ss)
        input = ones(layers(1).InputSize(1), layers(1).InputSize(2), 1, ss);
        for i = a:b
            path = strcat(filep, num2str(train(i) + 1), '.mat');
            data = (load(path));
            input(:,:,1, i - a + 1) = data.flow(:, 1:320).^2 + data.flow(:, 321:640).^2;
        end
        nnet = trainNetwork(input, target([a:b]), layers, options);
        layers = nnet.Layers;
        a = a + ss;
        b = b + ss;
        b
    end
end