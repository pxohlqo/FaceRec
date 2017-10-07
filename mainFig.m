function varargout = mainFig(varargin)
% MAINFIG MATLAB code for mainFig.fig
%      MAINFIG, by itself, creates a new MAINFIG or raises the existing
%      singleton*.
%
%      H = MAINFIG returns the handle to a new MAINFIG or the handle to
%      the existing singleton*.
%
%      MAINFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFIG.M with the given input arguments.
%
%      MAINFIG('Property','Value',...) creates a new MAINFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainFig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainFig

% Last Modified by GUIDE v2.5 03-Oct-2017 23:21:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainFig_OpeningFcn, ...
                   'gui_OutputFcn',  @mainFig_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainFig is made visible.
function mainFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainFig (see VARARGIN)

% Choose default command line output for mainFig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function imageUriEdit_Callback(hObject, eventdata, handles)
% hObject    handle to imageUriEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imageUriEdit as text
%        str2double(get(hObject,'String')) returns contents of imageUriEdit as a double


% --- Executes during object creation, after setting all properties.
function imageUriEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageUriEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in confirmButton.
function confirmButton_Callback(hObject, eventdata, handles)
% hObject    handle to confirmButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

preText = '      Image URL';
imgUri = get(handles.imageUriEdit, 'string');
FprocessLog('get image URL');

try    
    img = imread(imgUri);
    FprocessLog('read image');       
     
catch
    FprocessLog('active imageUriErrorFig');
    imageUriErrorFig;
end

FprocessLog('run function');
FimagePreprocesser(img);

FprocessLog('run faical recogenizer');
[detectedImage, result] = FsongFaceRecognizer(img);


setappdata(0, 'detectedImage', detectedImage);
FprocessLog('active imageDisplayFig');
imageDisplayFig;
