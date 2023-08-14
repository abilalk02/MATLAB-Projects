%% Calculate Spillage

if (day ~= 1)
    if (actual_day == 1)
       Spillage(month, actual_day) = VNUR(month - 1, 30) + VNET(month, actual_day) - VNUR(month, actual_day);
    else
       Spillage(month, actual_day) = VNUR(month, actual_day - 1) + VNET(month, actual_day) - VNUR(month, actual_day);
    end
end

% End