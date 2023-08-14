%% Off Peak Generation Mode

% Head Loss (HL_T) already calculated in PeakGen_Mode.m
% HL_T = HENT_T + HF_T + HEX_T + HB_T + HV_T;

% HPTN already calculated in PeakGen_Mode.m
% HPTN = LUR - LLR - HL_T;

if (month > 3 && month < 10)    % Winter months (October to March)    
%     if (actual_day == 1)
%         if (VNLR(month - 1, 30) < ((LDR / 100) * VLR))
%             TPOGR(month, actual_day) = TPOG(month, actual_day) / 2;
%         else
%             TPOGR(month, actual_day) = 0;
%         end
%     else
%         if (VNLR(month, actual_day - 1) < ((LDR / 100) * VLR))
%             TPOGR(month, actual_day) = TPOG(month, actual_day) / 2;
%         else
%             TPOGR(month, actual_day) = 0;
%         end
%     end
    TPOGR(month, actual_day) = 0;
else                            % Summer months (April to September)
    if (day == 1)
        TPOGR(1, 1) = TPOG(1, 1); 
    elseif (actual_day == 1)
        if (VNUR(month - 1, 30) > ((UDR / 100) * VUR))
            TPOGR(month, actual_day) = TPOG(month, actual_day);
        else
            TPOGR(month, actual_day) = 0;
        end
    else
        if (VNUR(month, actual_day - 1) > ((UDR / 100) * VUR))
            TPOGR(month, actual_day) = TPOG(month, actual_day);
        else
            TPOGR(month, actual_day) = 0;
        end
    end
end


% Calculate VPOG
VPOG(month, actual_day) = QPTR * TPOGR(month, actual_day) * 3600;

% Calculate PPOG
if (TPOG(month, actual_day) == 0)
    PPOG(month, actual_day) = 0;
else
    PPOG(month, actual_day) = 9.81 * (VPOG(month, actual_day) / TPOG(month, actual_day) /3600) * HPTN * nPT/10^5;
end

% Calculate EPOG
EPOG(month, actual_day) = PPOG(month, actual_day) * TPOGR(month, actual_day)/1000;

if (VNUR(month, actual_day) > VUR * UDR)
    y_OPG = TPOG(month, actual_day);
else
    y_OPG = 0;
end

% End