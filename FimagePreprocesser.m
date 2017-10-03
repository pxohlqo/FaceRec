function preprocessedImg = FimagePreprocesser(inputImg)
%FimagePreprocesser - 检测图片是否过大，对过大的图片进行压缩
%
% Syntax: preprocessedImg = FimagePreprocesser(inputImg)
%
% inputImg - 输入的图片

    img = inputImg;

    FprocessLog('get height and width of source image');
    [inputImgHeigth, inputImgWidth] = size(img);

    if numel(img) >= 700 * 700
        FprocessLog('resize');
        preprocessedImg = imresize(img, [inputImgHeigth/10, inputImgWidth/10]);
    else
        preprocessedImg = img;
    end
    
end        