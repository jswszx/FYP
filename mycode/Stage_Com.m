global h; % make h a global variable so it can be used outside the main
          % function. Useful when you do event handling and sequential           move
%% Create Matlab Figure Container
fpos    = get(GUI,'DefaultFigurePosition'); % figure default position
fpos(3) = 650; % figure window size;Width
fpos(4) = 450; % Height
 
f = figure('Position', fpos,...
           'Menu','None',...
           'Name','APT GUI');
%% Create ActiveX Controller
h = actxcontrol('MGMOTOR.MGMotorCtrl.1',[20 20 600 400 ], f);
 
%% Initialize
% Start Control
h.StartCtrl;
 
% Set the Serial Number
SN = 83827653; % put in the serial number of the hardware
set(h,'HWSerialNum', SN);

 % Indentify the device
h.Identify;

pause(1); % waiting for the GUI to load up;
%% Controlling the Hardware
%h.MoveHome(0,0); % Home the stage. First 0 is the channel ID (channel 1)

h.SetButtonParams(0,2,1,5)   %Setting-go to position (hangle, go to position, left button, right button)
h.SetVelParams(0,0,0.3,1.5); %set the velocity(0,0,a,Vmax)
h.MoveAbsoluteEx(0,10,0,true); %set the abs start position
h.SetAbsMovePos(0,10); %set the abs end position
h.MoveAbsolute(0,1==0); %stop moving