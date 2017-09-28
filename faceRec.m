%加载用Image Labeler生成的图像特征采集域
load('faceRecTest.mat');

%选取需要的label
songPositiveInstances = labelingSession.ImageSet.ImageStruct(:,1:2);

%将预先准备好的图片加入路径
songImDir = fullfile('song');
addpath(songImDir);

%定位 “非” 特征图片路径
songNegativeFolder = fullfile('notsong');

%存储 “非” 特征图片数据
songNegativeImages = imageDatastore(songNegativeFolder);

%训练cascader object detector将特征写入"isSong.xml"
%trainCascadeObjectDetector('isSong.xml',songPositiveInstances, ...
    %songNegativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',13, 'FeatureType','Haar');

%实例化一个cascade object detector，命名为"songDetecor"，并传入特征
songDetector = vision.CascadeObjectDetector('isSong.xml');

%加载需要识别的图片对象
songImg = imread('C:\Users\pxohl\Desktop\20170904150130.jpg');

%重新缩放图片（可省略）
smallSongImgTest = imresize(songImg,[360, 640]);

%对缩放后的图片进行识别
songBbox = step(songDetector,smallSongImgTest);

%使用识别后的信息绘制识别框
songDetectedImg = insertObjectAnnotation(smallSongImgTest, 'rectangle',songBbox,'song');

%绘制窗口以显示加入了识别框图片
figure;imshow(songDetectedImg);