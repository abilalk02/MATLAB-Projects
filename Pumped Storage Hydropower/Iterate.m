%% For iterating with the optimized value of TPP

for month = 1:12
    
    % Calculate the other monthly variables
    Other_Vars;
    Total_Spillage = 0;
    ENB_Total2 = 0;
    
    % For all days of a month
    % It is assumed that all months have 30 days
    % The first day of the year is assumed to be Monday
    for day = (((month - 1) * 30) + 1): (((month - 1) * 30) + 30)
        
        % Calculate actual day of the month e.g
        % Overll 51st day is the 21st day of the 2nd month
        % Similarly, 73rd day is the 13th day of 3rd month, etc.
        if (month == 1)
            actual_day = day;
        else
            actual_day = rem(day,(((month - 1) * 30) + 1)) + 1;
        end
        
        % Calculate the value of LUR and LLR
        %LUR_LLR;
        
        % Calculate pumped volume (VPP) and pumped energy consumption (EPP)
        Pump_Mode;

        % Calculate volume utilized for peak generation (VPPG) and energy 
        % generation during peaking operation (EPPG)
        PeakGen_Mode;

        % Calculate volume utilized for off-peak generation (VPOG) and energy 
        % generation during off-peak operation (EPOG)
        OffpeakGen_Mode;

        % Calculate net balance between energy generation and pumping energy 
        % consumption
        Net_Energy_Balance;

        % Calculate remaining flow during pumping mode (QRP) and volume
        % addition or deletion in pumping mode (VRP)
        WaterBal_Pump;

        % Calculate remaining flow during peak generation mode (QRPG) and
        % volume addition or deletion in peak generation mode (VRPG)
        WaterBal_PeakGen;

        % Calculate addition or deletion of volume during non-pumping hours
        % (VRNP)
        WaterBal_NonPump;

        Lower_Res_VACC;

        Ch_Peak_Gen_Mode;

        Ch_Offpeak_Gen_Pumping;

        Ch_Offpeak_Gen_NonPumping;

        Ch_Total_Energy_Gen;
        
        Acc_Volume;
        
        % Calculate the value of VNUR and VNLR
        VPTG(month, actual_day) = VPPG(month, actual_day) + VPOG(month, actual_day);
        VNET(month, actual_day) = VAPP(month, actual_day) - VPTG(month, actual_day);

        if (day ~= 1)
            if (actual_day == 1)
               % Calculate VNUR
               if ((VNUR(month - 1, 30) + VNET(month, actual_day)) >= VUR)
                   VNUR(month, actual_day) = VUR;
               else
                   VNUR(month, actual_day) = VNUR(month - 1, 30) + VNET(month, actual_day);
               end
               
               % Calculate VNLR
               if ((VNLR(month - 1, 30) + VLC(month, actual_day)) > VLR)
                   VNLR(month, actual_day) = VLR;
               else
                   VNLR(month, actual_day) = VNLR(month - 1, 30) + VLC(month, actual_day);
               end
            else
               % Calculate VNUR
               if ((VNUR(month, actual_day - 1) + VNET(month, actual_day)) >= VUR) 
                   VNUR(month, actual_day) = VUR;  
               else  
                   VNUR(month, actual_day) = VNUR(month, actual_day - 1) + VNET(month, actual_day);      
               end
                
               % Calculate VNLR
               if ((VNLR(month, actual_day -1) + VLC(month, actual_day)) >= VLR)
                   VNLR(month, actual_day) = VLR;
               else
                   VNLR(month, actual_day) = VNLR(month, actual_day - 1) + VLC(month, actual_day);
               end
            end
        end
        
        % Calculate Spillage
        Calc_Spillage;
        Total_Spillage = Total_Spillage + Spillage(month, actual_day);

        ENB_Total2 = ENB_Total2 + ENB(month, actual_day);
    end
end

% Print total spillage and ENB
Total_Spillage
ENB_Total2