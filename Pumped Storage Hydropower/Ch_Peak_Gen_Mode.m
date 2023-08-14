%% Ch-Peak Generation Mode

if ((QR(month) + QPTR) > QCR)
    y3 = QCR;
else
    y3 = QR(month) + QPTR;
end

QRPG1(month, actual_day) = QCPG(month, actual_day) + y3 - QCR;

% Calculate VRPG1
VRPG1(month, actual_day) = QRPG1(month, actual_day) * TPP(month, actual_day) * 3600;

% Calculate ECPG
ECPG(month, actual_day) = PCPG(month, actual_day) * TCPG/1000;

% End