function [detectedImg, R] = FsongFaceRecognizer(inputImage)
    lable = 'Song';
    
    detector = vision.CascadeObjectDetector('isSong.xml');
    Log = 'read features file'
    boundingBox = step(detector, inputImage);
    [imgWidth, imgHeight] = size(inputImage);
    
    if imgWidth/100 >1
        lineWidth = imgWidth/100;  
    else
        lineWidth = 1;     
    end
    
    detectedImg = insertObjectAnnotation(inputImage, 'rectangle',boundingBox,lable,...
        'LineWidth', lineWidth);
    Log = 'add rectangle'

    if (isempty(boundingBox))
        
        R = [0,lable];

    else
        %resultCount = boundingBox;
        %confidence = 1/resultCount;

        %R = [1;lable;confidence];
        R = [1,lable,];
    
    end

end
