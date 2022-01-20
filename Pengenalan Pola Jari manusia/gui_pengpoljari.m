function varargout = gui_pengpoljari(varargin)
% GUI_PENGPOLJARI MATLAB code for gui_pengpoljari.fig
%      GUI_PENGPOLJARI, by itself, creates a new GUI_PENGPOLJARI or raises the existing
%      singleton*.
%
%      H = GUI_PENGPOLJARI returns the handle to a new GUI_PENGPOLJARI or the handle to
%      the existing singleton*.
%
%      GUI_PENGPOLJARI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PENGPOLJARI.M with the given input arguments.
%
%      GUI_PENGPOLJARI('Property','Value',...) creates a new GUI_PENGPOLJARI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_pengpoljari_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_pengpoljari_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_pengpoljari

% Last Modified by GUIDE v2.5 04-Jan-2022 17:37:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_pengpoljari_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_pengpoljari_OutputFcn, ...
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


% --- Executes just before gui_pengpoljari is made visible.
function gui_pengpoljari_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_pengpoljari (see VARARGIN)

% Choose default command line output for gui_pengpoljari
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_pengpoljari wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_pengpoljari_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file,nama_path] = uigetfile({'*.*'});
 
if ~isequal(nama_file,0)
    I = imread(fullfile(nama_path,nama_file));
    axes(handles.axes1)
    imshow(I)
    handles.I = I;
    title('Image Original')
    guidata(hObject,handles)
    set(handles.edit2,'String',nama_file)
else
    return
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = handles.I;
J=rgb2gray(I);
K = imbinarize(J,0.55);
K = imcomplement(K);
K = imfill(K,'holes');
K = bwareaopen(K,5000);
stats = regionprops(K,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 14*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;
 
input = [metric;eccentricity];
 
load net
output = round(sim(net,input));
 
axes(handles.axes2)
imshow(K)
title('Image Hasil Segmentasi')
 
if output == 0
    kelas = 'Jari Jempol';
elseif output == 1
    kelas = 'Jari Jentik';
elseif output == 2
    kelas = 'Jari Manis';
elseif output == 3
    kelas = 'Jari Tengah';
elseif output == 4
    kelas = 'Jari Telunjuk';
else
    kelas='Bukan Jari';
end
 
set(handles.edit1,'String',kelas)

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String',[])
set(handles.edit2,'String',[])

axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes2)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end