function varargout = detpol_gui(varargin)
% DETPOL_GUI MATLAB code for detpol_gui.fig
%      DETPOL_GUI, by itself, creates a new DETPOL_GUI or raises the existing
%      singleton*.
%
%      H = DETPOL_GUI returns the handle to a new DETPOL_GUI or the handle to
%      the existing singleton*.
%
%      DETPOL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETPOL_GUI.M with the given input arguments.
%
%      DETPOL_GUI('Property','Value',...) creates a new DETPOL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before detpol_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to detpol_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help detpol_gui

% Last Modified by GUIDE v2.5 02-Jan-2022 21:26:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @detpol_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @detpol_gui_OutputFcn, ...
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


% --- Executes just before detpol_gui is made visible.
function detpol_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to detpol_gui (see VARARGIN)

% Choose default command line output for detpol_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');
% UIWAIT makes detpol_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = detpol_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%memanggil menu"browse file"
[nama_file,nama_folder]=uigetfile('*.jpg');

%jika ada nama file yang di pilih makan akan di ekseskusi
if ~isequal(nama_file,0)
    Img=im2double(imread(fullfile(nama_folder,nama_file)));
    %menampilkan citra di axes
    axes(handles.axes1)
    imshow(Img)
    title('Image Original')
    %menaampilkan nama file pada edit text
    set(handles.edit1,'String',nama_file)
    %menyimpan variable Img pada lokasi handles agar dapat dipanggil
    handles.Img=Img;
    guidata(hObject,handles)
else
    return
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%memanggil variable Img yang ada di lokasi handles
Img=handles.Img;
%konversi ke grayscale
Img_gray=rgb2gray(Img);
    
%grayscale to biner
bw=imbinarize(Img_gray,0.6);
    
%melakukan operasi komplemen
bw=imcomplement(bw);
    
%melakukan morfologi
%1. filling holes
bw=imfill(bw,'holes');
    
%2.area opening
bw=bwareaopen(bw,100);
    
%ekstraksi ciri warna rgb
R=Img(:,:,1);
G=Img(:,:,2);
B=Img(:,:,3);
R(~bw)=0;
G(~bw)=0;
B(~bw)=0;
RGB=cat(3,R,G,B);
    
%menampilkan Image Original segmentasi ke axes2
axes(handles.axes2)
imshow(RGB)
title('Image Hasil Segmentasi')

%menyimpan variable
handles.R=R;
handles.G=G;
handles.B=B;
handles.bw=bw;
guidata(hObject,handles)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%memanggil variable R,G,B dan bw
R=handles.R;
G=handles.G;
B=handles.B;
bw=handles.bw;

%nilai rata-rata R,G,B
Red=sum(sum(R))/sum(sum(bw));
Green=sum(sum(G))/sum(sum(bw));
Blue=sum(sum(B))/sum(sum(bw));
    
%melakukan penyusuna variable ciri uji
ciri_uji=[Red,Green,Blue];

%menampilkan ciri rgb pada edit text
set(handles.edit3,'String',num2str(Red));
set(handles.edit4,'String',num2str(Green));
set(handles.edit5,'String',num2str(Blue));

%menyimpan variable
handles.ciri_uji=ciri_uji;
guidata(hObject,handles)



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%memanggil variable ciri_uji
ciri_uji=handles.ciri_uji
%memanggil model KNN hasil pelatihan
load Mdl

%membaca class kluaran hasil pengujian
hasil_uji=predict(Mdl,ciri_uji);

%manampilkan kelas keluaran hasil pengujian pada edit text
set(handles.edit2,'String',hasil_uji{1})


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String',[])
set(handles.edit2,'String',[])
set(handles.edit3,'String',[])
set(handles.edit4,'String',[])
set(handles.edit5,'String',[])

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
