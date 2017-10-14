function [detectedImg, R] = FsongFaceRecognizer(inputImage)
    FprocessLog('set default lable');
    lable = 'Song';
    
    FprocessLog('instantiate a cascade object detector with feature file  isSong.xml');
    try
        detector = vision.CascadeObjectDetector('isSong.xml');
    catch
        FprocessLog('no isSong.xml');
        setappdata(0, 'errorMessage', 'no feature.xml');
        errorMessageFig;
    end
    

    FprocessLog('perform the detector on the image');
    boundingBox = step(detector, inputImage);
    [imgWidth, imgHeight] = size(inputImage);
    
    if imgWidth/100 >1
        lineWidth = ceil(imgWidth/100);  
    else
        lineWidth = 1;     
    end
    
    FprocessLog('insert rectangle on the image');
    detectedImg = insertObjectAnnotation(inputImage, 'rectangle',boundingBox,lable,...
        'FontSize', 34, 'LineWidth', lineWidth);

    if (isempty(boundingBox))
        
        R = [0, lable, 0];

    else
        %resultCount = boundingBox;
        %confidence = 1/resultCount;

        %R = [1;lable;confidence];
        R = [1, lable, 0];
    
    end

end
