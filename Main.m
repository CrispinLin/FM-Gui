function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 01-Sep-2014 14:28:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
				   'gui_Singleton',  gui_Singleton, ...
				   'gui_OpeningFcn', @Main_OpeningFcn, ...
				   'gui_OutputFcn',  @Main_OutputFcn, ...
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


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear;
clc;
global atData;
global atDataLen;
load('AntenneData.mat');
disp('Antenna Data loaded');
atData=AntenneData;
atDataLen=size(atData.NAME);
atDataLen=atDataLen(1)

load('Mapdata_Zero.mat');
global Map;
global mapWidth;
global mapHeight;
global los;
Map=transpose(data);
[mapWidth,mapHeight]=size(Map)
los=zeros(mapWidth+1,mapHeight+1);
clearSelected;



% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnClear.
function btnClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Map;
global mapWidth;
global mapHeight
global los;
clearSelected;
los=zeros(mapWidth+1,mapHeight+1);
Drawmap(Map);


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Transmitters_Callback(hObject, eventdata, handles)
% hObject    handle to Transmitters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Measurements_Callback(hObject, eventdata, handles)
% hObject    handle to Measurements (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Zoom_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Annae_Callback(hObject, eventdata, handles)
% hObject    handle to Annae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Tekna_Positionir_Callback(hObject, eventdata, handles)
% hObject    handle to Tekna_Positionir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sendarary_HTML_Callback(hObject, eventdata, handles)
% hObject    handle to Sendarary_HTML (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Rekna_Allar_Sjon_Callback(hObject, eventdata, handles)
% hObject    handle to Rekna_Allar_Sjon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Intermodulation_Callback(hObject, eventdata, handles)
% hObject    handle to Intermodulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function IM_Frek_Kort_Callback(hObject, eventdata, handles)
% hObject    handle to IM_Frek_Kort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Zoom_50_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom_50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Zoom_100_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom_100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Zoom_200_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom_200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Overview_Callback(hObject, eventdata, handles)
% hObject    handle to Overview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Compare_Callback(hObject, eventdata, handles)
% hObject    handle to Compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SavAs_Callback(hObject, eventdata, handles)
% hObject    handle to SavAs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Height_Callback(hObject, eventdata, handles)
% hObject    handle to Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ViewFilter_Callback(hObject, eventdata, handles)
% hObject    handle to ViewFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function AntRadPattern_Callback(hObject, eventdata, handles)
% hObject    handle to AntRadPattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function WavPropModel_Callback(hObject, eventdata, handles)
% hObject    handle to WavPropModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function MapView_Callback(hObject, eventdata, handles)
% hObject    handle to MapView (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SavImg_Callback(hObject, eventdata, handles)
% hObject    handle to SavImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Print_Callback(hObject, eventdata, handles)
% hObject    handle to Print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnSelectAll.
function btnSelectAll_Callback(hObject, eventdata, handles)
% hObject    handle to btnSelectAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global atDataLen;
global sel;
global Map;
sel=ones(1,atDataLen);
Drawmap(Map);



% --- Executes on button press in btnSelect_.
function btnSelect__Callback(hObject, eventdata, handles)
% hObject    handle to btnSelect_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnSendarar.
function btnSendarar_Callback(hObject, eventdata, handles)
% hObject    handle to btnSendarar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnR_tta.
function btnR_tta_Callback(hObject, eventdata, handles)
% hObject    handle to btnR_tta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnFinLOS.
function btnFinLOS_Callback(hObject, eventdata, handles)
% hObject    handle to btnFinLOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global atData;
global sel;
global atDataLen;
global Map;
global los;
global cutoff;
global mapWidth;
global mapHeight;

losSUM=zeros(mapWidth+1,mapHeight+1);
cutoffSUM=zeros(mapWidth+1,mapHeight+1);
for i=1:atDataLen
	if sel(i)==true
		[x,y]=map2image(atData.UTMX(i),atData.UTMY(i));
		curlos=findFineLOS(Map,los,x,y,atData.HEIGHT(i),2);
        losSUM=losSUM+curlos;
	    if cutoff~=0
		    curcutoff=findCutoff(Map,curlos,x,y,atData.HEIGHT(i),2,3,cutoff);
		    cutoffSUM=cutoffSUM+curcutoff;
	    end
	end
end
losSUM(losSUM>1)=1;
cutoffSUM(cutoffSUM>2)=2;
los=losSUM+cutoffSUM;
Drawmap(Map);


% --- Executes on button press in btnFinDeck.
function btnFinDeck_Callback(hObject, eventdata, handles)
% hObject    handle to btnFinDeck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function LoadMap_Callback(hObject, eventdata, handles)  
% hObject    handle to LoadMap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile(['Mapdata.mat'],'??¡??ñ??ý¾??');
str=[pathname,filename]; 
if (filename==0 & pathname==0)
	msgbox('Please select the map file!','Error','error');
else
	load(str);
	a=data;
	handles.Map=a;
	guidata(hObject,handles);
end
im=imshow(a);
Rightclick=uicontextmenu;
set(im,'uicontextmenu',Rightclick)
% uimenu(Rightclick,'label','menu1')
% uimenu(Rightclick,'label','menu2')
% u=uimenu(Rightclick,'label','menu3');
% uimenu(u,'label','sub_menu31')
% uimenu(u,'label','sub_menu32')

% --------------------------------------------------------------------
function RightClick_Callback(hObject, eventdata, handles)
% hObject    handle to RightClick (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FinLosHere_Callback(hObject, eventdata, handles)
% hObject    handle to FinLosHere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenFile_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to OpenFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile(['Mapdata.mat'],'??¡??ñµ????¼??ý¾??');
str=[pathname,filename]; 
if (filename==0 & pathname==0)
	msgbox('Please select the map file!','Error','error');
else
	load(str);
	global Map;
	global mapWidth;
	global mapHeight;
	global los;
	Map=transpose(data);
	[mapWidth,mapHeight]=size(Map)
    los=zeros(mapWidth+1,mapHeight+1);
    clearSelected;
    Drawmap(Map);
end

% function ButttonDownFcn(hObject, eventdata, handles)  %src,event
% pt = get(gca,'CurrentPoint');
% global lastX;
% global lastY;
% x = pt(1,1);
% y = pt(1,2);
% lastX=round(x);
% lastY=round(y);
% fprintf('x=%f,y=%f\n',lastX,lastY);



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --------------------------------------------------------------------
%function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
global cutoff;
cutoff=0;
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
cutoff=str2double(get(hObject,'String'))

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


% --- Executes on button press in drawPeak.
function drawPeak_Callback(hObject, eventdata, handles)
% hObject    handle to drawPeak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Map;
[mapWidth,mapHeight]=size(Map);
maxh=max(max(Map));
imgMap=uint8(zeros(mapHeight,mapWidth,3));
peak=peakDetect(Map);
for x=1:1:mapWidth
	for y=1:1:mapHeight
		if round(Map(x,y))>0
			imgMap(y,x,2)=uint8(100+round(Map(x,y)*150/maxh));
		else
			imgMap(y,x,3)=uint8(150);
		end
		if (peak(y,x)>0)
			imgMap(y,x,1)=uint8(255);	%xy inversed?
        end
	end
end
im=imshow(imgMap);


% --- Executes on button press in dipPeak.
function dipPeak_Callback(hObject, eventdata, handles)
% hObject    handle to dipPeak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Map;
[mapWidth,mapHeight]=size(Map);
imgMap=uint8(zeros(mapHeight,mapWidth,3));
maxh=max(max(Map));
for x=1:1:mapWidth-3
	for y=1:1:mapHeight-3
		if round(Map(x,y))>0
			imgMap(y,x,2)=uint8(100+round(Map(x,y)*150/maxh));
		else
			imgMap(y,x,3)=uint8(150);
        end
	end
end
imgMap2=double(rgb2gray(imgMap));
for x=2:1:mapHeight-1
	for y=2:1:mapWidth-1
        imgMap2(x,y)=imgMap(x,y)*9-imgMap(x-1,y-1)-imgMap(x-1,y)-imgMap(x,y-1)-imgMap(x+1,y+1)-imgMap(x+1,y)-imgMap(x+1,y-1)-imgMap(x,y+1)-imgMap(x-1,y+1);
    end
end
im=imshow(imgMap2,[]);
