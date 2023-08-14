%% Optimization

% For all days of the year
% The variable 'day' holds the count of days from 1 to 365
% The variable 'actual_day' holds the value of actual day of the month
for month = 1:12
   for day = (((month - 1) * 30) + 1): (((month - 1) * 30) + 30)
      if (month == 1)
           actual_day = day;
      else
           actual_day = rem(day,(((month - 1) * 30) + 1)) + 1;
      end
      
      % If spillage is not equal to zero,
      % we find the value of TPP that for which we get spillage = 0
      if (Spillage(month, actual_day) ~= 0)
          min_spillage = Spillage(month, actual_day);
          best_tpp = TPP(month, actual_day);
          
          % We test for TPP values between 4 and 20 with jumps of 0.5
          for i = 4:0.5:20
              TPP(month, actual_day) = i;
              
              % Run all the functions as in the Runfile so that we can
              % calculate the new spillage value for a particular TPP
              Pump_Mode;
              PeakGen_Mode;
              OffpeakGen_Mode;
              Net_Energy_Balance;
              WaterBal_Pump;
              WaterBal_PeakGen;
              WaterBal_NonPump;
              Lower_Res_VACC;
              Ch_Peak_Gen_Mode;
              Ch_Offpeak_Gen_Pumping;
              Ch_Offpeak_Gen_NonPumping;
              Ch_Total_Energy_Gen;
              Acc_Volume;
              
              % Calculate VPTG and VNET
              VPTG(month, actual_day) = VPPG(month, actual_day) + VPOG(month, actual_day);
              VNET(month, actual_day) = VAPP(month, actual_day) - VPTG(month, actual_day);
              
              % Calculate VNUR
              if (day ~= 1)
                  if (actual_day == 1)
                    if ((VNUR(month - 1, 30) + VNET(month, actual_day)) >= VUR)
                       VNUR(month, actual_day) = VUR;
                    else
                       VNUR(month, actual_day) = VNUR(month - 1, 30) + VNET(month, actual_day);
                    end      
                  else
                    if ((VNUR(month, actual_day - 1) + VNET(month, actual_day)) >= VUR) 
                       VNUR(month, actual_day) = VUR;  
                    else  
                       VNUR(month, actual_day) = VNUR(month, actual_day - 1) + VNET(month, actual_day);      
                    end
                  end
              end
           
              % Calculate the spillage for this TPP value
              Calc_Spillage;
              
              % If the calculated spillage is less than the current
              % spillage, we update the value of TPP to the current TPP
              % value
              temp = Spillage(month, actual_day);
              if (temp <= min_spillage)
                 min_spillage = temp;
                 best_tpp = i;
              end      
          end
          
          % After processing the entire range of TPP values from 4 to 20,
          % we select the new TPP value as the one that gives the least
          % spillage
          TPP(month, actual_day) = best_tpp;
          Spillage(month, actual_day) = min_spillage;
      end
   end
end

% End