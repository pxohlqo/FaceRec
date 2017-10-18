# 用户说明文档


## 1.1 概述

使用MATLAB语言，使用MathWork公司提供的基于OpenCV的计算机视觉库 `vision` 实现的简单人脸识别桌面应用程序。 *（由于条件限制样本不足，目前仅实现人脸检测功能）*

代码已开源，并提交至[Github](https://github.com/pxohlqo/FaceRec)托管。

同时提供Google Doc版[用户文档](https://docs.google.com/document/d/14R_Mhr6JwMfXROG_j7rWRYRpGmVh1xdM7fmrD6fRtqE/edit?usp=sharing)*（可能不会及时更新）*。

### 1.2 图形界面及使用引导

![mainFig](https://github.com/pxohlqo/MarkdownPhotos/raw/master/mainFig.png)

![imageDisplayFig](https://github.com/pxohlqo/MarkdownPhotos/raw/master/FaceRec_imageDisplayFig.png)
## 2. 代码文件

### 2.1 函数

#### 2.1.1 FimagePreprocessor
图片预处理函数，对过大的图片进行压缩（尺寸）。*（后发现 plot()自带图片尺寸自适应功能，此函数仅作优化性能用）*

#### 2.1.2 FprocessLog
生成系统日志函数，获取当前系统时间并根据log信息在命令行窗口生成系统日志。

#### 2.1.3 FsongFaceRecognizer
面部识别函数，获取图片，根据预先生成的特征文件 `isSong.xml` 使用 `vision.CascadeObjectDetector` 生成 **识别框(BoundingBox)** 绘制在原图上。

### 2.2 Figures

#### 2.2.1 imageDisplayFig
显示处理结果。

#### 2.2.2 errorDisplayFig
错误信息提示窗口。

#### 2.2.3 mainFig
程序启动主界面。

#### 2.2.4 **tableDispalyFig*
检测结果显示窗口。 *（暂未实现，目前不可见）*

### 2.3 脚本
#### 2.3.1 SfeatureGenerator
生成特征文件（*.xml），使用 **“Haar”** 特征，具体算法函数见文件内注释。
