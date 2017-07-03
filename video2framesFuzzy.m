function video2framesFuzzy(file, save)
    v = VideoReader(file);
    c = 1;
    while(hasFrame(v))
        frame = imresize(rgb2gray(readFrame(v)), 0.5);
        frame = frame([36:180],:);
        I = double(frame);
        classType = class(frame);
        scalingFactor = double(intmax(classType));
        I = I/scalingFactor;
        Gx = [-1 1];
        Gy = Gx';
        Ix = conv2(I,Gx,'same');
        Iy = conv2(I,Gy,'same');
        edgeFIS = newfis('edgeDetection');
        edgeFIS = addvar(edgeFIS,'input','Ix',[-1 1]);
        edgeFIS = addvar(edgeFIS,'input','Iy',[-1 1]);
        sx = 0.1;
        sy = 0.1;
        edgeFIS = addmf(edgeFIS,'input',1,'zero','gaussmf',[sx 0]);
        edgeFIS = addmf(edgeFIS,'input',2,'zero','gaussmf',[sy 0]);
        edgeFIS = addvar(edgeFIS,'output','Iout',[0 1]);
        wa = 0.1;
        wb = 1;
        wc = 1;
        ba = 0;
        bb = 0;
        bc = 0.7;
        edgeFIS = addmf(edgeFIS,'output',1,'white','trimf',[wa wb wc]);
        edgeFIS = addmf(edgeFIS,'output',1,'black','trimf',[ba bb bc]);
        r1 = 'If Ix is zero and Iy is zero then Iout is white';
        r2 = 'If Ix is not zero or Iy is not zero then Iout is black';
        r = char(r1,r2);
        edgeFIS = parsrule(edgeFIS,r);
        Ieval = zeros(size(I));
        for ii = 1:size(I,1)
            Ieval(ii,:) = evalfis([(Ix(ii,:));(Iy(ii,:));]',edgeFIS);
        end
        imwrite(im2bw(Ieval, 0.55), strcat(save, num2str(c), '.jpg'));
        c = c + 1;
    end
end