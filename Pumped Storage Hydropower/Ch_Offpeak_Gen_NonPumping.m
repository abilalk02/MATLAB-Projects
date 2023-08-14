%% Ch-Offpeak Generation during non-pumping hours

if ((QR(month) + QPTR) > QCR)
    y5 = QCR;
else
    y5 = QR(month) + QPTR;
end

% Calculate PCONPH
if (QCNP(month, actual_day) > QCR)
   PCONPH_var = QCR;
else
    PCONPH_var = QCNP(month, actual_day);
end
PCONPH(month, actual_day) = PCONPH_var * HCR * nCT/100 * 9.81/1000;

% Calculate ECONPH
ECONPH(month, actual_day) = PCONPH(month, actual_day) * TPOGR(month, actual_day)/1000;

VRNP1(month, actual_day) = (QR(month) * TPOG(month, actual_day) + QPTR * TPOGR(month, actual_day) - QCNP(month, actual_day) * TPOG(month, actual_day)) * 3600;

% End