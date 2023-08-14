%% Lower Reservoir VACC

VACC(month, actual_day) = VRP(month, actual_day) + VRPG(month, actual_day) + VRNP(month, actual_day) + QWS(month) * 24 * 3600;

% End