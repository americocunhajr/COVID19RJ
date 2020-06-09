clear all;
close all;
clc;

fullURL = ['https://covid.ourworldindata.org/data/owid-covid-data.csv'];
filename = 'owid-covid-data.csv';
urlwrite(fullURL,[pwd '/Dados/',filename]);
arquivogeral = readtable([pwd '/Dados/owid-covid-data.csv']);

fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
filename = 'cases-brazil-states.txt';
urlwrite(fullURL,[pwd '/Dados/',filename]);
BRarquivogeral = readtable([pwd '/Dados/cases-brazil-states.txt']);

% covid19rj_M_ST_WD_VA
% covid19rj_M_ST_WD_PM
% covid19rj_M_MC_WD
% covid19rj_M_CP_AC_WD
% covid19rj_M_CP_PS_WD
% covid19rj_M_VP_WD
% 
% 
% covid19rj_M_ST_AL_VA
% covid19rj_M_ST_AL_PM
% covid19rj_M_MC_AL
covid19rj_M_CP_AC_AL
covid19rj_M_CP_PS_AL
