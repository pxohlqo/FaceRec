# 用户说明文档


## 1.1 概述

使用MATLAB语言，使用MathWork公司提供的计算机视觉库Computer Vision Toolbox实现的简单人脸识别桌面应用程序。 *（由于条件限制样本不足，目前仅实现人脸检测功能）*

代码已开源，并提交至[Github](https://github.com/pxohlqo/FaceRec)托管。

同时提供Google Doc版[用户文档](https://docs.google.com/document/d/14R_Mhr6JwMfXROG_j7rWRYRpGmVh1xdM7fmrD6fRtqE/edit?usp=sharing)*（可能不会及时更新）*。

### 1.2 图形界面及使用引导

![mainFig](https://github.com/pxohlqo/MarkdownPhotos/raw/master/mainFig.png)

![imageDisplayFig](https://github.com/pxohlqo/MarkdownPhotos/raw/master/FaceRec_imageDisplayFig.png)

## 2. 工作原理
FaceRec目前实现在输入照片中识别特定人像的功能。使用MATLAB自带app——Training Image Labeler在准备好的照片上框选出人像范围并导出ROIs（regions of interest），使用SfeatureGenerator脚本根据出现人像的图片和没有出现的图片调用MATLAB提供的Computer Vision Toolbox中的 `trainCascadeObjectDetector()` 函数，使用Viola-Jones图像特征算法基于机器学习生成特征文件（*.xml）。

生成特征文件后即可使用FaceRec主程序识别输入的照片。FaceRec同样使用Computer Vision Toolbox中的 `vision.CascadeObjectDetector()` 根据前文生成的特征文件生成相应的级联对象检测器，之后调用 `insertObjectAnnotation()` 将检测器生成的检测结果（BoundingBox）绘制在输入的图片上并显示识别框和标签。

## 3. 代码文件

### 3.1 函数

#### 3.1.1 FimagePreprocessor
图片预处理函数，对过大的图片进行压缩（尺寸）。*（后发现 plot()自带图片尺寸自适应功能，此函数仅作优化性能用）*

#### 3.1.2 FprocessLog
生成系统日志函数，获取当前系统时间并根据log信息在命令行窗口生成系统日志。

#### 3.1.3 FsongFaceRecognizer
面部识别函数，获取图片，根据预先生成的特征文件 `isSong.xml` 使用 `vision.CascadeObjectDetector()` 生成 **识别框(BoundingBox)** 并绘制在原图上。

### 3.2 Figures

#### 3.2.1 imageDisplayFig
显示识别结果。

#### 3.2.2 errorDisplayFig
错误信息提示窗口。

#### 3.2.3 mainFig
程序启动主界面。

#### 3.2.4 **tableDispalyFig*
检测结果显示窗口。 *（暂未实现，目前不可见）*

### 3.3 脚本
#### 3.3.1 SfeatureGenerator
生成特征文件（*.xml），使用 **“Haar”** 特征，具体算法函数见文件内注释。

### 3.4 特征文件
#### 3.4.1 isSong.xml
由 `SfeatureGenerator.m` 生成的储存人脸特征的文件。



