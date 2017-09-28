function [detectedImg, R] = FfaceRecognizer(inputImage, name)
    lable = name;
    
    detector = vision.CascadeObjectDetector('Feature.xml');
    bBox = step(detector, inputImage);
    detectedImg = insertObjectAnnotation(inputImage, 'rectangle',bBox,lable);

    if (isempty(bBox))
        
        R = [0;lable];

    else
        resultCount = bBox;
        confidence = 1/resultCount;

        R = [1;lable;confidence];
    
    end

end
