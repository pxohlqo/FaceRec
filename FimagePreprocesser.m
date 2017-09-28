function preprocessedImg = FimagePreprocesser(inputImg)
%FimagePreprocesser - Description
%
% Syntax: preprocessedImg = FimagePreprocesser(inputImg)
%
% Long description

    img = inputImg;

    [inputImgHeigth, inputImgWidth] = size(img);

    if numel(img) >= 700 * 700
        preprocessedImg = imresize(img, [inputImgHeigth/10, inputImgWidth/10]);
    else
        preprocessedImg = img;
    end
    
end        