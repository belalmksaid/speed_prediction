v = VideoReader('videos/train.mp4','CurrentTime',11);
opticFlow = opticalFlowFarneback;
c = 0;
cam = webcam('USB2.0 VGA UVC WebCam');
while hasFrame(v)
    frameRGB = snapshot(cam); %readFrame(v);
    frameGray = rgb2gray(frameRGB);

    flow = estimateFlow(opticFlow,frameGray);
    x = flow.Vx;
    y = flow.Vy;
    z = (x.^2 + y.^2) .^ 0.5;
    %imshow(frameRGB)
    hold on
    quiver(x, y);
    %plot(flow,'DecimationFactor',[5 5],'ScaleFactor',2)
    hold off
    c = c + 1;
    if c == 2
        %break;
    end
end