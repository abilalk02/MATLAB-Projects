%% Calculate other variables

% Calculate QPP
if (month > 3 && month < 10)        % Winter Months (October to March)
    if (QR(month) > QPPR)
        if ((QR(month) / 2) > QPPR)
            QPP(month) = (QPPR / 2) - QWS(month);
        else
            QPP(month) = (QR(month) / 4) - QWS(month);
        end
    else
        QPP(month) = (QR(month) / 2) - QWS(month);
    end
else                                % Summer Months (April to September)
    if (QR(month) > QPPR)
        if ((QR(month) / 2) > QPPR)
            QPP(month) = QPPR - QWS(month);
        else
            QPP(month) = (QR(month) / 2) - QWS(month);
        end
    else
        QPP(month) = QR(month) - QWS(month);
    end
end

% Calculate QC
if (QPP(month) > QPPR)
   QC_var = QPPR;
else
    QC_var = QPP(month);
end
QC(month) = QR(month) - QC_var;

% End