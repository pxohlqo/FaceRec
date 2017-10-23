ROIs = SongFace;
positiveImgDir = fullfile('song');
negativeImgDir = fullfile('notsong');

%load(ROIs);
positiveInstances = ROIs(:,1:2);

negativeImages = imageDatastore(negativeImgDir);

trainCascadeObjectDetector('isSong.xml', positiveInstances,...
    negativeImages, 'FalseAlarmRate',0.15,'NumCascadeStages',18, 'FeatureType','Haar');

