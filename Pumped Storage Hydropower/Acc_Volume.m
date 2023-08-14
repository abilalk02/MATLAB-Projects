%% Accumulative Addition or Deletion of Volume

% Calculate VLC (contribution to lower reservoir)
VLC(month, actual_day) = VRNP(month, actual_day) + VRPG(month, actual_day) + VRP(month, actual_day) + QWS(month) * 24 * 3600;

