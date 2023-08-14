%% Pump Mode

TPOG(month, actual_day) = 24 - TPPG - TPP(month, actual_day);

HPPN = LUR - LLR + HL_P;

if (QPP(month) >= QPPR)
    y = QPPR;
else
    y = QPP(month);
end

PPP(month, actual_day) = ((9.81 * y * HPPN)/(nPP/100))/1000;

% Calculate EPP
EPP(month, actual_day) = PPP(month, actual_day) * TPP(month, actual_day)/1000;

% VPP = y1 * y2 * 3600;
VPP(month, actual_day) = QPP(month) * TPP(month, actual_day) * 3600;

% Calculate VAPP
VAPP(month, actual_day) = VPP(month, actual_day) + (QWS(month) * 24 * 3600);

% End