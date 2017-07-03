function [nnet, rando, err] = trainNeuralNetwork(layers, options, tdata, filep, ss)
    tdata(1) = [];
    rando = randperm(length(tdata));
    train = rando(1:floor(0.9 * length(tdata)));
    test = rando((length(train) + 1):length(rando));
    target = tdata(train);
    save rando.txt rando
    a = 1;
    b = ss;
    err = [];
    while b < (length(train) - ss)
        ima = [];
        imb = [];
        input = ones(layers(1).InputSize(1), layers(1).InputSize(2), 1, ss);
        for i = a:b
            ima = imread(strcat(filep, num2str(train(i) + 1), '.jpg'));
            ima(find(ima < 50)) = 0;
            imb = imread(strcat(filep, num2str(train(i)), '.jpg'));
            imb(find(imb < 50)) = 0;
            im = double([ima ; imb])  ./ 255.0;
            %im = 255 - im;
            input(:,:,1, i - a + 1) = im;
        end
        nnet = trainNetwork(input, target([a:b]), layers, options);
        layers = nnet.Layers;
        a = a + ss;
        b = b + ss;
        b
    end
end