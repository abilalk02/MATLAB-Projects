%% Net Energy Balance of PSH

% Total Turbine Mode Energy Generation
EPTG(month, actual_day) = EPOG(month, actual_day) + EPPG(month, actual_day);

% Calculate PSH Net Balance
ENB(month, actual_day) = EPTG(month, actual_day) - EPP(month, actual_day);

% End