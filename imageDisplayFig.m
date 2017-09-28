function varargout = imageDisplayFig(varargin)
% IMAGEDISPLAYFIG MATLAB code for imageDisplayFig.fig
%      IMAGEDISPLAYFIG, by itself, creates a new IMAGEDISPLAYFIG or raises the existing
%      singleton*.
%
%      H = IMAGEDISPLAYFIG returns the handle to a new IMAGEDISPLAYFIG or the handle to
%      the existing singleton*.
%
%      IMAGEDISPLAYFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEDISPLAYFIG.M with the given input arguments.
%
%      IMAGEDISPLAYFIG('Property','Value',...) creates a new IMAGEDISPLAYFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imageDisplayFig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imageDisplayFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imageDisplayFig

% Last Modified by GUIDE v2.5 21-Sep-2017 17:28:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imageDisplayFig_OpeningFcn, ...
                   'gui_OutputFcn',  @imageDisplayFig_OutputFcn, ...
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


% --- Executes just before imageDisplayFig is made visible.
function imageDisplayFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imageDisplayFig (see VARARGIN)

% Choose default command line output for imageDisplayFig
handles.output = hObject;

img = getappdata(0, 'detectedImage');
Log = 'getappdata'

imshow(img);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imageDisplayFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imageDisplayFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
