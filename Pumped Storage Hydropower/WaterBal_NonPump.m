%% Water balance during non-pumping mode

if (TPOGR(month, actual_day) == 0)
    QPRNP(month, actual_day) = 0;
else
    QPRNP(month, actual_day) = QPTR;
end

% Check Formula of QCNP
if (VLR > (LDR / 100 * VLR))
    if ((QR(month) + QPRNP(month, actual_day)) > (0.2 * QCR))
        if ((QR(month) + QPRNP(month, actual_day)) > QCR)
            QCNP(month, actual_day) = QCR;
        else
            QCNP(month, actual_day) = QR(month) + QPRNP(month, actual_day);
        end
    else
        QCNP(month, actual_day) = 0;
    end
else
    QCNP(month, actual_day) = 0;
end

% if ((VLR > (LDR / 100 * VLR)) || ((QR(month) + QPRNP(month, actual_day)) > (0.2 * QCR)) || ((QR(month) + QPRNP(month, actual_day)) > QCR)) 
%     QCNP(month, actual_day) = QCR;
% else
%     QCNP(month, actual_day) = QR(month) + QPRNP(month, actual_day);
% end

if (QPRNP(month, actual_day) == 0)
    QRNP(month, actual_day) = 0;
else
    QRNP(month, actual_day) = QPRNP(month, actual_day) + QR(month) - QCNP(month, actual_day);
end

% Calculate VRNP
VRNP(month, actual_day) = (TPOG(month, actual_day) * QR(month) + QPRNP(month, actual_day) * TPOGR(month, actual_day) - QCNP(month, actual_day) * TPOG(month, actual_day)) * 3600;

% End