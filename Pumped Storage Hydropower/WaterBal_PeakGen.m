%% Water balance during peak generation mode

% Calculate PCPG
if (QR(month) > QCR)
    PCPG_var = QCR;
elseif ((QR(month) * 6) > QCR)
    PCPG_var = QCR;
else
    PCPG_var = QR(month) * 6;
end
PCPG(month, actual_day) = PCPG_var * HCR * nCT/100 * 9.81/1000;

QCPG(month, actual_day) = PCPG(month, actual_day) * 1000 / (9.81 * QCR * nCT/100);

QPPG(month, actual_day) = VPPG(month, actual_day) / TPPG / 3600;      % Check Formula

QRPG(month, actual_day) = QR(month) + QPPG(month, actual_day) - QCPG(month, actual_day);

% Calculate VRPG
VRPG(month, actual_day) = QRPG(month, actual_day) * TPPG * 3600;

% End