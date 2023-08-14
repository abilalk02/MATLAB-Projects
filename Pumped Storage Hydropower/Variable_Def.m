%% Variable Definitions

% Pump Mode Variables
% HV_P = ;
% HB_P = ;
% HEX_P = ;
% HF_P = ;
% HENT_P = ;

% Head Loss (Pump Mode)
% HL_P = HENT_P + HF_P + HEX_P + HB_P + HV_P;
HL_P = 14.35;

% Turbine Mode Variables
% HV_T = ;
% HB_T = ;
% HEX_T = ;
% HF_T = ;
% HENT_T = ;

% Head Loss (Turbine Mode)
% HL_T = HENT_T + HF_T + HEX_T + HB_T + HV_T;
HL_T = 48.54;

% Common Variables
TPP = zeros(12,31);
TPP(1,1) = 13.87;

VNUR = zeros(12,30);
VNUR(1,1) = 2747784;

VNLR = zeros(12,30);
VNLR(1,1) = 2566000;

Spillage = zeros(12,30);
Spillage(1, 1) = 0;

TPOG = zeros(12,30);
PPP = zeros(12,30);
EPP = zeros(12,30);
VPP = zeros(12,30);
VAPP = zeros(12,30);
PPPG = zeros(12,30);
EPPG = zeros(12,30);
VPPG = zeros(12,30);
PPOG = zeros(12,30);
EPOG = zeros(12,30);
VPOG = zeros(12,30);
EPTG = zeros(12,30);
ENB = zeros(12,30);
QCP = zeros(12,30);
QRP = zeros(12,30);
VRP = zeros(12,30);
QCPG = zeros(12,30);
QPPG = zeros(12,30);
QRPG = zeros(12,30);
VRPG = zeros(12,30);
TPOGR = zeros(12,30);       
QPRNP = zeros(12,30);
QCNP = zeros(12,30);
QRNP = zeros(12,30);
VRNP = zeros(12,30);
VACC = zeros(12,30);
QRPG1 = zeros(12,30);
VRPG1 = zeros(12,30);
ECPG = zeros(12,30);
ECOPH = zeros(12,30);
QRP1 = zeros(12,30);
VRP1 = zeros(12,30);
ECONPH = zeros(12,30);
VRNP1 = zeros(12,30);
ECTG = zeros(12,30);
VPTG = zeros(12,30);
VNET = zeros(12,30);
PCPG = zeros(12,30);
PCOPH = zeros(12,30);
PCONPH = zeros(12,30);
%LUR = zeros(12,30);
%LLR = zeros(12,30);
%HPPN = zeros(12,30);
%HPTN = zeros(12,30);
VLC = zeros(12,30);
QPP = zeros(12,1);
QC = zeros(12,1);

QWS = [5.15 3.47 2.08 1.35 1.03 0.87 0.81 1 1.59 2.75 4.85 5.78];         
QR = [198.7 120.7 68.3 38.2 28.1 23 20.4 22.6 37.7 83 158.3 232.6];
TRE = [13.87 13.7 12.17 11.8 11.8 9.92 9.80 10.13 11.73 12.38 12.90 14.07];

% Interpolation parameters for LUR and LLR
Inter_Upper_Vol = [27478 686946 1373892 2060838 2747784];
Inter_Upper_Level = [2090 2095 2100 2105 2110];
Inter_Lower_Vol = [25660 641500 1283000 1924500 2566000];
Inter_Lower_Level = [1283 1284.3 1285.5 1286.8 1288];

LLR = 1288;         % LLR
LUR = 2110;         % LUR
nPP = 89.75;
QPPR = 21.96;
VUR = 2747784;
VLR = 2566000;
TPPG = 4;
QPTR = 31.80306;
nPT = 85.47;

UDR = 1;                % Upper Reservoir Depletion Ratio
LDR = 75;               % Upper Reservoir Depletion Ratio

QCR = 154;
nCT = 91.23;
HCR = 218;
TCPG = 4;
sat = 0;
sat_count = 1;
sun_count = 1;
Total_Spillage = 0;


% End