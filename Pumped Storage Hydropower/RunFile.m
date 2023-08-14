%% Project Pump Storage Hydro Modelling
% Run file for execution

% Define Variables
Variable_Def;
ENB_Total = 0;

% For all months of the year
% 1st month is July and 12th month is June
for month = 1:12
    
    if (month ~= 1)
       TPP(month, 1) = TPP(month - 1, 31); 
    end
    
    % Calculate the other monthly variables
    Other_Vars;
    
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
        
        % Calculate the value of VACC
        Lower_Res_VACC;

        % Calculate VRPG and ECPG
        Ch_Peak_Gen_Mode;

        % Calculate offpeak pumping variables
        Ch_Offpeak_Gen_Pumping;

        % Calculate offpeak non-pumping variables
        Ch_Offpeak_Gen_NonPumping;

        % Calculate total energy
        Ch_Total_Energy_Gen;
        
        % Calculate accumulative addition or deletion of volume
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

        % Calculate the value of TPP
        if (actual_day == 30)
           actual_month = month + 1; 
        else
            actual_month = month;
        end
        if (actual_month > 12)
            actual_month = 12;
        end
        % if (weekend)
        if (rem(day + 1, (6*sat_count + sat)) == 0 || rem(day + 1, (7*sun_count)) == 0)
            if (rem(day + 1, (6*sat_count + sat)) == 0)
                sat_count = sat_count + 1;
                sat = sat + 1;
            else
                sun_count = sun_count + 1;
            end
            % Calculate TPP
            if (VNUR(month, actual_day) == VUR)
                TPP(month, actual_day + 1) = 24 - TRE(actual_month) - TPPG;
            else
                TPP(month, actual_day + 1) = 24 - TPPG;
            end
        % if (weekday)    
        else
            if (month < 4 || month > 9)     % For July-Sep & April-June
                % Calculate TPP
                if (VNUR(month, actual_day) == VUR)
                    TPP(month, actual_day + 1) = 24 - TRE(actual_month) - TPPG;
                else
                    TPP(month, actual_day + 1) = TRE(actual_month);
                end
            else                                % For Oct-March
                % Calculate TPP
                if (VNUR(month, actual_day) == VUR)
                    TPP(month, actual_day + 1) = 24 - TRE(actual_month) - TPPG;
                else
                    if ((VPPG(month, actual_day) /3600 / QPP(month)) > (24 - TPPG))
                        TPP(month, actual_day + 1) = 24 - TPPG;
                    else
                        TPP(month, actual_day + 1) = VPPG(month, actual_day) /3600 / QPP(month);
                    end
                end
            end
        end
        
        ENB_Total = ENB_Total + ENB(month, actual_day);
    end
end

% Print total spillage and ENB
Total_Spillage
ENB_Total



