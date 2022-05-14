function varargout = DensiRelGas(varargin)
% Programa que calcula las porpiedades volumétricas del gas
% con la densidad relativa del gas
% Propiedades:
% Z
% Bg
% Cg
% m(P)
% Rho
% Mug
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DensiRelGas_OpeningFcn, ...
                   'gui_OutputFcn',  @DensiRelGas_OutputFcn, ...
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
 
 
% --- Executes just before DensiRelGas is made visible.
function DensiRelGas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DensiRelGas (see VARARGIN)
 
% Choose default command line output for DensiRelGas
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes DensiRelGas wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = DensiRelGas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
 
function Derelg_Callback(hObject, eventdata, handles)
% hObject    handle to Derelg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of Derelg as text
%        str2double(get(hObject,'String')) returns contents of Derelg as a double
 
% --- Executes during object creation, after setting all properties.
function Derelg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Derelg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function ty_Callback(hObject, eventdata, handles)
% hObject    handle to ty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of ty as text
%        str2double(get(hObject,'String')) returns contents of ty as a double
 
 
% --- Executes during object creation, after setting all properties.
function ty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ty (see GCBO)
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
 
 
% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Aquí se leen las variables ingresadas por el usuario
dr=str2double(get(handles.Derelg,'String'));
tyac=str2double(get(handles.ty,'String'));
Pini=str2double(get(handles.pini,'String'));
Pfin=str2double(get(handles.pfin,'String'));
DP=str2double(get(handles.deltap,'String'));
 
%Cálculo de propiedades pseudocríticas
Ppc=756.8-131.07*dr-3.6*dr*dr; 
Tpc=169+349.5*dr-74*dr*dr;
Tyabs=tyac+460;
%Cálculo de propiedades pseudoreducidas
Tpr=Tyabs/Tpc;
i=1;
P(:,:)=zeros;
Zg(:,:)=zeros;
bg(:,:)=zeros;
rog(:,:)=zeros;
mug(:,:)=zeros;
Cg(:,:)=zeros;
ss=0;
for j=Pini:DP:Pfin %Vector de presiones pseudoreducidas
    P(i)=(Pini+DP*ss); %Vector de Presiones
Ppr(i)=(Pini+DP*i)/Ppc; %Vector de Presiones pseudo-reducidas
i=i+1; %contador
ss=ss+1; %contador2
end
Mg=28.97*dr; %Masa molecular
XX=length(P); %# de saltos
 
for j=1:XX %Rutina para cálculo de propiedades
    Zg(j)=Dranchuk(Ppr(j),Tpr); %Vector Z
    bg(j)=Bg(P(j),Tyabs,Zg(j));
    rog(j)=rho_g(P(j),Zg(j),Tyabs,Mg);
    mug(j)=mu_g(P(j),Zg(j),Mg,Tyabs); 
end
for j=1:XX-1%Calculo de Cg con diferencias finitas.
     Cg(j)=-(bg(j+1)-bg(j))/bg(j)/(P(j+1)-P(j));
end
mm=(Cg(XX-2)-Cg(XX-1))/(P(XX-2)-P(XX-1));%Pendiente
bb=Cg(XX-2)-mm*P(XX-2);%Ordenada al origen
Cg(XX)=mm*P(XX)+bb;%Diferencias finitas nos da un valor n-1, con una mendiente de extrapolación con el último y penúltimo elemento
%cálculo de pseudopresión.
m(1)=P(1)*DP/mug(1)/Zg(1);
for j=2:XX
m(j)=m(j-1)+((P(j-1)/mug(j-1)/Zg(j-1))+(P(j)/mug(j)/Zg(j)))*DP;
end
%muestras a Tablas
global datos;
datos = [P',Zg',bg',rog',mug',Cg',m'];
set(handles.tabla,'data',datos);



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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
A=get(hObject,'Value');
global datos;
switch A
    case 1
        plot(handles.axes8,datos(:,1),datos(:,2),'r--');
        grid on
        set(handles.ejey,'string','z [Adim]');
    case 2
        plot(handles.axes8,datos(:,1),datos(:,3),'b');
        grid on
        
        set(handles.ejey,'string','Bg [cft/scft]');
    case 3
        plot(handles.axes8,datos(:,1),datos(:,6),'g');
        grid on
        set(handles.ejey,'string','Cg [psi^-1]');
    case 4
        plot(handles.axes8,datos(:,1),datos(:,5),'g');
        grid on
        set(handles.ejey,'string','Mu [CP]');
    case 5
        plot(handles.axes8,datos(:,1),datos(:,7),'b');
        grid on
        set(handles.ejey,'string','m(P) [psia^2]');
    case 6 
        plot(handles.axes8,datos(:,1),datos(:,4),'b--');
        grid on
        set(handles.ejey,'string','rho [lb/cft]');
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
set(handles.Derelg,'string','');
set(handles.ty,'string','');
set(handles.pini,'string','');
set(handles.pfin,'string','');
set(handles.deltap,'string','');
set(handles.tabla,'data','');


% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
close(DensiRelGas);
Principal

