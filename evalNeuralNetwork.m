function [vals, svals, dsvals] = evalNeuralNetwork(net, folder, n)
    vals(n) = 0;
    svals(n) = 0;
    dsvals(n) = 0;
    prev = imread(strcat(folder, '1', '.jpg'));
    for i = 2:n
        cur = imread(strcat(folder, num2str(i), '.jpg'));
        input = double([prev; cur]) ./ 255;
        vals(i) = predict(net, input);
        if vals(i) < 0
            vals(i) = 0;
        end
        prev = cur;
    end
    vals(1) = vals(2);
    svals(1) = vals(2);
    o = svals(1);
    for i = 2:n
        svals(i) = vals(i)  + 0.8 * (o -  vals(i));
        o = svals(i);
    end
    
    dsvals = smooth(vals);
end