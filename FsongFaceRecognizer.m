function [detectedImg, R] = FsongFaceRecognizer(inputImage)
    lable = 'Song';
    
    detector = vision.CascadeObjectDetector('isSong.xml');
    Log = 'read features file'
    bBox = step(detector, inputImage);
    detectedImg = insertObjectAnnotation(inputImage, 'rectangle',bBox,lable);
    Log = 'add rectangle'

    % TODO:线条加宽

    if (isempty(bBox))
        
        R = [0,lable];

    else
        %resultCount = bBox;
        %confidence = 1/resultCount;

        %R = [1;lable;confidence];
        R = [1,lable,];
    
    end

end
