clear all
close all
clc
warning off

global Nv A1 A2 A3 B1 B2 B3 C1 C2 C3 D1 D2 D3 BV_ index_start index_end Nfe
InitParams;
GenerateTwoPointBoundaryConfigForCAVs();
GenerateInitialGuessForNLP();
pause(1);
!ampl r0.run

for ii = 1 : (Nfe-1)
    delete('PCDO');
    fid = fopen('PCDO', 'w');
    fprintf(fid, '%g\r\n', ii);
    fclose(fid);
    !ampl r1.run
end
pause(2);
!ampl r2.run
load sol_status.txt
if (sol_status)
    dsa;
end