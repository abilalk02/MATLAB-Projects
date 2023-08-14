%% Peak Generation Mode

HPTN = LUR - LLR - HL_T;

PPPG(month, actual_day) = 9.81 * QPTR * HPTN * nPT/10^5;

% Calculate EPPG
EPPG(month, actual_day) = PPPG(month, actual_day) * TPPG/1000;

% Calculate VPPG
VPPG(month, actual_day) = QPTR * TPPG * 3600;

% End