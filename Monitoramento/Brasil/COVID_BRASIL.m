%=======================================================================%
%                             COVID-19                                  %
%                      OBSERVATÓRIO FLUMINENSE                          %
%                           covid19rj.org                               %
%                                                                       %
%                      - COVID-19 NO BRASIL -                           %
%                                                                       %
% Este algoritmo gera gráficos sobre os números de casos e mortes por   %
% Covid-19 no Brasil. Será gerado uma série de gráficos com os estados  %
% de cada região e de todo Brasil.                                      %
%                                                                       %
% A série contém:                                                       %
% - número de casos por milhão em relação ao tempo desde 10 casos por   %
% milhão;                                                               %
% - número de mortes por milhão em relação ao tempo desde 1 morte por   %
% milhão;                                                               %
% - número de novos casos por semana em relação ao total de casos (por  %
% milhão de habitantes);                                                %
% - número de novas mortes por semana em relação ao total de mortes     %
% (por milhão de habitantes).                                           %
%                                                                       %
% Você precisará do arquivo "arquivo_geral" encontrado no site do       %
% Ministério da Saúde:                                                  %
% https://covid.saude.gov.br/                                           %
%                                                                       %
%                                                                       %
%                             Malú Grave                                %
%                         malugravemg@gmail.com                         %
%                        malugrave@nacad.ufjr.br                        %
%                                                                       %
%         [x] Working                                                   %
% Status: [ ] Not working                                               %
%         [ ] Experimental                                              %
%                                                                       %
% Last Update [05/05/2020]                                              %
%_______________________________________________________________________%
%=======================================================================%

clc;
clear all;

% IMPORTANTE
% Esse código só funciona se o Ministério da Saúde manter o padrão de formatação dos arquivos.
% O padrão é:
% - Conter headers com os nomes: "estado","data","casosNovos","casosAcumulados", "obitosNovos", "obitosAcumulados".

% Região (1=Norte, 2=Nordeste, 3=Centro-Oeste, 4=Sudeste, 5=Sul, 6=Brasil
% Loop pra graficar todas as regiões
for(region = 1:1:6)
if (region == 1) 
begin_state = 1;
end_state = 7;
name = 'Norte';
end
if (region == 2) 
begin_state = 8;
end_state = 16;
name = 'Nordeste';
end
if (region == 3) 
begin_state = 17;
end_state = 20;
name = 'Centro-Oeste';
end
if (region == 4) 
begin_state = 21;
end_state = 24;
name = 'Sudeste';
end
if (region == 5) 
begin_state = 25;
end_state = 27;
name = 'Sul';
end
if (region == 6) 
begin_state = 1;
end_state = 27;
name = 'Brasil';
end

% Comparar também com os números do Brasil:
plotBR = 1;

% Definindo o dia zero para casos e mortes (por milhão)
X_cases = 10;
X_deaths = 1;

%Lendo o arquivo disponível no site do Ministério Público
data = readtable('arquivo_geral.csv');
BRASIL = [data.casosNovos , data.casosAcumulados, data.obitosNovos, data.obitosAcumulados];

%Definindo o número de dias com informações do COVID-19, que representa o tamanho das matrizes dos estados
[n1,n2] = size(BRASIL);
D = n1/27;

%Definindo até que dia temos informações
dia = data.data;
[n1dia,n2dia] = size(dia);
end_time = datestr(dia(n1dia,n2dia),24);

%Separando os dados em 27 sub-matrizes
for j=1:D
RO= BRASIL(find(strcmp([data.estado], 'RO')),:);
AC= BRASIL(find(strcmp([data.estado], 'AC')),:);
AM= BRASIL(find(strcmp([data.estado], 'AM')),:);
RR= BRASIL(find(strcmp([data.estado], 'RR')),:);
PA= BRASIL(find(strcmp([data.estado], 'PA')),:);
AP= BRASIL(find(strcmp([data.estado], 'AP')),:);
TO= BRASIL(find(strcmp([data.estado], 'TO')),:);
MA= BRASIL(find(strcmp([data.estado], 'MA')),:);
PI= BRASIL(find(strcmp([data.estado], 'PI')),:);
CE= BRASIL(find(strcmp([data.estado], 'CE')),:);
RN= BRASIL(find(strcmp([data.estado], 'RN')),:);
PB= BRASIL(find(strcmp([data.estado], 'PB')),:);
PE= BRASIL(find(strcmp([data.estado], 'PE')),:);
AL= BRASIL(find(strcmp([data.estado], 'AL')),:);
SE= BRASIL(find(strcmp([data.estado], 'SE')),:);
BA= BRASIL(find(strcmp([data.estado], 'BA')),:);
MG= BRASIL(find(strcmp([data.estado], 'MG')),:);
ES= BRASIL(find(strcmp([data.estado], 'ES')),:);
RJ= BRASIL(find(strcmp([data.estado], 'RJ')),:);
SP= BRASIL(find(strcmp([data.estado], 'SP')),:);
PR= BRASIL(find(strcmp([data.estado], 'PR')),:);
SC= BRASIL(find(strcmp([data.estado], 'SC')),:);
RS= BRASIL(find(strcmp([data.estado], 'RS')),:);
MS= BRASIL(find(strcmp([data.estado], 'MS')),:);
MT= BRASIL(find(strcmp([data.estado], 'MT')),:);
GO= BRASIL(find(strcmp([data.estado], 'GO')),:);
DF= BRASIL(find(strcmp([data.estado], 'DF')),:);
end

BR=RO+AC+AM+RR+PA+AP+TO+MA+PI+CE+RN+PB+PE+AL+SE+BA+MG+ES+RJ+SP+PR+SC+RS+MS+MT+MG+DF;

%População de cada estado (fonte wikipedia)
popRO=1777225;
popAC=881935;
popAM=4144597;
popRR=605761;
popPA=8602865;
popAP=845731;
popTO=1572866;
popMA=7075181;
popPI=3273227;
popCE=9132078;
popRN=3506853;
popPB=4018127;
popPE=9557071;
popAL=3337357;
popSE=2298696;
popBA=14873064;
popMG=21168791;
popES=4018650;
popRJ=17264943;
popSP=45919049;
popPR=11433957;
popSC=7164788;
popRS=11377239;
popMS=2778986;
popMT=3484466;
popGO=7018354;
popDF=3015268;

popBR=popRO+popAC+popAM+popRR+popPA+popAP+popTO+popMA+popPI+popCE+popRN+popPB+popPE+popAL+popSE+popBA+popMG+popES+popRJ+popSP+popPR+popSC+popRS+popMS+popMT+popMG+popDF;

% Consolidando os valores por semana

RO_week = RO;
for (i=7:D)
RO_week(i,1) = RO(i,1)+RO(i-1,1)+RO(i-2,1)+RO(i-3,1)+RO(i-4,1)+RO(i-5,1)+RO(i-6,1);
RO_week(i,3) = RO(i,3)+RO(i-1,3)+RO(i-2,3)+RO(i-3,3)+RO(i-4,3)+RO(i-5,3)+RO(i-6,3);
end
AC_week = AC;
for (i=7:D)
AC_week(i,1) = AC(i,1)+AC(i-1,1)+AC(i-2,1)+AC(i-3,1)+AC(i-4,1)+AC(i-5,1)+AC(i-6,1);
AC_week(i,3) = AC(i,3)+AC(i-1,3)+AC(i-2,3)+AC(i-3,3)+AC(i-4,3)+AC(i-5,3)+AC(i-6,3);
end
AM_week = AM;
for (i=7:D)
AM_week(i,1) = AM(i,1)+AM(i-1,1)+AM(i-2,1)+AM(i-3,1)+AM(i-4,1)+AM(i-5,1)+AM(i-6,1);
AM_week(i,3) = AM(i,3)+AM(i-1,3)+AM(i-2,3)+AM(i-3,3)+AM(i-4,3)+AM(i-5,3)+AM(i-6,3);
end
RR_week = RR;
for (i=7:D)
RR_week(i,1) = RR(i,1)+RR(i-1,1)+RR(i-2,1)+RR(i-3,1)+RR(i-4,1)+RR(i-5,1)+RR(i-6,1);
RR_week(i,3) = RR(i,3)+RR(i-1,3)+RR(i-2,3)+RR(i-3,3)+RR(i-4,3)+RR(i-5,3)+RR(i-6,3);
end
PA_week = PA;
for (i=7:D)
PA_week(i,1) = PA(i,1)+PA(i-1,1)+PA(i-2,1)+PA(i-3,1)+PA(i-4,1)+PA(i-5,1)+PA(i-6,1);
PA_week(i,3) = PA(i,3)+PA(i-1,3)+PA(i-2,3)+PA(i-3,3)+PA(i-4,3)+PA(i-5,3)+PA(i-6,3);
end
AP_week = AP;
for (i=7:D)
AP_week(i,1) = AP(i,1)+AP(i-1,1)+AP(i-2,1)+AP(i-3,1)+AP(i-4,1)+AP(i-5,1)+AP(i-6,1);
AP_week(i,3) = AP(i,3)+AP(i-1,3)+AP(i-2,3)+AP(i-3,3)+AP(i-4,3)+AP(i-5,3)+AP(i-6,3);
end
TO_week = TO;
for (i=7:D)
TO_week(i,1) = TO(i,1)+TO(i-1,1)+TO(i-2,1)+TO(i-3,1)+TO(i-4,1)+TO(i-5,1)+TO(i-6,1);
TO_week(i,3) = TO(i,3)+TO(i-1,3)+TO(i-2,3)+TO(i-3,3)+TO(i-4,3)+TO(i-5,3)+TO(i-6,3);
end
MA_week = MA;
for (i=7:D)
MA_week(i,1) = MA(i,1)+MA(i-1,1)+MA(i-2,1)+MA(i-3,1)+MA(i-4,1)+MA(i-5,1)+MA(i-6,1);
MA_week(i,3) = MA(i,3)+MA(i-1,3)+MA(i-2,3)+MA(i-3,3)+MA(i-4,3)+MA(i-5,3)+MA(i-6,3);
end
PI_week = PI;
for (i=7:D)
PI_week(i,1) = PI(i,1)+PI(i-1,1)+PI(i-2,1)+PI(i-3,1)+PI(i-4,1)+PI(i-5,1)+PI(i-6,1);
PI_week(i,3) = PI(i,3)+PI(i-1,3)+PI(i-2,3)+PI(i-3,3)+PI(i-4,3)+PI(i-5,3)+PI(i-6,3);
end
CE_week = CE;
for (i=7:D)
CE_week(i,1) = CE(i,1)+CE(i-1,1)+CE(i-2,1)+CE(i-3,1)+CE(i-4,1)+CE(i-5,1)+CE(i-6,1);
CE_week(i,3) = CE(i,3)+CE(i-1,3)+CE(i-2,3)+CE(i-3,3)+CE(i-4,3)+CE(i-5,3)+CE(i-6,3);
end
RN_week = RN;
for (i=7:D)
RN_week(i,1) = RN(i,1)+RN(i-1,1)+RN(i-2,1)+RN(i-3,1)+RN(i-4,1)+RN(i-5,1)+RN(i-6,1);
RN_week(i,3) = RN(i,3)+RN(i-1,3)+RN(i-2,3)+RN(i-3,3)+RN(i-4,3)+RN(i-5,3)+RN(i-6,3);
end
PB_week = PB;
for (i=7:D)
PB_week(i,1) = PB(i,1)+PB(i-1,1)+PB(i-2,1)+PB(i-3,1)+PB(i-4,1)+PB(i-5,1)+PB(i-6,1);
PB_week(i,3) = PB(i,3)+PB(i-1,3)+PB(i-2,3)+PB(i-3,3)+PB(i-4,3)+PB(i-5,3)+PB(i-6,3);
end
PE_week = PE;
for (i=7:D)
PE_week(i,1) = PE(i,1)+PE(i-1,1)+PE(i-2,1)+PE(i-3,1)+PE(i-4,1)+PE(i-5,1)+PE(i-6,1);
PE_week(i,3) = PE(i,3)+PE(i-1,3)+PE(i-2,3)+PE(i-3,3)+PE(i-4,3)+PE(i-5,3)+PE(i-6,3);
end
AL_week = AL;
for (i=7:D)
AL_week(i,1) = AL(i,1)+AL(i-1,1)+AL(i-2,1)+AL(i-3,1)+AL(i-4,1)+AL(i-5,1)+AL(i-6,1);
AL_week(i,3) = AL(i,3)+AL(i-1,3)+AL(i-2,3)+AL(i-3,3)+AL(i-4,3)+AL(i-5,3)+AL(i-6,3);
end
SE_week = SE;
for (i=7:D)
SE_week(i,1) = SE(i,1)+SE(i-1,1)+SE(i-2,1)+SE(i-3,1)+SE(i-4,1)+SE(i-5,1)+SE(i-6,1);
SE_week(i,3) = SE(i,3)+SE(i-1,3)+SE(i-2,3)+SE(i-3,3)+SE(i-4,3)+SE(i-5,3)+SE(i-6,3);
end
BA_week = BA;
for (i=7:D)
BA_week(i,1) = BA(i,1)+BA(i-1,1)+BA(i-2,1)+BA(i-3,1)+BA(i-4,1)+BA(i-5,1)+BA(i-6,1);
BA_week(i,3) = BA(i,3)+BA(i-1,3)+BA(i-2,3)+BA(i-3,3)+BA(i-4,3)+BA(i-5,3)+BA(i-6,3);
end
MG_week = MG;
for (i=7:D)
MG_week(i,1) = MG(i,1)+MG(i-1,1)+MG(i-2,1)+MG(i-3,1)+MG(i-4,1)+MG(i-5,1)+MG(i-6,1);
MG_week(i,3) = MG(i,3)+MG(i-1,3)+MG(i-2,3)+MG(i-3,3)+MG(i-4,3)+MG(i-5,3)+MG(i-6,3);
end
ES_week = ES;
for (i=7:D)
ES_week(i,1) = ES(i,1)+ES(i-1,1)+ES(i-2,1)+ES(i-3,1)+ES(i-4,1)+ES(i-5,1)+ES(i-6,1);
ES_week(i,3) = ES(i,3)+ES(i-1,3)+ES(i-2,3)+ES(i-3,3)+ES(i-4,3)+ES(i-5,3)+ES(i-6,3);
end
MG_week = MG;
for (i=7:D)
MG_week(i,1) = MG(i,1)+MG(i-1,1)+MG(i-2,1)+MG(i-3,1)+MG(i-4,1)+MG(i-5,1)+MG(i-6,1);
MG_week(i,3) = MG(i,3)+MG(i-1,3)+MG(i-2,3)+MG(i-3,3)+MG(i-4,3)+MG(i-5,3)+MG(i-6,3);
end
RJ_week = RJ;
for (i=7:D)
RJ_week(i,1) = RJ(i,1)+RJ(i-1,1)+RJ(i-2,1)+RJ(i-3,1)+RJ(i-4,1)+RJ(i-5,1)+RJ(i-6,1);
RJ_week(i,3) = RJ(i,3)+RJ(i-1,3)+RJ(i-2,3)+RJ(i-3,3)+RJ(i-4,3)+RJ(i-5,3)+RJ(i-6,3);
end
SP_week = SP;
for (i=7:D)
SP_week(i,1) = SP(i,1)+SP(i-1,1)+SP(i-2,1)+SP(i-3,1)+SP(i-4,1)+SP(i-5,1)+SP(i-6,1);
SP_week(i,3) = SP(i,3)+SP(i-1,3)+SP(i-2,3)+SP(i-3,3)+SP(i-4,3)+SP(i-5,3)+SP(i-6,3);
end
PR_week = PR;
for (i=7:D)
PR_week(i,1) = PR(i,1)+PR(i-1,1)+PR(i-2,1)+PR(i-3,1)+PR(i-4,1)+PR(i-5,1)+PR(i-6,1);
PR_week(i,3) = PR(i,3)+PR(i-1,3)+PR(i-2,3)+PR(i-3,3)+PR(i-4,3)+PR(i-5,3)+PR(i-6,3);
end
SC_week = SC;
for (i=7:D)
SC_week(i,1) = SC(i,1)+SC(i-1,1)+SC(i-2,1)+SC(i-3,1)+SC(i-4,1)+SC(i-5,1)+SC(i-6,1);
SC_week(i,3) = SC(i,3)+SC(i-1,3)+SC(i-2,3)+SC(i-3,3)+SC(i-4,3)+SC(i-5,3)+SC(i-6,3);
end
RS_week = RS;
for (i=7:D)
RS_week(i,1) = RS(i,1)+RS(i-1,1)+RS(i-2,1)+RS(i-3,1)+RS(i-4,1)+RS(i-5,1)+RS(i-6,1);
RS_week(i,3) = RS(i,3)+RS(i-1,3)+RS(i-2,3)+RS(i-3,3)+RS(i-4,3)+RS(i-5,3)+RS(i-6,3);
end
MS_week = MS;
for (i=7:D)
MS_week(i,1) = MS(i,1)+MS(i-1,1)+MS(i-2,1)+MS(i-3,1)+MS(i-4,1)+MS(i-5,1)+MS(i-6,1);
MS_week(i,3) = MS(i,3)+MS(i-1,3)+MS(i-2,3)+MS(i-3,3)+MS(i-4,3)+MS(i-5,3)+MS(i-6,3);
end
MT_week = MT;
for (i=7:D)
MT_week(i,1) = MT(i,1)+MT(i-1,1)+MT(i-2,1)+MT(i-3,1)+MT(i-4,1)+MT(i-5,1)+MT(i-6,1);
MT_week(i,3) = MT(i,3)+MT(i-1,3)+MT(i-2,3)+MT(i-3,3)+MT(i-4,3)+MT(i-5,3)+MT(i-6,3);
end
GO_week = GO;
for (i=7:D)
GO_week(i,1) = GO(i,1)+GO(i-1,1)+GO(i-2,1)+GO(i-3,1)+GO(i-4,1)+GO(i-5,1)+GO(i-6,1);
GO_week(i,3) = GO(i,3)+GO(i-1,3)+GO(i-2,3)+GO(i-3,3)+GO(i-4,3)+GO(i-5,3)+GO(i-6,3);
end
DF_week = DF;
for (i=7:D)
DF_week(i,1) = DF(i,1)+DF(i-1,1)+DF(i-2,1)+DF(i-3,1)+DF(i-4,1)+DF(i-5,1)+DF(i-6,1);
DF_week(i,3) = DF(i,3)+DF(i-1,3)+DF(i-2,3)+DF(i-3,3)+DF(i-4,3)+DF(i-5,3)+DF(i-6,3);
end
BR_week = BR;
for (i=7:D)
BR_week(i,1) = BR(i,1)+BR(i-1,1)+BR(i-2,1)+BR(i-3,1)+BR(i-4,1)+BR(i-5,1)+BR(i-6,1);
BR_week(i,3) = BR(i,3)+BR(i-1,3)+BR(i-2,3)+BR(i-3,3)+BR(i-4,3)+BR(i-5,3)+BR(i-6,3);
end

% Definindo valores por milhão
RO_per_million = RO / (popRO / 1000000);
AC_per_million = AC / (popAC / 1000000);
AM_per_million = AM / (popAM / 1000000);
RR_per_million = RR / (popRR / 1000000);
PA_per_million = PA / (popPA / 1000000);
AP_per_million = AP / (popAP / 1000000);
TO_per_million = TO / (popTO / 1000000);
MA_per_million = MA / (popMA / 1000000);
PI_per_million = PI / (popPI / 1000000);
CE_per_million = CE / (popCE / 1000000);
RN_per_million = RN / (popRN / 1000000);
PB_per_million = PB / (popPB / 1000000);
PE_per_million = PE / (popPE / 1000000);
AL_per_million = AL / (popAL / 1000000);
SE_per_million = SE / (popSE / 1000000);
BA_per_million = BA / (popBA / 1000000);
MG_per_million = MG / (popMG / 1000000);
ES_per_million = ES / (popES / 1000000);
RJ_per_million = RJ / (popRJ / 1000000);
SP_per_million = SP / (popSP / 1000000);
PR_per_million = PR / (popPR / 1000000);
SC_per_million = SC / (popSC / 1000000);
RS_per_million = RS / (popRS / 1000000);
MS_per_million = MS / (popMS / 1000000);
MT_per_million = MT / (popMT / 1000000);
GO_per_million = GO / (popGO / 1000000);
DF_per_million = DF / (popDF / 1000000);
BR_per_million = BR / (popBR / 1000000);


RO_per_million_week = RO_week/ (popRO / 1000000);
AC_per_million_week = AC_week/ (popAC / 1000000);
AM_per_million_week = AM_week/ (popAM / 1000000);
RR_per_million_week = RR_week/ (popRR / 1000000);
PA_per_million_week = PA_week/ (popPA / 1000000);
AP_per_million_week = AP_week/ (popAP / 1000000);
TO_per_million_week = TO_week/ (popTO / 1000000);
MA_per_million_week = MA_week/ (popMA / 1000000);
PI_per_million_week = PI_week/ (popPI / 1000000);
CE_per_million_week = CE_week/ (popCE / 1000000);
RN_per_million_week = RN_week/ (popRN / 1000000);
PB_per_million_week = PB_week/ (popPB / 1000000);
PE_per_million_week = PE_week/ (popPE / 1000000);
AL_per_million_week = AL_week/ (popAL / 1000000);
SE_per_million_week = SE_week/ (popSE / 1000000);
BA_per_million_week = BA_week/ (popBA / 1000000);
MG_per_million_week = MG_week/ (popMG / 1000000);
ES_per_million_week = ES_week/ (popES / 1000000);
RJ_per_million_week = RJ_week/ (popRJ / 1000000);
SP_per_million_week = SP_week/ (popSP / 1000000);
PR_per_million_week = PR_week/ (popPR / 1000000);
SC_per_million_week = SC_week/ (popSC / 1000000);
RS_per_million_week = RS_week/ (popRS / 1000000);
MS_per_million_week = MS_week/ (popMS / 1000000);
MT_per_million_week = MT_week/ (popMT / 1000000);
GO_per_million_week = GO_week/ (popGO / 1000000);
DF_per_million_week = DF_week/ (popDF / 1000000);
BR_per_million_week = BR_week/ (popBR / 1000000);


%Criando vetores desde dia zero a partir de X mortes/milhao ("_deaths") ou a partir de X casos/milhao ("_cases")
%Usuário define dia zero para casos ou mortes
n=0;
N=0;
for i=1:D
if (RO_per_million(i,4) >= X_deaths)
n=n+1;
RO_deaths(n,1) = RO_per_million(i,1);
RO_deaths(n,2) = RO_per_million(i,2);
RO_deaths(n,3) = RO_per_million(i,3);
RO_deaths(n,4) = RO_per_million(i,4);
end
if (RO_per_million(i,2) >= X_cases)
N=N+1;
RO_cases(N,1) = RO_per_million(i,1);
RO_cases(N,2) = RO_per_million(i,2);
RO_cases(N,3) = RO_per_million(i,3);
RO_cases(N,4) = RO_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (AC_per_million(i,4) >= X_deaths)
n=n+1;
AC_deaths(n,1) = AC_per_million(i,1);
AC_deaths(n,2) = AC_per_million(i,2);
AC_deaths(n,3) = AC_per_million(i,3);
AC_deaths(n,4) = AC_per_million(i,4);
end
if (AC_per_million(i,2) >= X_cases)
N=N+1;
AC_cases(N,1) = AC_per_million(i,1);
AC_cases(N,2) = AC_per_million(i,2);
AC_cases(N,3) = AC_per_million(i,3);
AC_cases(N,4) = AC_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (AM_per_million(i,4) >= X_deaths)
n=n+1;
AM_deaths(n,1) = AM_per_million(i,1);
AM_deaths(n,2) = AM_per_million(i,2);
AM_deaths(n,3) = AM_per_million(i,3);
AM_deaths(n,4) = AM_per_million(i,4);
end
if (AM_per_million(i,2) >= X_cases)
N=N+1;
AM_cases(N,1) = AM_per_million(i,1);
AM_cases(N,2) = AM_per_million(i,2);
AM_cases(N,3) = AM_per_million(i,3);
AM_cases(N,4) = AM_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (RR_per_million(i,4) >= X_deaths)
n=n+1;
RR_deaths(n,1) = RR_per_million(i,1);
RR_deaths(n,2) = RR_per_million(i,2);
RR_deaths(n,3) = RR_per_million(i,3);
RR_deaths(n,4) = RR_per_million(i,4);
end
if (RR_per_million(i,2) >= X_cases)
N=N+1;
RR_cases(N,1) = RR_per_million(i,1);
RR_cases(N,2) = RR_per_million(i,2);
RR_cases(N,3) = RR_per_million(i,3);
RR_cases(N,4) = RR_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (PA_per_million(i,4) >= X_deaths)
n=n+1;
PA_deaths(n,1) = PA_per_million(i,1);
PA_deaths(n,2) = PA_per_million(i,2);
PA_deaths(n,3) = PA_per_million(i,3);
PA_deaths(n,4) = PA_per_million(i,4);
end
if (PA_per_million(i,2) >= X_cases)
N=N+1;
PA_cases(N,1) = PA_per_million(i,1);
PA_cases(N,2) = PA_per_million(i,2);
PA_cases(N,3) = PA_per_million(i,3);
PA_cases(N,4) = PA_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (AP_per_million(i,4) >= X_deaths)
n=n+1;
AP_deaths(n,1) = AP_per_million(i,1);
AP_deaths(n,2) = AP_per_million(i,2);
AP_deaths(n,3) = AP_per_million(i,3);
AP_deaths(n,4) = AP_per_million(i,4);
end
if (AP_per_million(i,2) >= X_cases)
N=N+1;
AP_cases(N,1) = AP_per_million(i,1);
AP_cases(N,2) = AP_per_million(i,2);
AP_cases(N,3) = AP_per_million(i,3);
AP_cases(N,4) = AP_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (TO_per_million(i,4) >= X_deaths)
n=n+1;
TO_deaths(n,1) = TO_per_million(i,1);
TO_deaths(n,2) = TO_per_million(i,2);
TO_deaths(n,3) = TO_per_million(i,3);
TO_deaths(n,4) = TO_per_million(i,4);
end
if (TO_per_million(i,2) >= X_cases)
N=N+1;
TO_cases(N,1) = TO_per_million(i,1);
TO_cases(N,2) = TO_per_million(i,2);
TO_cases(N,3) = TO_per_million(i,3);
TO_cases(N,4) = TO_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (MA_per_million(i,4) >= X_deaths)
n=n+1;
MA_deaths(n,1) = MA_per_million(i,1);
MA_deaths(n,2) = MA_per_million(i,2);
MA_deaths(n,3) = MA_per_million(i,3);
MA_deaths(n,4) = MA_per_million(i,4);
end
if (MA_per_million(i,2) >= X_cases)
N=N+1;
MA_cases(N,1) = MA_per_million(i,1);
MA_cases(N,2) = MA_per_million(i,2);
MA_cases(N,3) = MA_per_million(i,3);
MA_cases(N,4) = MA_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (PI_per_million(i,4) >= X_deaths)
n=n+1;
PI_deaths(n,1) = PI_per_million(i,1);
PI_deaths(n,2) = PI_per_million(i,2);
PI_deaths(n,3) = PI_per_million(i,3);
PI_deaths(n,4) = PI_per_million(i,4);
end
if (PI_per_million(i,2) >= X_cases)
N=N+1;
PI_cases(N,1) = PI_per_million(i,1);
PI_cases(N,2) = PI_per_million(i,2);
PI_cases(N,3) = PI_per_million(i,3);
PI_cases(N,4) = PI_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (CE_per_million(i,4) >= X_deaths)
n=n+1;
CE_deaths(n,1) = CE_per_million(i,1);
CE_deaths(n,2) = CE_per_million(i,2);
CE_deaths(n,3) = CE_per_million(i,3);
CE_deaths(n,4) = CE_per_million(i,4);
end
if (CE_per_million(i,2) >= X_cases)
N=N+1;
CE_cases(N,1) = CE_per_million(i,1);
CE_cases(N,2) = CE_per_million(i,2);
CE_cases(N,3) = CE_per_million(i,3);
CE_cases(N,4) = CE_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (RN_per_million(i,4) >= X_deaths)
n=n+1;
RN_deaths(n,1) = RN_per_million(i,1);
RN_deaths(n,2) = RN_per_million(i,2);
RN_deaths(n,3) = RN_per_million(i,3);
RN_deaths(n,4) = RN_per_million(i,4);
end
if (RN_per_million(i,2) >= X_cases)
N=N+1;
RN_cases(N,1) = RN_per_million(i,1);
RN_cases(N,2) = RN_per_million(i,2);
RN_cases(N,3) = RN_per_million(i,3);
RN_cases(N,4) = RN_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (PB_per_million(i,4) >= X_deaths)
n=n+1;
PB_deaths(n,1) = PB_per_million(i,1);
PB_deaths(n,2) = PB_per_million(i,2);
PB_deaths(n,3) = PB_per_million(i,3);
PB_deaths(n,4) = PB_per_million(i,4);
end
if (PB_per_million(i,2) >= X_cases)
N=N+1;
PB_cases(N,1) = PB_per_million(i,1);
PB_cases(N,2) = PB_per_million(i,2);
PB_cases(N,3) = PB_per_million(i,3);
PB_cases(N,4) = PB_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (PE_per_million(i,4) >= X_deaths)
n=n+1;
PE_deaths(n,1) = PE_per_million(i,1);
PE_deaths(n,2) = PE_per_million(i,2);
PE_deaths(n,3) = PE_per_million(i,3);
PE_deaths(n,4) = PE_per_million(i,4);
end
if (PE_per_million(i,2) >= X_cases)
N=N+1;
PE_cases(N,1) = PE_per_million(i,1);
PE_cases(N,2) = PE_per_million(i,2);
PE_cases(N,3) = PE_per_million(i,3);
PE_cases(N,4) = PE_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (AL_per_million(i,4) >= X_deaths)
n=n+1;
AL_deaths(n,1) = AL_per_million(i,1);
AL_deaths(n,2) = AL_per_million(i,2);
AL_deaths(n,3) = AL_per_million(i,3);
AL_deaths(n,4) = AL_per_million(i,4);
end
if (AL_per_million(i,2) >= X_cases)
N=N+1;
AL_cases(N,1) = AL_per_million(i,1);
AL_cases(N,2) = AL_per_million(i,2);
AL_cases(N,3) = AL_per_million(i,3);
AL_cases(N,4) = AL_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (SE_per_million(i,4) >= X_deaths)
n=n+1;
SE_deaths(n,1) = SE_per_million(i,1);
SE_deaths(n,2) = SE_per_million(i,2);
SE_deaths(n,3) = SE_per_million(i,3);
SE_deaths(n,4) = SE_per_million(i,4);
end
if (SE_per_million(i,2) >= X_cases)
N=N+1;
SE_cases(N,1) = SE_per_million(i,1);
SE_cases(N,2) = SE_per_million(i,2);
SE_cases(N,3) = SE_per_million(i,3);
SE_cases(N,4) = SE_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (BA_per_million(i,4) >= X_deaths)
n=n+1;
BA_deaths(n,1) = BA_per_million(i,1);
BA_deaths(n,2) = BA_per_million(i,2);
BA_deaths(n,3) = BA_per_million(i,3);
BA_deaths(n,4) = BA_per_million(i,4);
end
if (BA_per_million(i,2) >= X_cases)
N=N+1;
BA_cases(N,1) = BA_per_million(i,1);
BA_cases(N,2) = BA_per_million(i,2);
BA_cases(N,3) = BA_per_million(i,3);
BA_cases(N,4) = BA_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (MG_per_million(i,4) >= X_deaths)
n=n+1;
MG_deaths(n,1) = MG_per_million(i,1);
MG_deaths(n,2) = MG_per_million(i,2);
MG_deaths(n,3) = MG_per_million(i,3);
MG_deaths(n,4) = MG_per_million(i,4);
end
if (MG_per_million(i,2) >= X_cases)
N=N+1;
MG_cases(N,1) = MG_per_million(i,1);
MG_cases(N,2) = MG_per_million(i,2);
MG_cases(N,3) = MG_per_million(i,3);
MG_cases(N,4) = MG_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (ES_per_million(i,4) >= X_deaths)
n=n+1;
ES_deaths(n,1) = ES_per_million(i,1);
ES_deaths(n,2) = ES_per_million(i,2);
ES_deaths(n,3) = ES_per_million(i,3);
ES_deaths(n,4) = ES_per_million(i,4);
end
if (ES_per_million(i,2) >= X_cases)
N=N+1;
ES_cases(N,1) = ES_per_million(i,1);
ES_cases(N,2) = ES_per_million(i,2);
ES_cases(N,3) = ES_per_million(i,3);
ES_cases(N,4) = ES_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (RJ_per_million(i,4) >= X_deaths)
n=n+1;
RJ_deaths(n,1) = RJ_per_million(i,1);
RJ_deaths(n,2) = RJ_per_million(i,2);
RJ_deaths(n,3) = RJ_per_million(i,3);
RJ_deaths(n,4) = RJ_per_million(i,4);
end
if (RJ_per_million(i,2) >= X_cases)
N=N+1;
RJ_cases(N,1) = RJ_per_million(i,1);
RJ_cases(N,2) = RJ_per_million(i,2);
RJ_cases(N,3) = RJ_per_million(i,3);
RJ_cases(N,4) = RJ_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (SP_per_million(i,4) >= X_deaths)
n=n+1;
SP_deaths(n,1) = SP_per_million(i,1);
SP_deaths(n,2) = SP_per_million(i,2);
SP_deaths(n,3) = SP_per_million(i,3);
SP_deaths(n,4) = SP_per_million(i,4);
end
if (SP_per_million(i,2) >= X_cases)
N=N+1;
SP_cases(N,1) = SP_per_million(i,1);
SP_cases(N,2) = SP_per_million(i,2);
SP_cases(N,3) = SP_per_million(i,3);
SP_cases(N,4) = SP_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (PR_per_million(i,4) >= X_deaths)
n=n+1;
PR_deaths(n,1) = PR_per_million(i,1);
PR_deaths(n,2) = PR_per_million(i,2);
PR_deaths(n,3) = PR_per_million(i,3);
PR_deaths(n,4) = PR_per_million(i,4);
end
if (PR_per_million(i,2) >= X_cases)
N=N+1;
PR_cases(N,1) = PR_per_million(i,1);
PR_cases(N,2) = PR_per_million(i,2);
PR_cases(N,3) = PR_per_million(i,3);
PR_cases(N,4) = PR_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (SC_per_million(i,4) >= X_deaths)
n=n+1;
SC_deaths(n,1) = SC_per_million(i,1);
SC_deaths(n,2) = SC_per_million(i,2);
SC_deaths(n,3) = SC_per_million(i,3);
SC_deaths(n,4) = SC_per_million(i,4);
end
if (SC_per_million(i,2) >= X_cases)
N=N+1;
SC_cases(N,1) = SC_per_million(i,1);
SC_cases(N,2) = SC_per_million(i,2);
SC_cases(N,3) = SC_per_million(i,3);
SC_cases(N,4) = SC_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (RS_per_million(i,4) >= X_deaths)
n=n+1;
RS_deaths(n,1) = RS_per_million(i,1);
RS_deaths(n,2) = RS_per_million(i,2);
RS_deaths(n,3) = RS_per_million(i,3);
RS_deaths(n,4) = RS_per_million(i,4);
end
if (RS_per_million(i,2) >= X_cases)
N=N+1;
RS_cases(N,1) = RS_per_million(i,1);
RS_cases(N,2) = RS_per_million(i,2);
RS_cases(N,3) = RS_per_million(i,3);
RS_cases(N,4) = RS_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (MS_per_million(i,4) >= X_deaths)
n=n+1;
MS_deaths(n,1) = MS_per_million(i,1);
MS_deaths(n,2) = MS_per_million(i,2);
MS_deaths(n,3) = MS_per_million(i,3);
MS_deaths(n,4) = MS_per_million(i,4);
end
if (MS_per_million(i,2) >= X_cases)
N=N+1;
MS_cases(N,1) = MS_per_million(i,1);
MS_cases(N,2) = MS_per_million(i,2);
MS_cases(N,3) = MS_per_million(i,3);
MS_cases(N,4) = MS_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (MT_per_million(i,4) >= X_deaths)
n=n+1;
MT_deaths(n,1) = MT_per_million(i,1);
MT_deaths(n,2) = MT_per_million(i,2);
MT_deaths(n,3) = MT_per_million(i,3);
MT_deaths(n,4) = MT_per_million(i,4);
end
if (MT_per_million(i,2) >= X_cases)
N=N+1;
MT_cases(N,1) = MT_per_million(i,1);
MT_cases(N,2) = MT_per_million(i,2);
MT_cases(N,3) = MT_per_million(i,3);
MT_cases(N,4) = MT_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (GO_per_million(i,4) >= X_deaths)
n=n+1;
GO_deaths(n,1) = GO_per_million(i,1);
GO_deaths(n,2) = GO_per_million(i,2);
GO_deaths(n,3) = GO_per_million(i,3);
GO_deaths(n,4) = GO_per_million(i,4);
end
if (GO_per_million(i,2) >= X_cases)
N=N+1;
GO_cases(N,1) = GO_per_million(i,1);
GO_cases(N,2) = GO_per_million(i,2);
GO_cases(N,3) = GO_per_million(i,3);
GO_cases(N,4) = GO_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (DF_per_million(i,4) >= X_deaths)
n=n+1;
DF_deaths(n,1) = DF_per_million(i,1);
DF_deaths(n,2) = DF_per_million(i,2);
DF_deaths(n,3) = DF_per_million(i,3);
DF_deaths(n,4) = DF_per_million(i,4);
end
if (DF_per_million(i,2) >= X_cases)
N=N+1;
DF_cases(N,1) = DF_per_million(i,1);
DF_cases(N,2) = DF_per_million(i,2);
DF_cases(N,3) = DF_per_million(i,3);
DF_cases(N,4) = DF_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (BR_per_million(i,4) >= X_deaths)
n=n+1;
BR_deaths(n,1) = BR_per_million(i,1);
BR_deaths(n,2) = BR_per_million(i,2);
BR_deaths(n,3) = BR_per_million(i,3);
BR_deaths(n,4) = BR_per_million(i,4);
end
if (BR_per_million(i,2) >= X_cases)
N=N+1;
BR_cases(N,1) = BR_per_million(i,1);
BR_cases(N,2) = BR_per_million(i,2);
BR_cases(N,3) = BR_per_million(i,3);
BR_cases(N,4) = BR_per_million(i,4);
end
end

%Definindo valor maximo dos eixos, considerando todos os estados
%Dias aumentam de 5 em 5
max_aux = max([max(size(RO_deaths)) max(size(AC_deaths)) max(size(AM_deaths)) max(size(RR_deaths)) max(size(PA_deaths)) max(size(AP_deaths)) max(size(TO_deaths)) max(size(MA_deaths)) max(size(PI_deaths)) max(size(CE_deaths)) max(size(RN_deaths)) max(size(PB_deaths)) max(size(PE_deaths)) max(size(AL_deaths)) max(size(SE_deaths)) max(size(BA_deaths)) max(size(MG_deaths)) max(size(ES_deaths)) max(size(RJ_deaths)) max(size(SP_deaths)) max(size(PR_deaths)) max(size(SC_deaths)) max(size(RS_deaths)) max(size(MS_deaths)) max(size(MT_deaths)) max(size(GO_deaths)) max(size(DF_deaths)) max(size(BR_deaths))]);
axis_days_deaths = idivide(max_aux,int32(5),'ceil') * 5 + 10;
max_aux = max([max(size(RO_cases)) max(size(AC_cases)) max(size(AM_cases)) max(size(RR_cases)) max(size(PA_cases)) max(size(AP_cases)) max(size(TO_cases)) max(size(MA_cases)) max(size(PI_cases)) max(size(CE_cases)) max(size(RN_cases)) max(size(PB_cases)) max(size(PE_cases)) max(size(AL_cases)) max(size(SE_cases)) max(size(BA_cases)) max(size(MG_cases)) max(size(ES_cases)) max(size(RJ_cases)) max(size(SP_cases)) max(size(PR_cases)) max(size(SC_cases)) max(size(RS_cases)) max(size(MS_cases)) max(size(MT_cases)) max(size(GO_cases)) max(size(DF_cases)) max(size(BR_cases))]);
axis_days_cases = idivide(max_aux,int32(5),'ceil') * 5 + 10;
%Mortes aumentam em escala log de 10
max_aux = max([max(RO_per_million_week(:,4)) max(AC_per_million_week(:,4)) max(AM_per_million_week(:,4)) max(RR_per_million_week(:,4)) max(PA_per_million_week(:,4)) max(AP_per_million_week(:,4)) max(TO_per_million_week(:,4)) max(MA_per_million_week(:,4)) max(PI_per_million_week(:,4)) max(CE_per_million_week(:,4)) max(RN_per_million_week(:,4)) max(PB_per_million_week(:,4)) max(PE_per_million_week(:,4)) max(AL_per_million_week(:,4)) max(SE_per_million_week(:,4)) max(BA_per_million_week(:,4)) max(MG_per_million_week(:,4)) max(ES_per_million_week(:,4)) max(RJ_per_million_week(:,4)) max(SP_per_million_week(:,4)) max(PR_per_million_week(:,4)) max(SC_per_million_week(:,4)) max(RS_per_million_week(:,4)) max(MS_per_million_week(:,4)) max(MT_per_million_week(:,4)) max(GO_per_million_week(:,4)) max(DF_per_million_week(:,4)) max(BR_per_million_week(:,4))]);
axis_deaths = 10^(ceil(log10(max_aux)));
%Casos aumentam em escala log de 10
max_aux = max([max(RO_per_million_week(:,2)) max(AC_per_million_week(:,2)) max(AM_per_million_week(:,2)) max(RR_per_million_week(:,2)) max(PA_per_million_week(:,2)) max(AP_per_million_week(:,2)) max(TO_per_million_week(:,2)) max(MA_per_million_week(:,2)) max(PI_per_million_week(:,2)) max(CE_per_million_week(:,2)) max(RN_per_million_week(:,2)) max(PB_per_million_week(:,2)) max(PE_per_million_week(:,2)) max(AL_per_million_week(:,2)) max(SE_per_million_week(:,2)) max(BA_per_million_week(:,2)) max(MG_per_million_week(:,2)) max(ES_per_million_week(:,2)) max(RJ_per_million_week(:,2)) max(SP_per_million_week(:,2)) max(PR_per_million_week(:,2)) max(SC_per_million_week(:,2)) max(RS_per_million_week(:,2)) max(MS_per_million_week(:,2)) max(MT_per_million_week(:,2)) max(MG_per_million_week(:,2)) max(DF_per_million_week(:,2)) max(BR_per_million_week(:,2))]);
axis_cases = 10^(ceil(log10(max_aux)));
%Novas mortes aumentam em escala log de 10
max_aux = max([max(RO_per_million_week(:,3)) max(AC_per_million_week(:,3)) max(AM_per_million_week(:,3)) max(RR_per_million_week(:,3)) max(PA_per_million_week(:,3)) max(AP_per_million_week(:,3)) max(TO_per_million_week(:,3)) max(MA_per_million_week(:,3)) max(PI_per_million_week(:,3)) max(CE_per_million_week(:,3)) max(RN_per_million_week(:,3)) max(PB_per_million_week(:,3)) max(PE_per_million_week(:,3)) max(AL_per_million_week(:,3)) max(SE_per_million_week(:,3)) max(BA_per_million_week(:,3)) max(MG_per_million_week(:,3)) max(ES_per_million_week(:,3)) max(RJ_per_million_week(:,3)) max(SP_per_million_week(:,3)) max(PR_per_million_week(:,3)) max(SC_per_million_week(:,3)) max(RS_per_million_week(:,3)) max(MS_per_million_week(:,3)) max(MT_per_million_week(:,3)) max(GO_per_million_week(:,3)) max(DF_per_million_week(:,3)) max(BR_per_million_week(:,3))]);
axis_new_deaths = 10^(ceil(log10(max_aux)));
%Novos casos aumentam em escala log de 10
max_aux = max([max(RO_per_million_week(:,1)) max(AC_per_million_week(:,1)) max(AM_per_million_week(:,1)) max(RR_per_million_week(:,1)) max(PA_per_million_week(:,1)) max(AP_per_million_week(:,1)) max(TO_per_million_week(:,1)) max(MA_per_million_week(:,1)) max(PI_per_million_week(:,1)) max(CE_per_million_week(:,1)) max(RN_per_million_week(:,1)) max(PB_per_million_week(:,1)) max(PE_per_million_week(:,1)) max(AL_per_million_week(:,1)) max(SE_per_million_week(:,1)) max(BA_per_million_week(:,1)) max(MG_per_million_week(:,1)) max(ES_per_million_week(:,1)) max(RJ_per_million_week(:,1)) max(SP_per_million_week(:,1)) max(PR_per_million_week(:,1)) max(SC_per_million_week(:,1)) max(RS_per_million_week(:,1)) max(MS_per_million_week(:,1)) max(MT_per_million_week(:,1)) max(GO_per_million_week(:,1)) max(DF_per_million_week(:,1)) max(BR_per_million_week(:,1))]);
axis_new_per_million_week = 10^(ceil(log10(max_aux)));
axis_new_cases = 10^(ceil(log10(max_aux)));

%Fontes, estilos e cores
fonte_titulo = 9;
fonte_labels = 8;
fonte_padrao = 8; %numeros dos eixos
fonte_estados = 7;

colorAC = [69,169,0]/255;
colorAP = [5,163,29]/255;
colorAM = [53,143,31]/255;
colorPA = [0,169,74]/255;
colorTO = [0,109,22]/255;
colorRO=  [0,104,44]/255;
colorRR=  [0,67,21]/255;

colorAL=  [96,209,224]/255;
colorBA=  [0,170,196]/255;
colorCE=  [0,116,136]/255;
colorMA=  [0,74,84]/255;
colorPB=  [27,78,142]/255;
colorPE=  [0,99,181]/255;
colorPI=  [0,45,135]/255;
colorRN=  [0,34,80]/255;
colorSE=  [0,20,37]/255;

colorDF=  [181,147,87]/255;
colorGO=  [135,85,30]/255;
colorMT=  [110,71,28]/255;
colorMS=  [86,62,32]/255;

colorES=  [255,130,113]/255;
colorMG=  [254,88,52]/255;
colorRJ = [248,66,9]/255;
colorSP=  [203,63,23]/255;

colorPR=  [209,227,105]/255;
colorRS=  [193,203,68]/255;
colorSC=  [191,171,72]/255;

colorBR = [0,0,0];

lineRO = '-';
lineAC = '-';
lineAM = '-';
lineRR = '-';
linePA = '-';
lineAP = '-';
lineTO = '-';
lineMA = '-';
linePI = '-';
lineCE = '-';
lineRN = '-';
linePB = '-';
linePE = '-';
lineAL = '-';
lineSE = '-';
lineBA = '-';
lineMG = '-';
lineES = '-';
lineRJ = '-';
lineSP = '-';
linePR = '-';
lineSC = '-';
lineRS = '-';
lineMS = '-';
lineMT = '-';
lineGO = '-';
lineDF = '-';
lineBR = '-';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure((region-1)*4 + 1);
for (i=begin_state:1:end_state)
if (i == 6)
[n1,n2] = size(RO_deaths);
n=n1;
days_state = 0:1:n-1;
figRO=semilogy(days_state,RO_deaths(:,4))
hold on;
set(figRO,'LineWidth', 1,"color",colorRO,'DisplayName','RO','Linestyle',lineRO)
text (n-1, RO_deaths(n1,4), [' RO'],"FontSize",fonte_estados,"color",colorRO);
end
if (i == 1)
[n1,n2] = size(AC_deaths);
n=n1;
days_state = 0:1:n-1;
figAC=semilogy(days_state,AC_deaths(:,4))
hold on;
set(figAC,'LineWidth', 1,"color",colorAC,'DisplayName','AC','Linestyle',lineAC)
text (n-1, AC_deaths(n1,4), [' AC'],"FontSize",fonte_estados,"color",colorAC);
end
if (i == 3)
[n1,n2] = size(AM_deaths);
n=n1;
days_state = 0:1:n-1;
figAM=semilogy(days_state,AM_deaths(:,4))
hold on;
set(figAM,'LineWidth', 1,"color",colorAM,'DisplayName','AM','Linestyle',lineAM)
text (n-1, AM_deaths(n1,4), [' AM'],"FontSize",fonte_estados,"color",colorAM);
end
if (i == 7)
[n1,n2] = size(RR_deaths);
n=n1;
days_state = 0:1:n-1;
figRR=semilogy(days_state,RR_deaths(:,4))
hold on;
set(figRR,'LineWidth', 1,"color",colorRR,'DisplayName','RR','Linestyle',lineRR)
text (n-1, RR_deaths(n1,4), [' RR'],"FontSize",fonte_estados,"color",colorRR);
end
if (i == 4)
[n1,n2] = size(PA_deaths);
n=n1;
days_state = 0:1:n-1;
figPA=semilogy(days_state,PA_deaths(:,4))
hold on;
set(figPA,'LineWidth', 1,"color",colorPA,'DisplayName','PA','Linestyle',linePA)
text (n-1, PA_deaths(n1,4), [' PA'],"FontSize",fonte_estados,"color",colorPA);
end
if (i == 2)
[n1,n2] = size(AP_deaths);
n=n1;
days_state = 0:1:n-1;
figAP=semilogy(days_state,AP_deaths(:,4))
hold on;
set(figAP,'LineWidth', 1,"color",colorAP,'DisplayName','AP','Linestyle',lineAP)
text (n-1, AP_deaths(n1,4), [' AP'],"FontSize",fonte_estados,"color",colorAP);
end
if (i == 5)
[n1,n2] = size(TO_deaths);
n=n1;
days_state = 0:1:n-1;
figTO=semilogy(days_state,TO_deaths(:,4))
hold on;
set(figTO,'LineWidth', 1,"color",colorTO,'DisplayName','TO','Linestyle',lineTO)
text (n-1, TO_deaths(n1,4), [' TO'],"FontSize",fonte_estados,"color",colorTO);
end
if (i == 11)
[n1,n2] = size(MA_deaths);
n=n1;
days_state = 0:1:n-1;
figMA=semilogy(days_state,MA_deaths(:,4))
hold on;
set(figMA,'LineWidth', 1,"color",colorMA,'DisplayName','MA','Linestyle',lineMA)
text (n-1, MA_deaths(n1,4), [' MA'],"FontSize",fonte_estados,"color",colorMA);
end
if (i == 14)
[n1,n2] = size(PI_deaths);
n=n1;
days_state = 0:1:n-1;
figPI=semilogy(days_state,PI_deaths(:,4))
hold on;
set(figPI,'LineWidth', 1,"color",colorPI,'DisplayName','PI','Linestyle',linePI)
text (n-1, PI_deaths(n1,4), [' PI'],"FontSize",fonte_estados,"color",colorPI);
end
if (i == 10)
[n1,n2] = size(CE_deaths);
n=n1;
days_state = 0:1:n-1;
figCE=semilogy(days_state,CE_deaths(:,4))
hold on;
set(figCE,'LineWidth', 1,"color",colorCE,'DisplayName','CE','Linestyle',lineCE)
text (n-1, CE_deaths(n1,4), [' CE'],"FontSize",fonte_estados,"color",colorCE);
end
if (i == 15)
[n1,n2] = size(RN_deaths);
n=n1;
days_state = 0:1:n-1;
figRN=semilogy(days_state,RN_deaths(:,4))
hold on;
set(figRN,'LineWidth', 1,"color",colorRN,'DisplayName','RN','Linestyle',lineRN)
text (n-1, RN_deaths(n1,4), [' RN'],"FontSize",fonte_estados,"color",colorRN);
end
if (i == 12)
[n1,n2] = size(PB_deaths);
n=n1;
days_state = 0:1:n-1;
figPB=semilogy(days_state,PB_deaths(:,4))
hold on;
set(figPB,'LineWidth', 1,"color",colorPB,'DisplayName','PB','Linestyle',linePB)
text (n-1, PB_deaths(n1,4), [' PB'],"FontSize",fonte_estados,"color",colorPB);
end
if (i == 13)
[n1,n2] = size(PE_deaths);
n=n1;
days_state = 0:1:n-1;
figPE=semilogy(days_state,PE_deaths(:,4))
hold on;
set(figPE,'LineWidth', 1,"color",colorPE,'DisplayName','PE','Linestyle',linePE)
text (n-1, PE_deaths(n1,4), [' PE'],"FontSize",fonte_estados,"color",colorPE);
end
if (i == 8)
[n1,n2] = size(AL_deaths);
n=n1;
days_state = 0:1:n-1;
figAL=semilogy(days_state,AL_deaths(:,4))
hold on;
set(figAL,'LineWidth', 1,"color",colorAL,'DisplayName','AL','Linestyle',lineAL)
text (n-1, AL_deaths(n1,4), [' AL'],"FontSize",fonte_estados,"color",colorAL);
end
if (i == 16)
[n1,n2] = size(SE_deaths);
n=n1;
days_state = 0:1:n-1;
figSE=semilogy(days_state,SE_deaths(:,4))
hold on;
set(figSE,'LineWidth', 1,"color",colorSE,'DisplayName','SE','Linestyle',lineSE)
text (n-1, SE_deaths(n1,4), [' SE'],"FontSize",fonte_estados,"color",colorSE);
end
if (i == 9)
[n1,n2] = size(BA_deaths);
n=n1;
days_state = 0:1:n-1;
figBA=semilogy(days_state,BA_deaths(:,4))
hold on;
set(figBA,'LineWidth', 1,"color",colorBA,'DisplayName','BA','Linestyle',lineBA)
text (n-1, BA_deaths(n1,4), [' BA'],"FontSize",fonte_estados,"color",colorBA);
end
if (i == 22)
[n1,n2] = size(MG_deaths);
n=n1;
days_state = 0:1:n-1;
figMG=semilogy(days_state,MG_deaths(:,4))
hold on;
set(figMG,'LineWidth', 1,"color",colorMG,'DisplayName','MG','Linestyle',lineMG)
text (n-1, MG_deaths(n1,4), [' MG'],"FontSize",fonte_estados,"color",colorMG);
end
if (i == 21)
[n1,n2] = size(ES_deaths);
n=n1;
days_state = 0:1:n-1;
figES=semilogy(days_state,ES_deaths(:,4))
hold on;
set(figES,'LineWidth', 1,"color",colorES,'DisplayName','ES','Linestyle',lineES)
text (n-1, ES_deaths(n1,4), [' ES'],"FontSize",fonte_estados,"color",colorES);
end
if (i == 23)
[n1,n2] = size(RJ_deaths);
n=n1;
days_state = 0:1:n-1;
figRJ=semilogy(days_state,RJ_deaths(:,4))
hold on;
set(figRJ,'LineWidth', 1,"color",colorRJ,'DisplayName','RJ','Linestyle',lineRJ)
text (n-1, RJ_deaths(n1,4), [' RJ'],"FontSize",fonte_estados,"color",colorRJ);
end
if (i == 24)
[n1,n2] = size(SP_deaths);
n=n1;
days_state = 0:1:n-1;
figSP=semilogy(days_state,SP_deaths(:,4))
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'DisplayName','SP','Linestyle',lineSP)
text (n-1, SP_deaths(n1,4), [' SP'],"FontSize",fonte_estados,"color",colorSP);
end
if (i == 25)
[n1,n2] = size(PR_deaths);
n=n1;
days_state = 0:1:n-1;
figPR=semilogy(days_state,PR_deaths(:,4))
hold on;
set(figPR,'LineWidth', 1,"color",colorPR,'DisplayName','PR','Linestyle',linePR)
text (n-1, PR_deaths(n1,4), [' PR'],"FontSize",fonte_estados,"color",colorPR);
end
if (i == 27)
[n1,n2] = size(SC_deaths);
n=n1;
days_state = 0:1:n-1;
figSC=semilogy(days_state,SC_deaths(:,4))
hold on;
set(figSC,'LineWidth', 1,"color",colorSC,'DisplayName','SC','Linestyle',lineSC)
text (n-1, SC_deaths(n1,4), [' SC'],"FontSize",fonte_estados,"color",colorSC);
end
if (i == 26)
[n1,n2] = size(RS_deaths);
n=n1;
days_state = 0:1:n-1;
figRS=semilogy(days_state,RS_deaths(:,4))
hold on;
set(figRS,'LineWidth', 1,"color",colorRS,'DisplayName','RS','Linestyle',lineRS)
text (n-1, RS_deaths(n1,4), [' RS'],"FontSize",fonte_estados,"color",colorRS);
end
if (i == 20)
[n1,n2] = size(MS_deaths);
n=n1;
days_state = 0:1:n-1;
figMS=semilogy(days_state,MS_deaths(:,4))
hold on;
set(figMS,'LineWidth', 1,"color",colorMS,'DisplayName','MS','Linestyle',lineMS)
text (n-1, MS_deaths(n1,4), [' MS'],"FontSize",fonte_estados,"color",colorMS);
end
if (i == 19)
[n1,n2] = size(MT_deaths);
n=n1;
days_state = 0:1:n-1;
figMT=semilogy(days_state,MT_deaths(:,4))
hold on;
set(figMT,'LineWidth', 1,"color",colorMT,'DisplayName','MT','Linestyle',lineMT)
text (n-1, MT_deaths(n1,4), [' MT'],"FontSize",fonte_estados,"color",colorMT);
end
if (i == 18)
[n1,n2] = size(GO_deaths);
n=n1;
days_state = 0:1:n-1;
figGO=semilogy(days_state,GO_deaths(:,4),'DisplayName','GO')
hold on;
set(figGO,'LineWidth', 1,"color",colorGO,'DisplayName','GO','Linestyle',lineGO)
text (n-1, GO_deaths(n1,4), [' GO'],"FontSize",fonte_estados,"color",colorGO);
end
if (i == 17)
[n1,n2] = size(DF_deaths);
n=n1;
days_state = 0:1:n-1;
figDF=semilogy(days_state,DF_deaths(:,4))
hold on;
set(figDF,'LineWidth', 1,"color",colorDF,'DisplayName','DF','Linestyle',lineDF)
text (n-1, DF_deaths(n1,4), [' DF'],"FontSize",fonte_estados,"color",colorDF);
end
end

if (plotBR == 1)
[n1,n2] = size(BR_deaths);
n=n1;
days_state = 0:1:n-1;
figBR=semilogy(days_state,BR_deaths(:,4),'DisplayName','BRASIL')
hold on;
set(figBR,'LineWidth', 1.5,"color",colorBR,'Linestyle',lineBR)
text (n-1, BR_deaths(n1,4), [' BR'],"FontSize",fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao)
if(region < 6)
title({'Letalidade da epidemia',['Estados da região ',name,' em ',end_time]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if(region == 6)
title({'Letalidade da epidemia',['Todos os estados do Brasil em ',end_time]},'FontSize',fonte_titulo);
legend ("off");
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' morte (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);
axis([0 axis_days_deaths 1 axis_deaths]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.1 -0.0], .22,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

saveas(gcf,[name,'_letalidade_',datestr(dia(n1dia,n2dia),29),'.png']);

close(figure((region-1)*4 + 1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure((region-1)*4 + 2);
for (i=begin_state:1:end_state)
if (i == 6)
[n1,n2] = size(RO_cases);
n=n1;
days_state = 0:1:n-1;
figRO=semilogy(days_state,RO_cases(:,2))
hold on;
set(figRO,'LineWidth', 1,"color",colorRO,'DisplayName','RO','Linestyle',lineRO)
text (n-1, RO_cases(n1,2), [' RO'],"FontSize",fonte_estados,"color",colorRO);
end
if (i == 1)
[n1,n2] = size(AC_cases);
n=n1;
days_state = 0:1:n-1;
figAC=semilogy(days_state,AC_cases(:,2))
hold on;
set(figAC,'LineWidth', 1,"color",colorAC,'DisplayName','AC','Linestyle',lineAC)
text (n-1, AC_cases(n1,2), [' AC'],"FontSize",fonte_estados,"color",colorAC);
end
if (i == 3)
[n1,n2] = size(AM_cases);
n=n1;
days_state = 0:1:n-1;
figAM=semilogy(days_state,AM_cases(:,2))
hold on;
set(figAM,'LineWidth', 1,"color",colorAM,'DisplayName','AM','Linestyle',lineAM)
text (n-1, AM_cases(n1,2), [' AM'],"FontSize",fonte_estados,"color",colorAM);
end
if (i == 7)
[n1,n2] = size(RR_cases);
n=n1;
days_state = 0:1:n-1;
figRR=semilogy(days_state,RR_cases(:,2))
hold on;
set(figRR,'LineWidth', 1,"color",colorRR,'DisplayName','RR','Linestyle',lineRR)
text (n-1, RR_cases(n1,2), [' RR'],"FontSize",fonte_estados,"color",colorRR);
end
if (i == 4)
[n1,n2] = size(PA_cases);
n=n1;
days_state = 0:1:n-1;
figPA=semilogy(days_state,PA_cases(:,2))
hold on;
set(figPA,'LineWidth', 1,"color",colorPA,'DisplayName','PA','Linestyle',linePA)
text (n-1, PA_cases(n1,2), [' PA'],"FontSize",fonte_estados,"color",colorPA);
end
if (i == 2)
[n1,n2] = size(AP_cases);
n=n1;
days_state = 0:1:n-1;
figAP=semilogy(days_state,AP_cases(:,2))
hold on;
set(figAP,'LineWidth', 1,"color",colorAP,'DisplayName','AP','Linestyle',lineAP)
text (n-1, AP_cases(n1,2), [' AP'],"FontSize",fonte_estados,"color",colorAP);
end
if (i == 5)
[n1,n2] = size(TO_cases);
n=n1;
days_state = 0:1:n-1;
figTO=semilogy(days_state,TO_cases(:,2))
hold on;
set(figTO,'LineWidth', 1,"color",colorTO,'DisplayName','TO','Linestyle',lineTO)
text (n-1, TO_cases(n1,2), [' TO'],"FontSize",fonte_estados,"color",colorTO);
end
if (i == 11)
[n1,n2] = size(MA_cases);
n=n1;
days_state = 0:1:n-1;
figMA=semilogy(days_state,MA_cases(:,2))
hold on;
set(figMA,'LineWidth', 1,"color",colorMA,'DisplayName','MA','Linestyle',lineMA)
text (n-1, MA_cases(n1,2), [' MA'],"FontSize",fonte_estados,"color",colorMA);
end
if (i == 14)
[n1,n2] = size(PI_cases);
n=n1;
days_state = 0:1:n-1;
figPI=semilogy(days_state,PI_cases(:,2))
hold on;
set(figPI,'LineWidth', 1,"color",colorPI,'DisplayName','PI','Linestyle',linePI)
text (n-1, PI_cases(n1,2), [' PI'],"FontSize",fonte_estados,"color",colorPI);
end
if (i == 10)
[n1,n2] = size(CE_cases);
n=n1;
days_state = 0:1:n-1;
figCE=semilogy(days_state,CE_cases(:,2))
hold on;
set(figCE,'LineWidth', 1,"color",colorCE,'DisplayName','CE','Linestyle',lineCE)
text (n-1, CE_cases(n1,2), [' CE'],"FontSize",fonte_estados,"color",colorCE);
end
if (i == 15)
[n1,n2] = size(RN_cases);
n=n1;
days_state = 0:1:n-1;
figRN=semilogy(days_state,RN_cases(:,2))
hold on;
set(figRN,'LineWidth', 1,"color",colorRN,'DisplayName','RN','Linestyle',lineRN)
text (n-1, RN_cases(n1,2), [' RN'],"FontSize",fonte_estados,"color",colorRN);
end
if (i == 12)
[n1,n2] = size(PB_cases);
n=n1;
days_state = 0:1:n-1;
figPB=semilogy(days_state,PB_cases(:,2))
hold on;
set(figPB,'LineWidth', 1,"color",colorPB,'DisplayName','PB','Linestyle',linePB)
text (n-1, PB_cases(n1,2), [' PB'],"FontSize",fonte_estados,"color",colorPB);
end
if (i == 13)
[n1,n2] = size(PE_cases);
n=n1;
days_state = 0:1:n-1;
figPE=semilogy(days_state,PE_cases(:,2))
hold on;
set(figPE,'LineWidth', 1,"color",colorPE,'DisplayName','PE','Linestyle',linePE)
text (n-1, PE_cases(n1,2), [' PE'],"FontSize",fonte_estados,"color",colorPE);
end
if (i == 8)
[n1,n2] = size(AL_cases);
n=n1;
days_state = 0:1:n-1;
figAL=semilogy(days_state,AL_cases(:,2))
hold on;
set(figAL,'LineWidth', 1,"color",colorAL,'DisplayName','AL','Linestyle',lineAL)
text (n-1, AL_cases(n1,2), [' AL'],"FontSize",fonte_estados,"color",colorAL);
end
if (i == 16)
[n1,n2] = size(SE_cases);
n=n1;
days_state = 0:1:n-1;
figSE=semilogy(days_state,SE_cases(:,2))
hold on;
set(figSE,'LineWidth', 1,"color",colorSE,'DisplayName','SE','Linestyle',lineSE)
text (n-1, SE_cases(n1,2), [' SE'],"FontSize",fonte_estados,"color",colorSE);
end
if (i == 9)
[n1,n2] = size(BA_cases);
n=n1;
days_state = 0:1:n-1;
figBA=semilogy(days_state,BA_cases(:,2))
hold on;
set(figBA,'LineWidth', 1,"color",colorBA,'DisplayName','BA','Linestyle',lineBA)
text (n-1, BA_cases(n1,2), [' BA'],"FontSize",fonte_estados,"color",colorBA);
end
if (i == 22)
[n1,n2] = size(MG_cases);
n=n1;
days_state = 0:1:n-1;
figMG=semilogy(days_state,MG_cases(:,2))
hold on;
set(figMG,'LineWidth', 1,"color",colorMG,'DisplayName','MG','Linestyle',lineMG)
text (n-1, MG_cases(n1,2), [' MG'],"FontSize",fonte_estados,"color",colorMG);
end
if (i == 21)
[n1,n2] = size(ES_cases);
n=n1;
days_state = 0:1:n-1;
figES=semilogy(days_state,ES_cases(:,2))
hold on;
set(figES,'LineWidth', 1,"color",colorES,'DisplayName','ES','Linestyle',lineES)
text (n-1, ES_cases(n1,2), [' ES'],"FontSize",fonte_estados,"color",colorES);
end
if (i == 23)
[n1,n2] = size(RJ_cases);
n=n1;
days_state = 0:1:n-1;
figRJ=semilogy(days_state,RJ_cases(:,2))
hold on;
set(figRJ,'LineWidth', 1,"color",colorRJ,'DisplayName','RJ','Linestyle',lineRJ)
text (n-1, RJ_cases(n1,2), [' RJ'],"FontSize",fonte_estados,"color",colorRJ);
end
if (i == 24)
[n1,n2] = size(SP_cases);
n=n1;
days_state = 0:1:n-1;
figSP=semilogy(days_state,SP_cases(:,2))
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'DisplayName','SP','Linestyle',lineSP)
text (n-1, SP_cases(n1,2), [' SP'],"FontSize",fonte_estados,"color",colorSP);
end
if (i == 25)
[n1,n2] = size(PR_cases);
n=n1;
days_state = 0:1:n-1;
figPR=semilogy(days_state,PR_cases(:,2))
hold on;
set(figPR,'LineWidth', 1,"color",colorPR,'DisplayName','PR','Linestyle',linePR)
text (n-1, PR_cases(n1,2), [' PR'],"FontSize",fonte_estados,"color",colorPR);
end
if (i == 27)
[n1,n2] = size(SC_cases);
n=n1;
days_state = 0:1:n-1;
figSC=semilogy(days_state,SC_cases(:,2))
hold on;
set(figSC,'LineWidth', 1,"color",colorSC,'DisplayName','SC','Linestyle',lineSC)
text (n-1, SC_cases(n1,2), [' SC'],"FontSize",fonte_estados,"color",colorSC);
end
if (i == 26)
[n1,n2] = size(RS_cases);
n=n1;
days_state = 0:1:n-1;
figRS=semilogy(days_state,RS_cases(:,2))
hold on;
set(figRS,'LineWidth', 1,"color",colorRS,'DisplayName','RS','Linestyle',lineRS)
text (n-1, RS_cases(n1,2), [' RS'],"FontSize",fonte_estados,"color",colorRS);
end
if (i == 20)
[n1,n2] = size(MS_cases);
n=n1;
days_state = 0:1:n-1;
figMS=semilogy(days_state,MS_cases(:,2))
hold on;
set(figMS,'LineWidth', 1,"color",colorMS,'DisplayName','MS','Linestyle',lineMS)
text (n-1, MS_cases(n1,2), [' MS'],"FontSize",fonte_estados,"color",colorMS);
end
if (i == 19)
[n1,n2] = size(MT_cases);
n=n1;
days_state = 0:1:n-1;
figMT=semilogy(days_state,MT_cases(:,2))
hold on;
set(figMT,'LineWidth', 1,"color",colorMT,'DisplayName','MT','Linestyle',lineMT)
text (n-1, MT_cases(n1,2), [' MT'],"FontSize",fonte_estados,"color",colorMT);
end
if (i == 18)
[n1,n2] = size(GO_cases);
n=n1;
days_state = 0:1:n-1;
figGO=semilogy(days_state,GO_cases(:,2),'DisplayName','GO')
hold on;
set(figGO,'LineWidth', 1,"color",colorGO,'DisplayName','GO','Linestyle',lineGO)
text (n-1, GO_cases(n1,2), [' GO'],"FontSize",fonte_estados,"color",colorGO);
end
if (i == 17)
[n1,n2] = size(DF_cases);
n=n1;
days_state = 0:1:n-1;
figDF=semilogy(days_state,DF_cases(:,2))
hold on;
set(figDF,'LineWidth', 1,"color",colorDF,'DisplayName','DF','Linestyle',lineDF)
text (n-1, DF_cases(n1,2), [' DF'],"FontSize",fonte_estados,"color",colorDF);
end
end

if (plotBR == 1)
[n1,n2] = size(BR_cases);
n=n1;
days_state = 0:1:n-1;
figBR=semilogy(days_state,BR_cases(:,2),'DisplayName','BRASIL')
hold on;
set(figBR,'LineWidth', 1.5,"color",colorBR,'Linestyle',lineBR)
text (n-1, BR_cases(n1,2), [' BR'],"FontSize",fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao)
if(region < 6)
title({'Contágio da epidemia',['Estados da região ',name,' em ',end_time]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if(region == 6)
title({'Contágio da epidemia',['Todos os estados do Brasil em ',end_time]},'FontSize',fonte_titulo);
legend ("off");
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);

axis([0 axis_days_cases 10 axis_cases]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.1 -0.0], .22,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

saveas(gcf,[name,'_contagio_',datestr(dia(n1dia,n2dia),29),'.png']);

close(figure((region-1)*4 + 2));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
figure((region-1)*4 + 3);
for (i=begin_state:1:end_state)
if (i == 6)
figRO=loglog(RO_per_million_week(:,4),RO_per_million_week(:,3))
hold on;
set(figRO,'LineWidth', 1,"color",colorRO,'DisplayName','RO','Linestyle',lineRO)
text (RO_per_million_week(D,4), RO_per_million_week(D,3), [' RO'],"FontSize",fonte_estados,"color",colorRO);
end
if (i == 1)
figAC=loglog(AC_per_million_week(:,4),AC_per_million_week(:,3))
hold on;
set(figAC,'LineWidth', 1,"color",colorAC,'DisplayName','AC','Linestyle',lineAC)
text (AC_per_million_week(D,4), AC_per_million_week(D,3), [' AC'],"FontSize",fonte_estados,"color",colorAC);
end
if (i == 3)
figAM=loglog(AM_per_million_week(:,4),AM_per_million_week(:,3))
hold on;
set(figAM,'LineWidth', 1,"color",colorAM,'DisplayName','AM','Linestyle',lineAM)
text (AM_per_million_week(D,4), AM_per_million_week(D,3), [' AM'],"FontSize",fonte_estados,"color",colorAM);
end
if (i == 7)
figRR=loglog(RR_per_million_week(:,4),RR_per_million_week(:,3))
hold on;
set(figRR,'LineWidth', 1,"color",colorRR,'DisplayName','RR','Linestyle',lineRR)
text (RR_per_million_week(D,4), RR_per_million_week(D,3), [' RR'],"FontSize",fonte_estados,"color",colorRR);
end
if (i == 4)
figPA=loglog(PA_per_million_week(:,4),PA_per_million_week(:,3))
hold on;
set(figPA,'LineWidth', 1,"color",colorPA,'DisplayName','PA','Linestyle',linePA)
text (PA_per_million_week(D,4), PA_per_million_week(D,3), [' PA'],"FontSize",fonte_estados,"color",colorPA);
end
if (i == 2)
figAP=loglog(AP_per_million_week(:,4),AP_per_million_week(:,3))
hold on;
set(figAP,'LineWidth', 1,"color",colorAP,'DisplayName','AP','Linestyle',lineAP)
text (AP_per_million_week(D,4), AP_per_million_week(D,3), [' AP'],"FontSize",fonte_estados,"color",colorAP);
end
if (i == 5)
figTO=loglog(TO_per_million_week(:,4),TO_per_million_week(:,3))
hold on;
set(figTO,'LineWidth', 1,"color",colorTO,'DisplayName','TO','Linestyle',lineTO)
text (TO_per_million_week(D,4), TO_per_million_week(D,3), [' TO'],"FontSize",fonte_estados,"color",colorTO);
end
if (i == 11)
figMA=loglog(MA_per_million_week(:,4),MA_per_million_week(:,3))
hold on;
set(figMA,'LineWidth', 1,"color",colorMA,'DisplayName','MA','Linestyle',lineMA)
text (MA_per_million_week(D,4), MA_per_million_week(D,3), [' MA'],"FontSize",fonte_estados,"color",colorMA);
end
if (i == 14)
figPI=loglog(PI_per_million_week(:,4),PI_per_million_week(:,3))
hold on;
set(figPI,'LineWidth', 1,"color",colorPI,'DisplayName','PI','Linestyle',linePI)
text (PI_per_million_week(D,4), PI_per_million_week(D,3), [' PI'],"FontSize",fonte_estados,"color",colorPI);
end
if (i == 10)
figCE=loglog(CE_per_million_week(:,4),CE_per_million_week(:,3))
hold on;
set(figCE,'LineWidth', 1,"color",colorCE,'DisplayName','CE','Linestyle',lineCE)
text (CE_per_million_week(D,4), CE_per_million_week(D,3), [' CE'],"FontSize",fonte_estados,"color",colorCE);
end
if (i == 15)
figRN=loglog(RN_per_million_week(:,4),RN_per_million_week(:,3))
hold on;
set(figRN,'LineWidth', 1,"color",colorRN,'DisplayName','RN','Linestyle',lineRN)
text (RN_per_million_week(D,4), RN_per_million_week(D,3), [' RN'],"FontSize",fonte_estados,"color",colorRN);
end
if (i == 12)
figPB=loglog(PB_per_million_week(:,4),PB_per_million_week(:,3))
hold on;
set(figPB,'LineWidth', 1,"color",colorPB,'DisplayName','PB','Linestyle',linePB)
text (PB_per_million_week(D,4), PB_per_million_week(D,3), [' PB'],"FontSize",fonte_estados,"color",colorPB);
end
if (i == 13)
figPE=loglog(PE_per_million_week(:,4),PE_per_million_week(:,3))
hold on;
set(figPE,'LineWidth', 1,"color",colorPE,'DisplayName','PE','Linestyle',linePE)
text (PE_per_million_week(D,4), PE_per_million_week(D,3), [' PE'],"FontSize",fonte_estados,"color",colorPE);
end
if (i == 8)
figAL=loglog(AL_per_million_week(:,4),AL_per_million_week(:,3))
hold on;
set(figAL,'LineWidth', 1,"color",colorAL,'DisplayName','AL','Linestyle',lineAL)
text (AL_per_million_week(D,4), AL_per_million_week(D,3), [' AL'],"FontSize",fonte_estados,"color",colorAL);
end
if (i == 16)
figSE=loglog(SE_per_million_week(:,4),SE_per_million_week(:,3))
hold on;
set(figSE,'LineWidth', 1,"color",colorSE,'DisplayName','SE','Linestyle',lineSE)
text (SE_per_million_week(D,4), SE_per_million_week(D,3), [' SE'],"FontSize",fonte_estados,"color",colorSE);
end
if (i == 9)
figBA=loglog(BA_per_million_week(:,4),BA_per_million_week(:,3))
hold on;
set(figBA,'LineWidth', 1,"color",colorBA,'DisplayName','BA','Linestyle',lineBA)
text (BA_per_million_week(D,4), BA_per_million_week(D,3), [' BA'],"FontSize",fonte_estados,"color",colorBA);
end
if (i == 22)
figMG=loglog(MG_per_million_week(:,4),MG_per_million_week(:,3))
hold on;
set(figMG,'LineWidth', 1,"color",colorMG,'DisplayName','MG','Linestyle',lineMG)
text (MG_per_million_week(D,4), MG_per_million_week(D,3), [' MG'],"FontSize",fonte_estados,"color",colorMG);
end
if (i == 21)
figES=loglog(ES_per_million_week(:,4),ES_per_million_week(:,3))
hold on;
set(figES,'LineWidth', 1,"color",colorES,'DisplayName','ES','Linestyle',lineES)
text (ES_per_million_week(D,4), ES_per_million_week(D,3), [' ES'],"FontSize",fonte_estados,"color",colorES);
end
if (i == 23)
figRJ=loglog(RJ_per_million_week(:,4),RJ_per_million_week(:,3))
hold on;
set(figRJ,'LineWidth', 1,"color",colorRJ,'DisplayName','RJ','Linestyle',lineRJ)
text (RJ_per_million_week(D,4), RJ_per_million_week(D,3), [' RJ'],"FontSize",fonte_estados,"color",colorRJ);
end
if (i == 24)
figSP=loglog(SP_per_million_week(:,4),SP_per_million_week(:,3))
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'DisplayName','SP','Linestyle',lineSP)
text (SP_per_million_week(D,4), SP_per_million_week(D,3), [' SP'],"FontSize",fonte_estados,"color",colorSP);
end
if (i == 25)
figPR=loglog(PR_per_million_week(:,4),PR_per_million_week(:,3))
hold on;
set(figPR,'LineWidth', 1,"color",colorPR,'DisplayName','PR','Linestyle',linePR)
text (PR_per_million_week(D,4), PR_per_million_week(D,3), [' PR'],"FontSize",fonte_estados,"color",colorPR);
end
if (i == 27)
figSC=loglog(SC_per_million_week(:,4),SC_per_million_week(:,3))
hold on;
set(figSC,'LineWidth', 1,"color",colorSC,'DisplayName','SC','Linestyle',lineSC)
text (SC_per_million_week(D,4), SC_per_million_week(D,3), [' SC'],"FontSize",fonte_estados,"color",colorSC);
end
if (i == 26)
figRS=loglog(RS_per_million_week(:,4),RS_per_million_week(:,3))
hold on;
set(figRS,'LineWidth', 1,"color",colorRS,'DisplayName','RS','Linestyle',lineRS)
text (RS_per_million_week(D,4), RS_per_million_week(D,3), [' RS'],"FontSize",fonte_estados,"color",colorRS);
end
if (i == 20)
figMS=loglog(MS_per_million_week(:,4),MS_per_million_week(:,3))
hold on;
set(figMS,'LineWidth', 1,"color",colorMS,'DisplayName','MS','Linestyle',lineMS)
text (MS_per_million_week(D,4), MS_per_million_week(D,3), [' MS'],"FontSize",fonte_estados,"color",colorMS);
end
if (i == 19)
figMT=loglog(MT_per_million_week(:,4),MT_per_million_week(:,3))
hold on;
set(figMT,'LineWidth', 1,"color",colorMT,'DisplayName','MT','Linestyle',lineMT)
text (MT_per_million_week(D,4), MT_per_million_week(D,3), [' MT'],"FontSize",fonte_estados,"color",colorMT);
end
if (i == 18)
figGO=loglog(GO_per_million_week(:,4),GO_per_million_week(:,3),'DisplayName','GO')
hold on;
set(figGO,'LineWidth', 1,"color",colorGO,'DisplayName','GO','Linestyle',lineGO)
text (GO_per_million_week(D,4), GO_per_million_week(D,3), [' GO'],"FontSize",fonte_estados,"color",colorGO);
end
if (i == 17)
figDF=loglog(DF_per_million_week(:,4),DF_per_million_week(:,3))
hold on;
set(figDF,'LineWidth', 1,"color",colorDF,'DisplayName','DF','Linestyle',lineDF)
text (DF_per_million_week(D,4), DF_per_million_week(D,3), [' DF'],"FontSize",fonte_estados,"color",colorDF);
end
end

if (plotBR == 1)
figBR=loglog(BR_per_million_week(:,4),BR_per_million_week(:,3),'DisplayName','BRASIL')
hold on;
set(figBR,'LineWidth', 1.5,"color",colorBR,'Linestyle',lineBR)
text (BR_per_million_week(D,4), BR_per_million_week(D,3), [' BR'],"FontSize",fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao);
if(region < 6)
title({'Informativo de progresso da epidemia (número de mortes)',['Estados da região ',name,' em ',end_time]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if(region == 6)
title({'Informativo de progresso da epidemia (número de mortes)',['Todos estados do Brasil em ',end_time]},'FontSize',fonte_titulo);
legend = "off";
end
ylabel(['Novas mortes por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);

axis([1 axis_deaths 1 axis_new_deaths]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.1 -0.0], .22,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

saveas(gcf,[name,'_informativo-mortes_',datestr(dia(n1dia,n2dia),29),'.png']);

close(figure((region-1)*4 + 3));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos (por milhao de hab.)
figure((region-1)*4 + 4);
for (i=begin_state:1:end_state)
if (i == 6)
figRO=loglog(RO_per_million_week(:,2),RO_per_million_week(:,1))
hold on;
set(figRO,'LineWidth', 1,"color",colorRO,'DisplayName','RO','Linestyle',lineRO)
text (RO_per_million_week(D,2), RO_per_million_week(D,1), [' RO'],"FontSize",fonte_estados,"color",colorRO);
end
if (i == 1)
figAC=loglog(AC_per_million_week(:,2),AC_per_million_week(:,1))
hold on;
set(figAC,'LineWidth', 1,"color",colorAC,'DisplayName','AC','Linestyle',lineAC)
text (AC_per_million_week(D,2), AC_per_million_week(D,1), [' AC'],"FontSize",fonte_estados,"color",colorAC);
end
if (i == 3)
figAM=loglog(AM_per_million_week(:,2),AM_per_million_week(:,1))
hold on;
set(figAM,'LineWidth', 1,"color",colorAM,'DisplayName','AM','Linestyle',lineAM)
text (AM_per_million_week(D,2), AM_per_million_week(D,1), [' AM'],"FontSize",fonte_estados,"color",colorAM);
end
if (i == 7)
figRR=loglog(RR_per_million_week(:,2),RR_per_million_week(:,1))
hold on;
set(figRR,'LineWidth', 1,"color",colorRR,'DisplayName','RR','Linestyle',lineRR)
text (RR_per_million_week(D,2), RR_per_million_week(D,1), [' RR'],"FontSize",fonte_estados,"color",colorRR);
end
if (i == 4)
figPA=loglog(PA_per_million_week(:,2),PA_per_million_week(:,1))
hold on;
set(figPA,'LineWidth', 1,"color",colorPA,'DisplayName','PA','Linestyle',linePA)
text (PA_per_million_week(D,2), PA_per_million_week(D,1), [' PA'],"FontSize",fonte_estados,"color",colorPA);
end
if (i == 2)
figAP=loglog(AP_per_million_week(:,2),AP_per_million_week(:,1))
hold on;
set(figAP,'LineWidth', 1,"color",colorAP,'DisplayName','AP','Linestyle',lineAP)
text (AP_per_million_week(D,2), AP_per_million_week(D,1), [' AP'],"FontSize",fonte_estados,"color",colorAP);
end
if (i == 5)
figTO=loglog(TO_per_million_week(:,2),TO_per_million_week(:,1))
hold on;
set(figTO,'LineWidth', 1,"color",colorTO,'DisplayName','TO','Linestyle',lineTO)
text (TO_per_million_week(D,2), TO_per_million_week(D,1), [' TO'],"FontSize",fonte_estados,"color",colorTO);
end
if (i == 11)
figMA=loglog(MA_per_million_week(:,2),MA_per_million_week(:,1))
hold on;
set(figMA,'LineWidth', 1,"color",colorMA,'DisplayName','MA','Linestyle',lineMA)
text (MA_per_million_week(D,2), MA_per_million_week(D,1), [' MA'],"FontSize",fonte_estados,"color",colorMA);
end
if (i == 14)
figPI=loglog(PI_per_million_week(:,2),PI_per_million_week(:,1))
hold on;
set(figPI,'LineWidth', 1,"color",colorPI,'DisplayName','PI','Linestyle',linePI)
text (PI_per_million_week(D,2), PI_per_million_week(D,1), [' PI'],"FontSize",fonte_estados,"color",colorPI);
end
if (i == 10)
figCE=loglog(CE_per_million_week(:,2),CE_per_million_week(:,1))
hold on;
set(figCE,'LineWidth', 1,"color",colorCE,'DisplayName','CE','Linestyle',lineCE)
text (CE_per_million_week(D,2), CE_per_million_week(D,1), [' CE'],"FontSize",fonte_estados,"color",colorCE);
end
if (i == 15)
figRN=loglog(RN_per_million_week(:,2),RN_per_million_week(:,1))
hold on;
set(figRN,'LineWidth', 1,"color",colorRN,'DisplayName','RN','Linestyle',lineRN)
text (RN_per_million_week(D,2), RN_per_million_week(D,1), [' RN'],"FontSize",fonte_estados,"color",colorRN);
end
if (i == 12)
figPB=loglog(PB_per_million_week(:,2),PB_per_million_week(:,1))
hold on;
set(figPB,'LineWidth', 1,"color",colorPB,'DisplayName','PB','Linestyle',linePB)
text (PB_per_million_week(D,2), PB_per_million_week(D,1), [' PB'],"FontSize",fonte_estados,"color",colorPB);
end
if (i == 13)
figPE=loglog(PE_per_million_week(:,2),PE_per_million_week(:,1))
hold on;
set(figPE,'LineWidth', 1,"color",colorPE,'DisplayName','PE','Linestyle',linePE)
text (PE_per_million_week(D,2), PE_per_million_week(D,1), [' PE'],"FontSize",fonte_estados,"color",colorPE);
end
if (i == 8)
figAL=loglog(AL_per_million_week(:,2),AL_per_million_week(:,1))
hold on;
set(figAL,'LineWidth', 1,"color",colorAL,'DisplayName','AL','Linestyle',lineAL)
text (AL_per_million_week(D,2), AL_per_million_week(D,1), [' AL'],"FontSize",fonte_estados,"color",colorAL);
end
if (i == 16)
figSE=loglog(SE_per_million_week(:,2),SE_per_million_week(:,1))
hold on;
set(figSE,'LineWidth', 1,"color",colorSE,'DisplayName','SE','Linestyle',lineSE)
text (SE_per_million_week(D,2), SE_per_million_week(D,1), [' SE'],"FontSize",fonte_estados,"color",colorSE);
end
if (i == 9)
figBA=loglog(BA_per_million_week(:,2),BA_per_million_week(:,1))
hold on;
set(figBA,'LineWidth', 1,"color",colorBA,'DisplayName','BA','Linestyle',lineBA)
text (BA_per_million_week(D,2), BA_per_million_week(D,1), [' BA'],"FontSize",fonte_estados,"color",colorBA);
end
if (i == 22)
figMG=loglog(MG_per_million_week(:,2),MG_per_million_week(:,1))
hold on;
set(figMG,'LineWidth', 1,"color",colorMG,'DisplayName','MG','Linestyle',lineMG)
text (MG_per_million_week(D,2), MG_per_million_week(D,1), [' MG'],"FontSize",fonte_estados,"color",colorMG);
end
if (i == 21)
figES=loglog(ES_per_million_week(:,2),ES_per_million_week(:,1))
hold on;
set(figES,'LineWidth', 1,"color",colorES,'DisplayName','ES','Linestyle',lineES)
text (ES_per_million_week(D,2), ES_per_million_week(D,1), [' ES'],"FontSize",fonte_estados,"color",colorES);
end
if (i == 23)
figRJ=loglog(RJ_per_million_week(:,2),RJ_per_million_week(:,1))
hold on;
set(figRJ,'LineWidth', 1,"color",colorRJ,'DisplayName','RJ','Linestyle',lineRJ)
text (RJ_per_million_week(D,2), RJ_per_million_week(D,1), [' RJ'],"FontSize",fonte_estados,"color",colorRJ);
end
if (i == 24)
figSP=loglog(SP_per_million_week(:,2),SP_per_million_week(:,1))
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'DisplayName','SP','Linestyle',lineSP)
text (SP_per_million_week(D,2), SP_per_million_week(D,1), [' SP'],"FontSize",fonte_estados,"color",colorSP);
end
if (i == 25)
figPR=loglog(PR_per_million_week(:,2),PR_per_million_week(:,1))
hold on;
set(figPR,'LineWidth', 1,"color",colorPR,'DisplayName','PR','Linestyle',linePR)
text (PR_per_million_week(D,2), PR_per_million_week(D,1), [' PR'],"FontSize",fonte_estados,"color",colorPR);
end
if (i == 27)
figSC=loglog(SC_per_million_week(:,2),SC_per_million_week(:,1))
hold on;
set(figSC,'LineWidth', 1,"color",colorSC,'DisplayName','SC','Linestyle',lineSC)
text (SC_per_million_week(D,2), SC_per_million_week(D,1), [' SC'],"FontSize",fonte_estados,"color",colorSC);
end
if (i == 26)
figRS=loglog(RS_per_million_week(:,2),RS_per_million_week(:,1))
hold on;
set(figRS,'LineWidth', 1,"color",colorRS,'DisplayName','RS','Linestyle',lineRS)
text (RS_per_million_week(D,2), RS_per_million_week(D,1), [' RS'],"FontSize",fonte_estados,"color",colorRS);
end
if (i == 20)
figMS=loglog(MS_per_million_week(:,2),MS_per_million_week(:,1))
hold on;
set(figMS,'LineWidth', 1,"color",colorMS,'DisplayName','MS','Linestyle',lineMS)
text (MS_per_million_week(D,2), MS_per_million_week(D,1), [' MS'],"FontSize",fonte_estados,"color",colorMS);
end
if (i == 19)
figMT=loglog(MT_per_million_week(:,2),MT_per_million_week(:,1))
hold on;
set(figMT,'LineWidth', 1,"color",colorMT,'DisplayName','MT','Linestyle',lineMT)
text (MT_per_million_week(D,2), MT_per_million_week(D,1), [' MT'],"FontSize",fonte_estados,"color",colorMT);
end
if (i == 18)
figGO=loglog(GO_per_million_week(:,2),GO_per_million_week(:,1),'DisplayName','GO')
hold on;
set(figGO,'LineWidth', 1,"color",colorGO,'DisplayName','GO','Linestyle',lineGO)
text (GO_per_million_week(D,2), GO_per_million_week(D,1), [' GO'],"FontSize",fonte_estados,"color",colorGO);
end
if (i == 17)
figDF=loglog(DF_per_million_week(:,2),DF_per_million_week(:,1))
hold on;
set(figDF,'LineWidth', 1,"color",colorDF,'DisplayName','DF','Linestyle',lineDF)
text (DF_per_million_week(D,2), DF_per_million_week(D,1), [' DF'],"FontSize",fonte_estados,"color",colorDF);
end
end

if (plotBR == 1)
figBR=loglog(BR_per_million_week(:,2),BR_per_million_week(:,1),'DisplayName','BRASIL')
hold on;
set(figBR,'LineWidth', 1.5,"color",colorBR,'Linestyle',lineBR)
text (BR_per_million_week(D,2), BR_per_million_week(D,1), [' BR'],"FontSize",fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao)
if (region < 6)
title({'Informativo de progresso da epidemia (número de casos)',['Estados da região ',name,'  em ',end_time]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (region == 6)
title({'Informativo de progresso da epidemia (número de casos)',['Todos os estados do Brasil em ',end_time]},'FontSize',fonte_titulo);
legend = "off";
end
ylabel(['Novos casos por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);
axis([10 axis_cases 10 axis_new_cases]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.1 -0.0], .22,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

saveas(gcf,[name,'_informativo-casos_',datestr(dia(n1dia,n2dia),29),'.png']);

close(figure((region-1)*4 + 4));

end
