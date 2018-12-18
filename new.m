function varargout = new(varargin)


% NEW M-file for new.fig
%      NEW, by itself, creates a new NEW or raises the existing
%      singleton*.
%
%      H = NEW returns the handle to a new NEW or the handle to
%      the existing singleton*.
%
%      NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW.M with the given input arguments.
%
%      NEW('Property','Value',...) creates a new NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help new

% Last Modified by GUIDE v2.5 30-Mar-2011 08:05:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_OpeningFcn, ...
                   'gui_OutputFcn',  @new_OutputFcn, ...
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


% --- Executes just before new is made visible.
function new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new (see VARARGIN)

% Choose default command line output for new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_OutputFcn(hObject, eventdata, handles) 
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
global image1;
[FileName,PathName,FilterIndex] = uigetfile('*.bmp');
image1 = imread(FileName);

% panhandle = uipanel('Tag','uipanel1');
% panax = axes('Units','normal', 'Position', [0 0 1 1], 'Parent', panhandle);
% imhandle = imshow(panax, image1); 

axes(handles.axes1);
imshow(image1);
%set(handles.pushbutton1,'visible','off');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1;

    set(handles.text2,'visible','off');
    set(handles.text3,'visible','off');
    set(handles.text4,'visible','off');
    set(handles.text5,'visible','off');
    set(handles.text6,'visible','off');
    set(handles.text7,'visible','off');
    set(handles.text8,'visible','off');
    set(handles.text9,'visible','off');
    set(handles.text10,'visible','off');
    set(handles.text11,'visible','off');
    set(handles.text12,'visible','off');
    set(handles.text13,'visible','off');
    set(handles.text14,'visible','off');
    set(handles.text15,'visible','off');
    set(handles.text16,'visible','off');
    set(handles.text17,'visible','off');
    set(handles.text18,'visible','off');
    set(handles.text19,'visible','off');
    set(handles.text20,'visible','off');
    set(handles.text21,'visible','off');
    set(handles.text22,'visible','off');
    set(handles.text23,'visible','off');


    

[mse_lbg psnr_lbg mse_kpe psnr_kpe mse_kfcg psnr_kfcg mse_kmcg psnr_kmcg] =main(image1);

[min_lbg a] = min(mse_lbg);
[max_lbg b] = max(psnr_lbg);

[min_kpe c] = min(mse_kpe);
[max_kpe d] = max(psnr_kpe);

[min_kfcg e] = min(mse_kfcg);
[max_kfcg f] = max(psnr_kfcg);

[min_kmcg g] = min(mse_kmcg);
[max_kmcg h] = max(psnr_kmcg);

% disp(a);
% disp(b);
% disp(c);
% disp(d);
% disp(min_lbg);
% disp(max_lbg);
% disp(min_kpe);
% disp(max_kpe);
%(max_kmcg>=15)  



if (max_lbg>=19)& (max_kpe>=19)& (max_kfcg>=19) & (b==d)&(d==f)

    set(handles.text2,'visible','on');
    set(handles.text3,'visible','on');
    set(handles.text4,'visible','on');
    set(handles.text5,'visible','on');
    
    set(handles.text6,'visible','on');
    set(handles.text8,'String',min_lbg);
    
    set(handles.text7,'visible','on');
    set(handles.text8,'visible','on');
    set(handles.text6,'String',max_lbg);
    
    set(handles.text9,'visible','on');
    set(handles.text10,'visible','on');
    set(handles.text10,'String',min_kpe);
    
    set(handles.text11,'visible','on');
    set(handles.text12,'visible','on');
    set(handles.text12,'String',max_kpe);
    
    
    set(handles.text13,'visible','on');
    set(handles.text15,'visible','on');
    set(handles.text16,'visible','on');
    set(handles.text14,'visible','on');
    set(handles.text18,'visible','on');
    set(handles.text17,'visible','on');

    set(handles.text21,'visible','on');
    set(handles.text21,'String',min_kmcg);
    
    set(handles.text22,'visible','on');
    set(handles.text22,'String',max_kmcg);
    
    set(handles.text19,'visible','on');
    set(handles.text19,'String',min_kfcg);
    
    set(handles.text20,'visible','on');
    set(handles.text20,'String',max_kfcg);
    
    ans=num2str(a);
    set(handles.text4,'String',strcat('Matching with image ',ans));
    
    
    minarr = [ min_lbg min_kpe min_kmcg min_kfcg];
    maxarr = [ max_lbg max_kpe max_kmcg max_kfcg];
    
    [r ind]=min(minarr);
    y=max(maxarr);
    
    set(handles.text23,'visible','on');
    if(ind==1)
        stname=strcat('img_lbg',ans,'.mat');
        x = importdata(stname);
        CB1 = cell2mat(x(1));
        fvector1 = cell2mat(x(2));
        [img]=recon(CB1,fvector1);
        set(handles.text23,'String','Reconstructed using LBG');
        
    elseif(ind==2)
        stname=strcat('img_kpe',ans,'.mat');
        x = importdata(stname);
        CB1 = cell2mat(x(1));
        fvector1 = cell2mat(x(2));
        [img]=recon(CB1,fvector1);
        set(handles.text23,'String','Reconstructed using KPE');
        
    elseif(ind==3)
        stname=strcat('img_kmcg',ans,'.mat');
        x = importdata(stname);
        CB1 = cell2mat(x(1));
        fvector1 = cell2mat(x(2));
        [img]=recon(CB1,fvector1);
        set(handles.text23,'String','Reconstructed using KMCG');
        
   else
        stname=strcat('img_kfcg',ans,'.mat');
        x = importdata(stname);
        CB1 = cell2mat(x(1));
        fvector1 = cell2mat(x(2));
        [img]=recon(CB1,fvector1);
        set(handles.text23,'String','Reconstructed using KFCG');
        
        
    end            
    
axes(handles.axes2);
imshow(uint8(img));

else
    %set(handles.axes2,'visible','off');
    axes(handles.axes1);
    imshow(uint8(image1));
    
    axes(handles.axes2);
    imshow(uint8([179]));
    

    set(handles.text4,'visible','on');
    set(handles.text4,'String','Match Not Found');
end





