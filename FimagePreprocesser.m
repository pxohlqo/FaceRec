function preprocessedImg = FimagePreprocesser(inputImg)
%FimagePreprocesser - 检测图片是否过大，对过大的图片进行压缩
%
% Syntax: preprocessedImg = FimagePreprocesser(inputImg)
%
% inputImg - 输入的图片

    img = inputImg;

    FprocessLog('get height and width of source image');
    [inputImgHeigth, inputImgWidth] = size(img);

    FprocessLog('calculate resize rate');
    if inputImgHeigth >= inputImgWidth
        scaleRate = 1000/inputImgHeigth;
    
    else
        scaleRate = 1000/inputImgWidth;

    end

    FprocessLog('call imresize()');
    preprocessedImg = imresize(img, scaleRate);

end        