ROIs;
positiveImgDir;
negativeImgDir;

load(ROIs);
positiveInstances = ROIs(:,1:2);

negativeImages = imageDatastore(negativeImgDir);

trainCascadeObjectDetector('Feature.xml', positiveInstances,...
    negativeImages, 'FalseAlarmRate',0.1,'NumCascadeStages',13, 'FeatureType','Haar');

