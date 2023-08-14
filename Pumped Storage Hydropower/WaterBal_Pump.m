%% Water balance under pumping mode

if (day ~= 1)
    if (actual_day ~= 1)
        if (VNLR(month, actual_day - 1) > LDR/100 * VLR)
            if (QC(month) > 0.2 * QCR)
                if (QC(month) > QCR)
                    QCP(month, actual_day) = QCR;
                else
                    QCP(month, actual_day) = QC(month);
                end
            else
                QCP(month, actual_day) = 0;
            end
        else
            QCP(month, actual_day) = 0;
        end
    else
        if (VNLR(month - 1, 30) > LDR/100 * VLR)
            if (QC(month) > 0.2 * QCR)
                if (QC(month) > QCR)
                    QCP(month, actual_day) = QCR;
                else
                    QCP(month, actual_day) = QC(month);
                end
            else
                QCP(month, actual_day) = 0;
            end
        else
            QCP(month, actual_day) = 0;
        end
    end
else
    if (VLR > LDR/100 * VLR)
        if (QC(month) > 0.2 * QCR)
           if (QC(month) > QCR)
               QCP(month, actual_day) = QCR;
           else
               QCP(month, actual_day) = QC(month);
           end
        else
            QCP(month, actual_day) = 0;
        end
    else
        QCP(month, actual_day) = 0;
    end
end


QRP(month, actual_day) = QR(month) - QCP(month, actual_day) - QPP(month);

% Calculate VRP
VRP(month, actual_day) = QRP(month, actual_day) * TPP(month, actual_day) * 3600;

% End