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
% - número de casos em relação ao tempo desde 10 casos por              %
% - número de mortes por milhão em relação ao tempo desde 1 morte       %
% - número de Casos por semana em relação ao total de casos       %
% - número de Mortes por semana em relação ao total de mortes     %                                 
%                                                                       %
%                                                                       %
%                             Malú Grave                                %
%                         malugravemg@gmail.com                         %
%                        malugrave@nacad.ufrj.br                        %
%                                                                       %
%         [x] Working                                                   %
% Status: [ ] Not working                                               %
%         [ ] Experimental                                              %
%                                                                       %
% Last Update [25/05/2020]                                              %
%_______________________________________________________________________%
%=======================================================================%

clc;
clear all;
close all;

%Lendo o arquivo disponível no site 
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
% filename = 'cases-brazil-states.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

table = readtable([pwd,'/Dados/cases-brazil-states.txt']);
data = table2cell(table);

%Calculando casos diários
casos = table.totalCases;
mortes = table.deaths;

BRASIL = [casos, mortes];

%Definindo o número de dias com informações do COVID-19, que representa o tamanho das matrizes dos estados
dates = table.date(find(strcmp([table.state],'TOTAL')),:);
end_time = max(datenum(dates));
D = length(dates);


%Separando os dados em 27 sub-matrizes
BR= BRASIL(find(strcmp([table.state], 'TOTAL')),:);
RO= BRASIL(find(strcmp([table.state], 'RO')),:);
AC= BRASIL(find(strcmp([table.state], 'AC')),:);
AM= BRASIL(find(strcmp([table.state], 'AM')),:);
RR= BRASIL(find(strcmp([table.state], 'RR')),:);
PA= BRASIL(find(strcmp([table.state], 'PA')),:);
AP= BRASIL(find(strcmp([table.state], 'AP')),:);
TO= BRASIL(find(strcmp([table.state], 'TO')),:);
MA= BRASIL(find(strcmp([table.state], 'MA')),:);
PI= BRASIL(find(strcmp([table.state], 'PI')),:);
CE= BRASIL(find(strcmp([table.state], 'CE')),:);
RN= BRASIL(find(strcmp([table.state], 'RN')),:);
PB= BRASIL(find(strcmp([table.state], 'PB')),:);
PE= BRASIL(find(strcmp([table.state], 'PE')),:);
AL= BRASIL(find(strcmp([table.state], 'AL')),:);
SE= BRASIL(find(strcmp([table.state], 'SE')),:);
BA= BRASIL(find(strcmp([table.state], 'BA')),:);
MG= BRASIL(find(strcmp([table.state], 'MG')),:);
ES= BRASIL(find(strcmp([table.state], 'ES')),:);
RJ= BRASIL(find(strcmp([table.state], 'RJ')),:);
SP= BRASIL(find(strcmp([table.state], 'SP')),:);
PR= BRASIL(find(strcmp([table.state], 'PR')),:);
SC= BRASIL(find(strcmp([table.state], 'SC')),:);
RS= BRASIL(find(strcmp([table.state], 'RS')),:);
MS= BRASIL(find(strcmp([table.state], 'MS')),:);
MT= BRASIL(find(strcmp([table.state], 'MT')),:);
GO= BRASIL(find(strcmp([table.state], 'GO')),:);
DF= BRASIL(find(strcmp([table.state], 'DF')),:);

RO= [zeros((length(BR)-length(RO)),2) ; RO];
AC= [zeros((length(BR)-length(AC)),2) ; AC];
AM= [zeros((length(BR)-length(AM)),2) ; AM];
RR= [zeros((length(BR)-length(RR)),2) ; RR];
PA= [zeros((length(BR)-length(PA)),2) ; PA];
AP= [zeros((length(BR)-length(AP)),2) ; AP];
TO= [zeros((length(BR)-length(TO)),2) ; TO];
MA= [zeros((length(BR)-length(MA)),2) ; MA];
PI= [zeros((length(BR)-length(PI)),2) ; PI];
CE= [zeros((length(BR)-length(CE)),2) ; CE];
RN= [zeros((length(BR)-length(RN)),2) ; RN];
PB= [zeros((length(BR)-length(PB)),2) ; PB];
PE= [zeros((length(BR)-length(PE)),2) ; PE];
AL= [zeros((length(BR)-length(AL)),2) ; AL];
SE= [zeros((length(BR)-length(SE)),2) ; SE];
BA= [zeros((length(BR)-length(BA)),2) ; BA];
MG= [zeros((length(BR)-length(MG)),2) ; MG];
ES= [zeros((length(BR)-length(ES)),2) ; ES];
RJ= [zeros((length(BR)-length(RJ)),2) ; RJ];
SP= [zeros((length(BR)-length(SP)),2) ; SP];
PR= [zeros((length(BR)-length(PR)),2) ; PR];
SC= [zeros((length(BR)-length(SC)),2) ; SC];
RS= [zeros((length(BR)-length(RS)),2) ; RS];
MS= [zeros((length(BR)-length(MS)),2) ; MS];
MT= [zeros((length(BR)-length(MT)),2) ; MT];
GO= [zeros((length(BR)-length(GO)),2) ; GO];
DF= [zeros((length(BR)-length(DF)),2) ; DF];

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

popBR=popRO+popAC+popAM+popRR+popPA+popAP+popTO+popMA+popPI+popCE+popRN+popPE+popAL+popSE+popBA+popMG+popES+popRJ+popSP+popPR+popSC+popRS+popMS+popMT+popDF+popPB+popGO;



%inicio do loop de plot
for (regions = 1:1:6)

if (regions == 1 )
begin_states = 0;
end_states = 7;
name = 'NO';
name_title = 'Norte';
end
if (regions == 2 )
begin_states = 0;
end_states = 9;
name = 'NE';
name_title = 'Nordeste';
end
if (regions == 3 )
begin_states = 0;
end_states = 4;
name = 'CO';
name_title = 'Centro-Oeste';
end
if (regions == 4 )
begin_states = 0;
end_states = 4;
name = 'SE';
name_title = 'Sudeste';
end
if (regions == 5 )
begin_states = 0;
end_states = 3;
name = 'SU';
name_title = 'Sul';
end
if (regions == 6 )
begin_states = 0;
end_states = 27;
name = 'BR'
end

for( plot_type = 1:1:2)

%loop nos 13 países estudados
for( init = end_states:-1:begin_states)

clearvars -except plot_type init BRASIL data table name name_title regions begin_states end_states popBR BR 

if (plot_type == 1)

if (regions == 1)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 3) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 5) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 6) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 7) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 1) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 4) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 2) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
end

if (regions == 2)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 5) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 6) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 9) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 7) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 4) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 8) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 2) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 3) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 1) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
end

if (regions == 3)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 4) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 3) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 2) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 1) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
end

if (regions == 4)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 2) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 1) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 3) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 4) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
end

if (regions == 5)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 2) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 3) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 1) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end

if (regions == 6)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 1) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 2) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 3) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 4) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 5) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 6) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 7) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
if (init == 8) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 9) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 10) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 11) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 12) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 13) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 14) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 15) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 16) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
if (init == 17) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 18) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 19) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 20) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
if (init == 21) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 22) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 23) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 24) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
if (init == 25) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 26) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 27) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end

if (init > 0)
    location = BRASIL(find(strcmp([table.state], country)),:);
    linew = 1.2;
    dates = table.date(find(strcmp([table.state],country)),:);
    end_time = max(datenum(dates));
end
if (init == 0)
    location = BR;
    linew = 1.75;
    dates = table.date(find(strcmp([table.state],'TOTAL')),:);
    end_time = max(datenum(dates));
end



if strcmp(country, 'BR') country = 'BR'; end 
if strcmp(country, 'AM') country = 'AM  '; end 
if strcmp(country, 'PA') country = 'PA   '; end 
if strcmp(country, 'AP') country = 'AP    '; end 
if strcmp(country, 'AC') country = 'AC    '; end 
if strcmp(country, 'RO') country = 'RO    '; end 
if strcmp(country, 'RR') country = 'RR    '; end 
if strcmp(country, 'TO') country = 'TO    '; end 
if strcmp(country, 'CE') country = 'CE   '; end 
if strcmp(country, 'PE') country = 'PE   '; end 
if strcmp(country, 'MA') country = 'MA  '; end 
if strcmp(country, 'BA') country = 'BA   '; end 
if strcmp(country, 'PB') country = 'PB     '; end 
if strcmp(country, 'AL') country = 'AL     '; end 
if strcmp(country, 'RN') country = 'RN     '; end 
if strcmp(country, 'PI') country = 'PI      '; end 
if strcmp(country, 'SE') country = 'SE     '; end 
if strcmp(country, 'SP') country = 'SP'; end 
if strcmp(country, 'RJ') country = 'RJ   '; end 
if strcmp(country, 'ES') country = 'ES    '; end 
if strcmp(country, 'MG') country = 'MG   '; end 
if strcmp(country, 'GO') country = 'GO    '; end 
if strcmp(country, 'DF') country = 'DF     '; end 
if strcmp(country, 'MT') country = 'MT    '; end 
if strcmp(country, 'MS') country = 'MS      '; end 
if strcmp(country, 'PR') country = 'PR    '; end 
if strcmp(country, 'RS') country = 'RS    '; end 
if strcmp(country, 'SC') country = 'SC    '; end 
end

if (plot_type == 2)

if (regions == 1)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 3) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 5) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 7) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 6) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 1) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 4) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 2) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
end

if (regions == 2)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 4) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 6) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 9) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 8) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 5) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 7) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 1) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 3) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 2) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
end

if (regions == 3)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 4) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 3) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 2) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 1) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
end


if (regions == 4)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 2) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 1) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 3) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 4) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
end

if (regions == 5)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 1) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 3) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 2) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end

if (regions == 6)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 1) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 2) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 3) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 4) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 5) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 6) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 7) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
if (init == 8) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 9) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 10) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 11) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 12) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 13) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 14) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 15) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 16) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
if (init == 17) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 18) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 19) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 20) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
if (init == 21) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 22) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 23) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 24) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
if (init == 25) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 26) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 27) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end

if (init > 0)
    location = BRASIL(find(strcmp([table.state], country)),:);
    linew = 1.2;
    dates = table.date(find(strcmp([table.state],country)),:);
    end_time = max(datenum(dates));
end
if (init == 0)
    location = BR;
    linew = 1.75;
    dates = table.date(find(strcmp([table.state],'TOTAL')),:);
    end_time = max(datenum(dates));
end

if strcmp(country, 'BR') country = 'BR'; end 
if strcmp(country, 'AM') country = 'AM  '; end 
if strcmp(country, 'PA') country = 'PA   '; end 
if strcmp(country, 'AP') country = 'AP   '; end 
if strcmp(country, 'AC') country = 'AC    '; end 
if strcmp(country, 'RO') country = 'RO  '; end 
if strcmp(country, 'RR') country = 'RR    '; end 
if strcmp(country, 'TO') country = 'TO    '; end 
if strcmp(country, 'CE') country = 'CE   '; end 
if strcmp(country, 'PE') country = 'PE   '; end 
if strcmp(country, 'MA') country = 'MA  '; end 
if strcmp(country, 'BA') country = 'BA   '; end 
if strcmp(country, 'PB') country = 'PB   '; end 
if strcmp(country, 'AL') country = 'AL   '; end 
if strcmp(country, 'RN') country = 'RN  '; end 
if strcmp(country, 'PI') country = 'PI      '; end 
if strcmp(country, 'SE') country = 'SE   '; end 
if strcmp(country, 'SP') country = 'SP'; end 
if strcmp(country, 'RJ') country = 'RJ   '; end 
if strcmp(country, 'ES') country = 'ES  '; end 
if strcmp(country, 'MG') country = 'MG '; end 
if strcmp(country, 'GO') country = 'GO    '; end 
if strcmp(country, 'DF') country = 'DF   '; end 
if strcmp(country, 'MT') country = 'MT    '; end 
if strcmp(country, 'MS') country = 'MS    '; end 
if strcmp(country, 'PR') country = 'PR    '; end 
if strcmp(country, 'RS') country = 'RS  '; end 
if strcmp(country, 'SC') country = 'SC  '; end 
end




tot_cases = location(:,1);
tot_deaths = location(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;

tot_cases_pm = tot_cases/ (pop / 1000000);
new_cases_pm = new_cases/ (pop / 1000000);
tot_deaths_pm = tot_deaths/ (pop / 1000000);
new_deaths_pm = new_deaths/ (pop / 1000000);


%consolidando os Casos e mortes por semana
for (i=7:1:max(max(size(dates))) ) 
new_cases7(i,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(i,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
new_cases7_pm(i,1) = new_cases_pm(i,1)+new_cases_pm(i-1,1)+new_cases_pm(i-2,1)+new_cases_pm(i-3,1)+new_cases_pm(i-4,1)+new_cases_pm(i-5,1)+new_cases_pm(i-6,1);
new_deaths7_pm(i,1) = new_deaths_pm(i,1)+new_deaths_pm(i-1,1)+new_deaths_pm(i-2,1)+new_deaths_pm(i-3,1)+new_deaths_pm(i-4,1)+new_deaths_pm(i-5,1)+new_deaths_pm(i-6,1);
end

%Criando vetores desde dia zero a partir de X mortes/milhao ("_deaths") ou a partir de X casos/milhao ("_cases")
%Usuário define dia zero para casos ou mortes
X_deaths_pm = 1;
X_cases_pm = 10;
X_deaths = 10;
X_cases = 100;

n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_deaths(i,1) >= X_deaths)
n=n+1;
tot_deaths_X(n,1) = tot_deaths(i,1);
new_deaths_X(n,1) = new_deaths(i,1);
new_deaths7_X(n,1) = new_deaths7(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_cases(i,1) >= X_cases)
n=n+1;
tot_cases_X(n,1) = tot_cases(i,1);
new_cases_X(n,1) = new_cases(i,1);
new_cases7_X(n,1) = new_cases7(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_cases_pm(i,1) >= X_cases_pm)
n=n+1;
tot_cases_pmX(n,1) = tot_cases_pm(i,1);
new_cases_pmX(n,1) = new_cases_pm(i,1);
new_cases7_pmX(n,1) = new_cases7_pm(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_deaths_pm(i,1) >= X_deaths_pm)
n=n+1;
tot_deaths_pmX(n,1) = tot_deaths_pm(i,1);
new_deaths_pmX(n,1) = new_deaths_pm(i,1);
new_deaths7_pmX(n,1) = new_deaths7_pm(i,1);
end
end


%Fontes
fonte_titulo = 10.5;
fonte_labels = 10;
fonte_padrao = 9; %numeros dos eixos
fonte_location = 8;

day_axis = 120;

Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

if (plot_type == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes por tempo (dia zero definido por mortes)
figure (1);


%Grid manual
grid1=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),10000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),100000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
y_init=10;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 7*i;
x2(i+1) = 14*i;
x3(i+1) = 21*i;
% x4(i+1) = 8*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(tot_deaths_X)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_X,'DisplayName',[country,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_deaths_X(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Mortes X total de mortes (por milhao de hab.)
figure (3);

%Grid manual
grid1=loglog([1,1000000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,1000000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=loglog([1,1000000],10000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;


grid4=loglog(100*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(1000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid6=loglog(10000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid7=loglog(100000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Mortes
 new_deaths7w0 = new_deaths7;
 tot_deathsw0 = tot_deaths;
  pos0 = new_deaths7(:,1) <= 0;
 tot_deathsw0(pos0,:) = [];
 new_deaths7w0(pos0,:) = [];
 n = max(max(size(tot_deaths)));

 n = max(max(size(tot_deaths)));
 fig=loglog(tot_deathsw0,new_deaths7w0,'DisplayName',[country,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_deaths(n,1), new_deaths7(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas de mortes por tempo (dia zero definido por mortes/milhao)
figure (5);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),10000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
% y_init=10;
% for (i=0:1:day_axis-1)
% y(i+1) = y_init*2^i;
% x1(i+1) = 5*i;
% x2(i+1) = 6*i;
% x3(i+1) = 7*i;
% x4(i+1) = 8*i;
% end
% dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(new_deaths_X)));
 days = 0:1:n-1;
 fig=semilogy(days,new_deaths7_X/7,'DisplayName',[country,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_deaths7_X(n,1)/7, [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');
end

if (plot_type == 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos por tempo (dia zero definido por casos)
figure (2);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),10000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),100000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),1000000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
y_init=100;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 7*i;
x2(i+1) = 14*i;
x3(i+1) = 21*i;
% x4(i+1) = 8*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(tot_cases_X)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_X,'DisplayName',[country,'  ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 figtext=text (n-1, tot_cases_X(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos X total de casos (por milhao de hab.)
figure (4);

grid1=loglog([1,10000000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,10000000],10000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid22=loglog([1,10000000],100000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid1=loglog(1000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=loglog(10000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=loglog(100000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid44=loglog(1000000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Casos
 new_cases7w0 = new_cases7;
 tot_casesw0 = tot_cases;
  pos0 = new_cases7(:,1) <= 0;
 tot_casesw0(pos0,:) = [];
 new_cases7w0(pos0,:) = [];

 n = max(max(size(tot_cases)));
 fig=loglog(tot_casesw0,new_cases7w0,'DisplayName',[country,'  ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_cases(n,1), new_cases7(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos por tempo (dia zero definido por casos/milhao)
figure (6);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),10000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),100000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
% y_init=100;
% for (i=0:1:day_axis-1)
% y(i+1) = y_init*2^i;
% x1(i+1) = 5*i;
% x2(i+1) = 6*i;
% x3(i+1) = 7*i;
% x4(i+1) = 8*i;
% end
% dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(new_cases_X)));
 days = 0:1:n-1;
 fig=semilogy(days,new_cases7_X/7,'DisplayName',[country,'  ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_cases7_X(n,1)/7, [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');


end

end

end


% Configurações:


figure(1)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Mortalidade da epidemia ',['Estados da região ',name_title,' em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Mortalidade da epidemia ',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Total de mortes ",'FontSize',fonte_labels);

y_init=10;
max_y=1000000;
max_x=day_axis;

ang = 38;
h1=text(113,0.9*max_y,'números dobram a cada 7 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 24;
h2=text(118,0.0044*max_y,'14 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
 ang = 15;
 h3=text(118,0.0006*max_y,'21 dias');
 set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 38;
% h4=text(99,0.65*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k','1M'})

hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 max_x y_init max_y]);




% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
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


figure (2)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Contágio da epidemia ',['Estados da região ',name_title,' em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Contágio da epidemia ',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos '],'FontSize',fonte_labels);
ylabel ("Total de casos ",'FontSize',fonte_labels);

y_init=100;
max_y=10000000;
max_x=day_axis;

ang = 38;
h1=text(113,0.9*max_y,'números dobram a cada 7 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 24;
h2=text(118,0.0044*max_y,'14 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
 ang = 15;
 h3=text(118,0.0006*max_y,'21 dias');
 set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 38;
% h4=text(99,0.65*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'100','1k','10k','100k','1M','10M'})

hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 max_x y_init max_y]);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
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



figure (3)

set(gca,'FontSize',fonte_padrao);
if (regions < 6)
title({'Informativo de progresso da epidemia (número de mortes)',['Estados da região ',name_title,' em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Informativo de progresso da epidemia (número de mortes)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
ylabel(['Mortes por semana'],'FontSize',fonte_labels);
xlabel ("Total de mortes",'FontSize',fonte_labels);
max_x = 1000000;
max_y = 100000;
axis([10 max_x 10 max_y]);

set(gca,'YTickLabel',{'10','100','1k','10k','100k'})
set(gca,'XTickLabel',{'10','100','1k','10k','100k','1M'})

hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
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

figure(4)

set(gca,'FontSize',fonte_padrao);
if (regions < 6)
title({'Informativo de progresso da epidemia (número de casos)',['Estados da região ',name_title,' em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Informativo de progresso da epidemia (número de casos)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
ylabel(['Casos por semana '],'FontSize',fonte_labels);
xlabel ("Total de casos ",'FontSize',fonte_labels);
max_x = 10000000;
max_y = 1000000;
axis([100 max_x 100 max_y]);


set(gca,'YTickLabel',{'100','1k','10k','100k','1M'})
set(gca,'XTickLabel',{'100','1k','10k','100k','1M','10M'})

hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
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


figure(5)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Mortalidade diária da epidemia ',['Estados da região ',name_title,' em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Mortalidade diária da epidemia ',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ({'Mortes diárias','(Média móvel de 7 dias)'},'FontSize',fonte_labels);

y_init=1;
max_y=10000;
max_x=day_axis;

% ang = 43;
% h1=text(64,0.9*max_y,'números dobram a cada 5 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 39;
% h2=text(76.9,0.9*max_y,'6 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 35;
% h3=text(90,0.9*max_y,'7 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 33;
% h4=text(99,0.65*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k','10k','100k'})

hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


axis([0 max_x y_init max_y]);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
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

figure (6)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Contágio diário da epidemia ',['Estados da região ',name_title,' em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Contágio diário da epidemia ',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos '],'FontSize',fonte_labels);
ylabel ({'Novos casos por dia','(Média móvel de 7 dias)'},'FontSize',fonte_labels);

y_init=10;
max_y=100000;
max_x=day_axis;
% 
% ang = 43;
% h1=text(64,0.9*max_y,'números dobram a cada 5 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 39;
% h2=text(76.9,0.9*max_y,'6 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 35;
% h3=text(90,0.9*max_y,'7 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 33;
% h4=text(99,0.65*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k','1M'})


hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


axis([0 max_x y_init max_y]);



% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
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



outputdir = datestr(end_time,29);
if ~exist([pwd,'/',outputdir], 'dir')
  mkdir([pwd,'/',outputdir]);
end

outputdir2 = name;
if ~exist([pwd,'/',outputdir,'/',outputdir2], 'dir')
  mkdir([pwd,'/',outputdir,'/',outputdir2]);
end

%Controle do site
print(figure(1),[pwd '/upload/',name,'/covid19rj_M_ST_NM_AC_VA_',name,'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/upload/',name,'/covid19rj_M_ST_NC_AC_VA_',name,'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/upload/',name,'/covid19rj_M_EF_NM_NA_VA_',name,'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/upload/',name,'/covid19rj_M_EF_NC_NA_VA_',name,'.png'],'-dpng','-r400'); 
print(figure(5),[pwd '/upload/',name,'/covid19rj_M_ST_NM_PS_VA_',name,'.png'],'-dpng','-r400'); 
print(figure(6),[pwd '/upload/',name,'/covid19rj_M_ST_NC_PS_VA_',name,'.png'],'-dpng','-r400'); 

%Controle do github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NM_NA_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NC_NA_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(5),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_PS_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(6),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_PS_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 

close all;

close all

end

copyfile( [pwd '/Dados/cases-brazil-states.txt'], [pwd '/',outputdir,'/cases-brazil-states.txt']);
