%������Image Labeler���ɵ�ͼ�������ɼ���
load('faceRecTest.mat');

%ѡȡ��Ҫ��label
songPositiveInstances = labelingSession.ImageSet.ImageStruct(:,1:2);

%��Ԥ��׼���õ�ͼƬ����·��
songImDir = fullfile('song');
addpath(songImDir);

%��λ ���ǡ� ����ͼƬ·��
songNegativeFolder = fullfile('notsong');

%�洢 ���ǡ� ����ͼƬ����
songNegativeImages = imageDatastore(songNegativeFolder);

%ѵ��cascader object detector������д��"isSong.xml"
%trainCascadeObjectDetector('isSong.xml',songPositiveInstances, ...
    %songNegativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',13, 'FeatureType','Haar');

%ʵ����һ��cascade object detector������Ϊ"songDetecor"������������
songDetector = vision.CascadeObjectDetector('isSong.xml');

%������Ҫʶ���ͼƬ����
songImg = imread('C:\Users\pxohl\Desktop\20170904150130.jpg');

%��������ͼƬ����ʡ�ԣ�
smallSongImgTest = imresize(songImg,[360, 640]);

%�����ź��ͼƬ����ʶ��
songBbox = step(songDetector,smallSongImgTest);

%ʹ��ʶ������Ϣ����ʶ���
songDetectedImg = insertObjectAnnotation(smallSongImgTest, 'rectangle',songBbox,'song');

%���ƴ�������ʾ������ʶ���ͼƬ
figure;imshow(songDetectedImg);