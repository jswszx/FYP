function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 22-Mar-2019 16:09:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
axes(handles.axes1);

axis on


guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function activex1_MoveComplete(hObject, eventdata, handles)
% hObject    handle to activex1 (see GCBO)
% eventdata  structure with parameters passed to COM event listener
% handles    structure with handles and user data (see GUIDATA)



function ET_Vel_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Vel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Vel as text
%        str2double(get(hObject,'String')) returns contents of ET_Vel as a double


% --- Executes during object creation, after setting all properties.
function ET_Vel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Vel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_ACC_Callback(hObject, eventdata, handles)
% hObject    handle to ET_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_ACC as text
%        str2double(get(hObject,'String')) returns contents of ET_ACC as a double


% --- Executes during object creation, after setting all properties.
function ET_ACC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function ET_Save_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_Choose.
function PB_Choose_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Path_Result = uigetdir('E:\USB\mycode\results');
set(handles.ET_Save,'String',Path_Result);
guidata(hObject,handles);



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PB_Start.
function PB_Start_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Cam_Obj; %declare a golbal object camera
global Cam_Src; %some attributes of camera
global Stage_Obj;   % make Stage_Obj a global variable so it can be used outside the main function. parameters of stage

Pic_obtain=getsnapshot(Cam_Obj);
[gim1,p_y,p_x]=FindPositionfunc(Pic_obtain);

axes(handles.axes1)
image(gim1)
hold on
plot(p_x,p_y,'rx','MarkerSize',10,'LineWidth',3);
axis on
hold on
plot(322,241,'rx');
hold on

movedistance=p_x-322
current_pos=Stage_Obj.GetAbsMovePos_AbsPos(0);
Stage_Obj.SetAbsMovePos(0,current_pos+movedistance*0.01832); %set the abs end position
Stage_Obj.MoveAbsolute(0,1==0); %stop moving
pause(4)
Pic_obtain=getsnapshot(Cam_Obj);
[gim1,p_y,p_x]=FindPositionfunc(Pic_obtain);

image(gim1)
hold on
plot(p_x,p_y,'rx','MarkerSize',10,'LineWidth',3);
axis on
hold on
plot(322,241,'rx');
hold on

closepreview(Cam_Obj);

path = get(handles.ET_Save, 'String');   
filepath=pwd;         
cd(path)          
imwrite(Pic_obtain,'test2.jpg')
cd(filepath)     



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PB_about.
function PB_about_Callback(hObject, eventdata, handles)
% hObject    handle to PB_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h=dialog('name','Instuction','position',[700 500 600 400]);
% left	
% bottom	
% width	
% height	
% https://www.mathworks.com/help/matlab/ref/matlab.ui.control.uicontrol-properties.html
uicontrol('parent',h,'style','text','string','This is the user interface of my autofocusing system.','position',[35 325 550 50],'fontsize',13,'HorizontalAlignment','left','FontWeight','bold');
uicontrol('parent',h,'style','text','string','To get a focused ficture automatically, do as follow:','position',[35 290 550 55],'fontsize',13,'HorizontalAlignment','left','FontWeight','bold');
uicontrol('parent',h,'style','text','string','1. Click the orange "ON" button on stage parameter setting pannel to open the stage','position',[15 250 570 55],'fontsize',12,'HorizontalAlignment','left','FontWeight','bold');
uicontrol('parent',h,'style','text','string','2. Click the "Preview" button on camera parameter setting pannel to open the camera','position',[15 200 570 55],'fontsize',12,'HorizontalAlignment','left','FontWeight','bold');
uicontrol('parent',h,'style','text','string','3. Click the "Start" to begin autofocusing','position',[15 150 570 55],'fontsize',12,'HorizontalAlignment','left','FontWeight','bold');
uicontrol('parent',h,'style','pushbutton','position',...
   [265 20 70 30],'string','OK','callback','delete(gcbf)');



% --- Executes on selection change in PM_CM.
function PM_CM_Callback(hObject, eventdata, handles)
% hObject    handle to PM_CM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_CM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_CM


% --- Executes during object creation, after setting all properties.
function PM_CM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_CM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_brightness_Callback(~, eventdata, handles)
% hObject    handle to ET_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_brightness as text
%        str2double(get(hObject,'String')) returns contents of ET_brightness as a double


% --- Executes during object creation, after setting all properties.
function ET_brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in PB_Stop.
function PB_Stop_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cam_Obj;
closepreview(Cam_Obj);
guidata(hObject, handles);



function ET_SP_Callback(hObject, eventdata, handles)
% hObject    handle to ET_SP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_SP as text
%        str2double(get(hObject,'String')) returns contents of ET_SP as a double


% --- Executes during object creation, after setting all properties.
function ET_SP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_SP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_CamCom.
function PB_CamCom_Callback(hObject, eventdata, handles)
% hObject    handle to PB_CamCom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Set camera Parameters
global Cam_Obj;
global Cam_Src;

Cam_Mode = get(handles.PM_CM, 'Value');
switch Cam_Mode
    case 2
      Cam_Obj = videoinput('pointgrey', 1,'F7_Mono12_644x482_Mode1');
    case 1
      Cam_Obj = videoinput('pointgrey', 1,'F7_Mono8_644x482_Mode1');
end

Cam_Src = getselectedsource(Cam_Obj);

% Set Frame rate percentage
Cam_FPR_Mode = get(handles.PM_FpsM, 'Value');
if ( Cam_FPR_Mode == 2)
    FPR_Val = get(handles.ET_FpsM, 'String');
    FPR_Val = str2double(FPR_Val);
    Cam_Src.FrameRateMode = 'Manual';
    Cam_Src.FrameRate = FPR_Val;
elseif ( Cam_FPR_Mode == 1)
        Cam_Src.FrameRateMode = 'Auto';
else
    Cam_Src.FrameRateMode = 'Off';  
end

% Set exposure mode and value
Cam_EXP_mode = get(handles.PM_ExpM, 'Value');
if ( Cam_EXP_mode == 2 )
    EXP_Val = get(handles.ET_ExpM, 'String');
    EXP_Val = str2double(EXP_Val);
    Cam_Src.ExposureMode = 'Manual';
    Cam_Src.Exposure = EXP_Val;
elseif (Cam_EXP_mode == 1)
        Cam_Src.ExposureMode = 'Auto';
else
    Cam_Src.ExposureMode = 'Off';
end

% Set gain mode
Cam_Gain_Mode = get(handles.PM_GainM, 'Value');
if ( Cam_Gain_Mode == 1)
    Gain_Val = get(handles.ET_GainM, 'String');
    Gain_Val = str2double(Gain_Val);
    Cam_Src.GainMode = 'Manual';
    Cam_Src.Gain = Gain_Val;
elseif ( Cam_Gain_Mode == 2 )
        Cam_Src.GainMode = 'Auto';
else
    Cam_Src.GainMode = 'Off';  
end

% Set Gamma mode
Cam_Gamma_Mode = get(handles.PM_GammaM, 'Value');
if ( Cam_Gamma_Mode == 1)
    Gamma_Val = get(handles.ET_GammaM, 'String');
    Gamma_Val = str2double(Gamma_Val);
    Cam_Src.GammaMode = 'Manual';
    Cam_Src.Gamma = Gamma_Val;
%elseif ( Cam_Gamma_Mode == 1)
%        Cam_Src.GammaMode = 'Auto';
else
    Cam_Src.GammaMode = 'Off';
end

% Set Sharpness mode
Cam_Shap_Mode = get(handles.PM_SharpM, 'Value');
if ( Cam_Shap_Mode == 2)
    Sharpen_Val = get(handles.ET_SharpM, 'String');
    Sharpen_Val = str2double(Sharpen_Val);
    Cam_Src.SharpnessMode = 'Manual';
    Cam_Src.Sharpness = Sharpen_Val;
elseif (Cam_Shap_Mode == 1)
        Cam_Src.SharpnessMode = 'Auto';
else
    Cam_Src.SharpnessMode = 'Off';
end

% Set Shutter Mode
Cam_Shutter_Mode = get(handles.PM_ShutterM, 'Value');
if ( Cam_Shutter_Mode == 2)
    Shutter_Val = get(handles.ET_ShutterM, 'String');
    Shutter_Val = str2double(Shutter_Val);
    Cam_Src.ShutterMode = 'Manual';
    Cam_Src.Shutter = Shutter_Val;
elseif (Cam_Shutter_Mode == 1)
        Cam_Src.ShutterMode = 'Auto';
else
    Cam_Src.ShutterMode = 'Off';
end

% Set Brightness
   Bright_Val = get(handles.ET_brightness, 'String');
   Bright_Val = str2double(Bright_Val);
   Cam_Src.Brightness = Bright_Val;
axes(handles.axes1);
himage=image(zeros(482,644),'parent',handles.axes1);
preview(Cam_Obj,himage);
axis on

% Set ROI
Temp_X_Offset = get(handles.ET_Xoffset, 'String');
X_Offset = str2double(Temp_X_Offset);
Temp_Y_Offset = get(handles.ET_Yoffset, 'String');
Y_Offset = str2double(Temp_Y_Offset);
Temp_Width = get(handles.ET_Width, 'String');
Width = str2double(Temp_Width);
Temp_Height = get(handles.ET_Height, 'String');
Height = str2double(Temp_Height);
Cam_Obj.ROIPosition = [X_Offset, Y_Offset, Width, Height];

% Activate Push Buttons
set(handles.PB_Stop, 'Enable', 'On');

% Update handles structure
guidata(hObject, handles);


% --- Executes on selection change in PM_ExpM.
function PM_ExpM_Callback(hObject, eventdata, handles)
% hObject    handle to PM_ExpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_ExpM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_ExpM


% --- Executes during object creation, after setting all properties.
function PM_ExpM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_ExpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_ExpM_Callback(hObject, eventdata, handles)
% hObject    handle to ET_ExpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_ExpM as text
%        str2double(get(hObject,'String')) returns contents of ET_ExpM as a double


% --- Executes during object creation, after setting all properties.
function ET_ExpM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_ExpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PM_GainM.
function PM_GainM_Callback(hObject, eventdata, handles)
% hObject    handle to PM_GainM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_GainM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_GainM


% --- Executes during object creation, after setting all properties.
function PM_GainM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_GainM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PM_GammaM.
function PM_GammaM_Callback(hObject, eventdata, handles)
% hObject    handle to PM_GammaM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_GammaM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_GammaM


% --- Executes during object creation, after setting all properties.
function PM_GammaM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_GammaM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PM_SharpM.
function PM_SharpM_Callback(hObject, eventdata, handles)
% hObject    handle to PM_SharpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_SharpM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_SharpM


% --- Executes during object creation, after setting all properties.
function PM_SharpM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_SharpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PM_ShutterM.
function PM_ShutterM_Callback(hObject, eventdata, handles)
% hObject    handle to PM_ShutterM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_ShutterM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_ShutterM


% --- Executes during object creation, after setting all properties.
function PM_ShutterM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_ShutterM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_GainM_Callback(hObject, eventdata, handles)
% hObject    handle to ET_GainM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_GainM as text
%        str2double(get(hObject,'String')) returns contents of ET_GainM as a double


% --- Executes during object creation, after setting all properties.
function ET_GainM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_GainM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_GammaM_Callback(hObject, eventdata, handles)
% hObject    handle to ET_GammaM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_GammaM as text
%        str2double(get(hObject,'String')) returns contents of ET_GammaM as a double


% --- Executes during object creation, after setting all properties.
function ET_GammaM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_GammaM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_SharpM_Callback(hObject, eventdata, handles)
% hObject    handle to ET_SharpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_SharpM as text
%        str2double(get(hObject,'String')) returns contents of ET_SharpM as a double


% --- Executes during object creation, after setting all properties.
function ET_SharpM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_SharpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_shutterM_Callback(hObject, eventdata, handles)
% hObject    handle to ET_shutterM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_shutterM as text
%        str2double(get(hObject,'String')) returns contents of ET_shutterM as a double


% --- Executes during object creation, after setting all properties.
function ET_shutterM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_shutterM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PM_FpsM.
function PM_FpsM_Callback(hObject, eventdata, handles)
% hObject    handle to PM_FpsM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_FpsM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_FpsM


% --- Executes during object creation, after setting all properties.
function PM_FpsM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_FpsM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_FpsM_Callback(hObject, eventdata, handles)
% hObject    handle to ET_ExpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_ExpM as text
%        str2double(get(hObject,'String')) returns contents of ET_ExpM as a double


% --- Executes during object creation, after setting all properties.
function ET_FpsM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_ExpM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_Default.
function PB_Default_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cam_Obj;
global Cam_Src;
Cam_Obj=videoinput('pointgrey', 1,'F7_Mono12_644x482_Mode1');
Cam_Src=getselectedsource(Cam_Obj);  %camera mode
Cam_Src.ExposureMode = 'Auto';   %EXP mode
Cam_Src.FrameRateMode = 'Auto';  %Fps mode
Cam_Src.Gain =-11.006;
Cam_Src.GammaMode = 'Off';
Cam_Src.SharpnessMode = 'Auto';
Cam_Src.ShutterMode = 'Auto';


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



function ET_Xoffset_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Xoffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Xoffset as text
%        str2double(get(hObject,'String')) returns contents of ET_Xoffset as a double


% --- Executes during object creation, after setting all properties.
function ET_Xoffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Xoffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Yoffset_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Yoffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Yoffset as text
%        str2double(get(hObject,'String')) returns contents of ET_Yoffset as a double


% --- Executes during object creation, after setting all properties.
function ET_Yoffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Yoffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Width_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Width as text
%        str2double(get(hObject,'String')) returns contents of ET_Width as a double


% --- Executes during object creation, after setting all properties.
function ET_Width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Height_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Height as text
%        str2double(get(hObject,'String')) returns contents of ET_Height as a double


% --- Executes during object creation, after setting all properties.
function ET_Height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Save_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Save as text
%        str2double(get(hObject,'String')) returns contents of ET_Save as a double


% --------------------------------------------------------------------
function activex3_MoveComplete(hObject, eventdata, handles)
% hObject    handle to activex3 (see GCBO)
% eventdata  structure with parameters passed to COM event listener
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in PB_stagecom.
function PB_stagecom_Callback(hObject, eventdata, handles)
% hObject    handle to PB_stagecom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Create Matlab Figure Container

global Stage_Obj;   % make h a global variable so it can be used outside the main function. parameters of stage


fpos    = get(GUI,'DefaultFigurePosition'); % figure default position
fpos(3) = 650; % figure window size;Width
fpos(4) = 450; % Height
 
f = figure('Position', fpos,...
           'Menu','None',...
           'Name','APT GUI');
%% Create ActiveX Controller
Stage_Obj = actxcontrol('MGMOTOR.MGMotorCtrl.1',[20 20 600 400 ], f);
 
%% Initialize
% Start Control
Stage_Obj.StartCtrl;
 
% Set the Serial Number
SN = 83827653; % put in the serial number of the hardware
set(Stage_Obj,'HWSerialNum', SN);

 % Indentify the device
Stage_Obj.Identify;

pause(1); % waiting for the GUI to load up;
%% Controlling the Hardware
%h.MoveHome(0,0); % Home the stage. First 0 is the channel ID (channel 1)

Temp_Vmax = get(handles.ET_Vel, 'String');
Vmax = str2num(Temp_Vmax);
Temp_Amax = get(handles.ET_ACC,'String');
Amax = str2num(Temp_Amax);
Temp_SP = get(handles.ET_SP,'String');
SP = str2num(Temp_SP);
%10-4.7583
Stage_Obj.SetButtonParams(0,2,1,5)   %Setting-go to position (hangle, go to position, left button, right button)
Stage_Obj.SetVelParams(0,0,Amax,Vmax); %set the velocity(0,0,a,Vmax)
Stage_Obj.SetPositionOffset(0,0);   %set the begining of stage axis:0
%Stage_Obj.GetPositionOffset(0,0);
Stage_Obj.MoveAbsoluteEx(0,SP,0,true); %set the abs start position
Stage_Obj.MoveAbsolute(0,1==0); %stop moving
