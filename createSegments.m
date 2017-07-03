function createSegments(path, pw, a, b)
    for i = a:b
        p = i - 1;
        imgC = imread(strcat(path, int2str(p), '.jpg'));
        imgP = imread(strcat(path, int2str(i), '.jpg'));
        imwrite([imgC imgP], strcat(pw, int2str(i), '.jpg'));
    end
end