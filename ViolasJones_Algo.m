clear all
clc
cam = webcam(1);
I = snapshot(cam);
%To detect 
FDetect = vision.CascadeObjectDetector;
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',15);
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',10);
%Read the input Image
BBF = step(FDetect,I);
BB=step(EyeDetect,I);
BBN=step(NoseDetect,I);
BBM=step(MouthDetect,I);
figure,imshow(I);

for i = 1:size(BBF,1)
    rectangle('Position',BBF(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','g');
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
    rectangle('Position',BBN(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','y');
    rectangle('Position',BBM(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
    title('Face Detection');
end

clear cam