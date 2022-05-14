function varargout = zcalc(varargin)
% ZCALC MATLAB code for zcalc.fig
%      ZCALC, by itself, creates a new ZCALC or raises the existing
%      singleton*.
%
%      H = ZCALC returns the handle to a new ZCALC or the handle to
%      the existing singleton*.
%
%      ZCALC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZCALC.M with the given input arguments.
%
%      ZCALC('Property','Value',...) creates a new ZCALC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zcalc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zcalc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zcalc

% Last Modified by GUIDE v2.5 10-Sep-2018 15:11:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zcalc_OpeningFcn, ...
                   'gui_OutputFcn',  @zcalc_OutputFcn, ...
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


% --- Executes just before zcalc is made visible.
function zcalc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zcalc (see VARARGIN)

% Choose default command line output for zcalc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zcalc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zcalc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% AQUI COMIENZA EL PROGRAMA

% --- Executes on button press in pushbuttonAcept.
function pushbuttonAcept_Callback(hObject, eventdata, handles)
%H2S  CO2     N2      C1      C2      C3      i-C4    n-C4    i-C5    n-C5
%C6      C7+  h2o
% Vector de Temperaturas Criticas [°R]
Tc = [672.35 547.58 227.16 343.00 549.59 665.73 734.13 765.29 849.1 845.47 913.27 1112.2 1165.16];
% Vector de Presiones Criticas [lpca]
Pc = [1306.0 1071.0 493.0 666.4 706.5 616.0 527.9 550.6 490.4 488.6 436.9 304.6 3198.8];
%Pesos Moleculares
PM=[34.082 44.01 28.014 16.042 30.069 44.096 58.122 58.122 72.149 72.149 86.175 136 18];
kn= length(Tc); %Tamaño vectores
%Vector de fracciones molares introducidos por el usuario
y = zeros(1,kn); 
y(1) = str2double(get(handles.editH2S,'String'));
y(2) = str2double(get(handles.editCO2,'String'));
y(3) = str2double(get(handles.editN2,'String'));
y(4) = str2double(get(handles.editC1,'String'));
y(5) = str2double(get(handles.editC2,'String'));
y(6) = str2double(get(handles.editC3,'String'));
y(7) = str2double(get(handles.editiC4,'String'));
y(8) = str2double(get(handles.editnC4,'String'));
y(9) = str2double(get(handles.editiC5,'String'));
y(10) = str2double(get(handles.editnC5,'String'));
y(11) = str2double(get(handles.editC6,'String'));
y(12) = str2double(get(handles.editC7plus,'String'));
y(13) = str2double(get(handles.editAgua,'String'));

%Propiedades Pseudo-Críticas
%Kay
PpcK=0;
TpcK=0;
for j=1:kn
PpcK= PpcK+y(j)*Pc(j);
TpcK= TpcK+y(j)*Tc(j);
end
set(handles.PpcKa,'String',num2str(PpcK));
set(handles.TpcKa,'String',num2str(TpcK));
%Fin Kay
%Stewart
JJ1=0; %inicio de variables
JJ2=0;
KK=0;
for j=1:kn
JJ1=JJ1+y(j)*Tc(j)/Pc(j);
JJ2=JJ2+y(j)*sqrt(Tc(j)/Pc(j));
KK=KK+y(j)*Tc(j)/sqrt(Pc(j));
end
JJ=JJ1/3+2*JJ2^2/3;
TpcS=KK^2/JJ;
PpcS=TpcS/JJ;
set(handles.PpcSt,'String',num2str(PpcS));%Para colocar valor en casillas
set(handles.TpcSt,'String',num2str(TpcS));
%Fin Stewart
%Fin Propiedades Ppc

%////////////////
%Sutton para C7+
%///////////////
Fj=y(12)*Tc(12)/Pc(12)/3+2*y(12)^2*Tc(12)/Pc(12)/3;
Ej=0.6081*Fj+1.1325*Fj^2-14.004*Fj*y(12)+64.434*Fj*y(12)^2;
Ek=Tc(12)*(0.3129*y(12)-4.8156*y(12)^2+27.3751*y(12)^3)/sqrt(Pc(12));
JJp=JJ-Ej;
KKp=KK-Ek;
Tpc=KKp^2/JJp;
Ppc=Tpc/JJp;
%/////////Fin Sutton//////

%//////////////////////////////
%Wichert y Azis para H2s y CO2
%//////////////////////////////
AA=y(1)+y(2);
BB=y(1);
ee=120*(AA^0.9-AA^1.6)+15*(BB^0.5-BB^4);
Tpc1=Tpc-ee;
Ppc1=Ppc*Tpc1/(Tpc-BB*ee*(1-BB));
%/////////Fin Wichert y Azi//////

%////////////////////////////////
%Lee y Wattenbarger para N2 y H2O
%////////////////////////////////
TT=-246.1*y(3)+400*y(13);
PP=-162*y(3)+1270*y(13);
Tpc2=(Tpc1-227.2*y(3)-1165*y(13))/(1-y(3)-y(13))+TT;
Ppc2=(Ppc1-493.1*y(3)-3200*y(13))/(1-y(3)-y(13))+PP;
%/////////Fin Lee y Wattenbarger//////

%///////////////
%programa
%//////////////
%AquÌ se leen las variables ingresadas por el usuario
tyac=str2double(get(handles.ty,'String'));
Pini=str2double(get(handles.pini,'String'));
Pfin=str2double(get(handles.pfin,'String'));
DP=str2double(get(handles.deltap,'String'));
 
Tyabs=tyac+460;
%C•lculo de propiedades pseudoreducidas
Tpr=Tyabs/Tpc2;
i=1;
ss=0;
for j=Pini:DP:Pfin %Vector de presiones pseudoreducidas
    P(i)=(Pini+DP*ss) %Vector de Presiones
Ppr(i)=(Pini+DP*i)/Ppc2; %Vector de Presiones pseudo-reducidas
i=i+1; %contador
ss=ss+1
end
XX=length(P);%# de saltos
Mg=0;
for j=1:kn
Mg=Mg+y(j)*PM(j); %Masa molecular
end

for j=1:XX %Rutina para c•lculo de propiedades
    Zg(j)=Dranchuk(Ppr(j),Tpr); %Vector Z
    bg(j)=Bg(P(j),Tyabs,Zg(j));
    rog(j)=rho_g(P(j),Zg(j),Tyabs,Mg);
    mug(j)=mu_g(P(j),Zg(j),Mg,Tyabs); 
end

%C•lculo de Cg
for j=1:XX-1
    Cg(j)=-(bg(j+1)-bg(j))/bg(j)/(P(j+1)-P(j));
end
mm=(Cg(XX-2)-Cg(XX-1))/(P(XX-2)-P(XX-1));
bb=Cg(XX-2)-mm*P(XX-2);
Cg(XX)=mm*P(XX)+bb;


%c•lculo de pseudopresiÛn.
m(1)=P(1)*DP/mug(1)/Zg(1);
for j=2:XX
m(j)=m(j-1)+((P(j-1)/mug(j-1)/Zg(j-1))+(P(j)/mug(j)/Zg(j)))*DP;
end


%///////////fin programa//////
global dat;
%////////////
%PruebaTabla
%///////////
for i=1:XX
    dat(i,1)=P(i);
    dat(i,2)=Zg(i);
    dat(i,3)=bg(i);
    dat(i,4)=Cg(i);
    dat(i,5)=mug(i);
    dat(i,6)=rog(i);
    dat(i,7)=m(i);
end
set(handles.tabla,'Data',dat);
%///////////Fin Prueba
%///////////

clear;



function editC7plus_Callback(hObject, eventdata, handles)
% hObject    handle to editC7plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC7plus as text
%        str2double(get(hObject,'String')) returns contents of editC7plus as a double



function editAgua_Callback(hObject, eventdata, handles)
% hObject    handle to editAgua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAgua as text
%        str2double(get(hObject,'String')) returns contents of editAgua as a double


% --- Executes during object creation, after setting all properties.
function editAgua_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAgua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pfin_Callback(hObject, eventdata, handles)
% hObject    handle to pfin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pfin as text
%        str2double(get(hObject,'String')) returns contents of pfin as a double


% --- Executes during object creation, after setting all properties.
function pfin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pfin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PpcKa_Callback(hObject, eventdata, handles)
% hObject    handle to PpcKa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PpcKa as text
%        str2double(get(hObject,'String')) returns contents of PpcKa as a double


% --- Executes during object creation, after setting all properties.
function PpcKa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PpcKa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TpcKa_Callback(hObject, eventdata, handles)
% hObject    handle to TpcKa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TpcKa as text
%        str2double(get(hObject,'String')) returns contents of TpcKa as a double


% --- Executes during object creation, after setting all properties.
function TpcKa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TpcKa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function deltap_Callback(hObject, eventdata, handles)
% hObject    handle to deltap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deltap as text
%        str2double(get(hObject,'String')) returns contents of deltap as a double


% --- Executes during object creation, after setting all properties.
function deltap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deltap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PpcSt_Callback(hObject, eventdata, handles)
% hObject    handle to PpcSt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PpcSt as text
%        str2double(get(hObject,'String')) returns contents of PpcSt as a double


% --- Executes during object creation, after setting all properties.
function PpcSt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PpcSt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TpcSt_Callback(hObject, eventdata, handles)
% hObject    handle to TpcSt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TpcSt as text
%        str2double(get(hObject,'String')) returns contents of TpcSt as a double


% --- Executes during object creation, after setting all properties.
function TpcSt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TpcSt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in tabla.
function tabla_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tabla (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



function pini_Callback(hObject, eventdata, handles)
% hObject    handle to pini (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pini as text
%        str2double(get(hObject,'String')) returns contents of pini as a double


% --- Executes during object creation, after setting all properties.
function pini_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pini (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
A=get(hObject,'Value')
global dat;
switch A
    case 1
        plot(handles.axes1,dat(:,1),dat(:,2),'r');
        grid on
        set(handles.ejey,'String','Z[adim]');
    case 2
        plot(handles.axes1,dat(:,1),dat(:,3),'b');
        grid on
        set(handles.ejey,'String','Bg[cft/scft]');
    case 3
        plot(handles.axes1,dat(:,1),dat(:,4),'g');
        grid on
        set(handles.ejey,'String','Cg[psi-1]');
    case 4
        plot(handles.axes1,dat(:,1),dat(:,5),'g');
        grid on
        set(handles.ejey,'String','mug[cp]');
    case 5
        plot(handles.axes1,dat(:,1),dat(:,6),'b');
        grid on
        set(handles.ejey,'String','rhog[lb/cft]');
    case 6
        plot(handles.axes1,dat(:,1),dat(:,7),'b'); 
        grid on
        set(handles.ejey,'String','m(p)[psia^2]');
end



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in erase.
function erase_Callback(hObject, eventdata, handles)
% hObject    handle to erase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.editH2S,'String','');
set(handles.editCO2,'String','');
set(handles.editN2,'String','');
set(handles.editC1,'String','');
set(handles.editC2,'String','');
set(handles.editC3,'String','');
set(handles.editiC4,'String','');
set(handles.editnC4,'String','');
set(handles.editiC5,'String','');
set(handles.editnC5,'String','');
set(handles.editC6,'String','');
set(handles.editC7plus,'String','');
set(handles.editAgua,'String','');
set(handles.ty,'String','');
set(handles.pini,'String','');
set(handles.pfin,'String','');
set(handles.deltap,'String','');


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Principal
close(zcalc);
