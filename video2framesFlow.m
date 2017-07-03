function video2framesFlow(file, sv)
    v = VideoReader(file);
    opticFlow = opticalFlowFarneback;
    mlist = [];
    c = 1;
    while(hasFrame(v))
        frame = imresize(rgb2gray(readFrame(v)), 0.5);
        frame = frame(26:170,:);
        flow = estimateFlow(opticFlow, frame);
        flow = [flow.Vx flow.Vy] ./ 2000.0;
        path = strcat(sv, num2str(c), '.mat');
        save(path, 'flow');
%         figure
%         imshow(frame);
%         hold on
%         plot(flow);
%         hold off
        %imwrite(im2bw(Ieval, 0.55), strcat(save, num2str(c), '.jpg'));
        clc;
        c = c + 1
    end
end