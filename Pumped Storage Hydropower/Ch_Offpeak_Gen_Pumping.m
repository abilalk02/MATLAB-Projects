%% Ch-Offpeak Generation during pumping hours

if (QC(month) > QCR)
    y4 = QCR;
else
    y4 = QC(month);
end

% Calculate PCOPH
if (QCP(month, actual_day) > QCR)
   PCOPH_var = QCR;
else
    PCOPH_var = QCP(month, actual_day);
end
PCOPH(month, actual_day) = PCOPH_var * HCR * nCT/100 * 9.81/1000;

% Calculate ECOPH
ECOPH(month, actual_day) = PCOPH(month, actual_day) * TPP(month, actual_day)/1000;

QRP1(month, actual_day) = QR(month) - QCR - QCP(month, actual_day);

% Calculate VRP1
VRP1(month, actual_day) = QRP1(month, actual_day) * TPP(month, actual_day) * 3600;

% End