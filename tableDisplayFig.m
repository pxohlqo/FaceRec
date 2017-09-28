function varargout = tableDisplayFig(varargin)
% TABLEDISPLAYFIG MATLAB code for tableDisplayFig.fig
%      TABLEDISPLAYFIG, by itself, creates a new TABLEDISPLAYFIG or raises the existing
%      singleton*.
%
%      H = TABLEDISPLAYFIG returns the handle to a new TABLEDISPLAYFIG or the handle to
%      the existing singleton*.
%
%      TABLEDISPLAYFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLEDISPLAYFIG.M with the given input arguments.
%
%      TABLEDISPLAYFIG('Property','Value',...) creates a new TABLEDISPLAYFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tableDisplayFig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tableDisplayFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tableDisplayFig

% Last Modified by GUIDE v2.5 21-Sep-2017 18:15:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tableDisplayFig_OpeningFcn, ...
                   'gui_OutputFcn',  @tableDisplayFig_OutputFcn, ...
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


% --- Executes just before tableDisplayFig is made visible.
function tableDisplayFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tableDisplayFig (see VARARGIN)

% Choose default command line output for tableDisplayFig
handles.output = hObject;

R = getappdata(0, 'result');
set(handles.resultDisplay, 'data', R);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tableDisplayFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tableDisplayFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
