%% For interpolating the values of LUR and LLR

LUR(month, actual_day) = interp1(Inter_Upper_Vol, Inter_Upper_Level, VNUR(month, actual_day),'spline');

LLR(month, actual_day) = interp1(Inter_Lower_Vol, Inter_Lower_Level, VNLR(month, actual_day),'spline');

% end