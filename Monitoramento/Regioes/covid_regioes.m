%=======================================================================%
%                             COVID-19                                  %
%                      OBSERVATÓRIO FLUMINENSE                          %
%                           covid19rj.org                               %
%                                                                       %
%                  - COVID-19 NAS REGIÕES DO BRASIL -                   %
%                                                                       %
% Este algoritmo gera gráficos sobre os números de casos e mortes por   %
% Covid-19 no Brasil. Será gerado uma série de gráficos com as regiões  %
% e todo Brasil.                                                        %
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

name = 'Regioes';

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

%Juntando os estados em regiões
NORTE = RO + AC+ AM + RR + PA;
NORDESTE = MA + PI + CE + RN + PB + PE + AL + SE; 
SUDESTE = MG + ES + RJ + SP;
SUL = PR + SC + RS;
CENTRO = MS + MT + GO + DF;

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

%População de cada região
popNORTE = popRO + popAC+ popAM + popRR + popPA;
popNORDESTE = popMA + popPI + popCE + popRN + popPB + popPE + popAL + popSE; 
popSUDESTE = popMG + popES + popRJ + popSP;
popSUL = popPR + popSC + popRS;
popCENTRO = popMS + popMT + popGO + popDF;

%Consolidando os valores por semana
NORTE_week = NORTE;
for (i=7:D)
NORTE_week(i,1) = NORTE(i,1)+NORTE(i-1,1)+NORTE(i-2,1)+NORTE(i-3,1)+NORTE(i-4,1)+NORTE(i-5,1)+NORTE(i-6,1);
NORTE_week(i,3) = NORTE(i,3)+NORTE(i-1,3)+NORTE(i-2,3)+NORTE(i-3,3)+NORTE(i-4,3)+NORTE(i-5,3)+NORTE(i-6,3);
end
NORDESTE_week = NORDESTE;
for (i=7:D)
NORDESTE_week(i,1) = NORDESTE(i,1)+NORDESTE(i-1,1)+NORDESTE(i-2,1)+NORDESTE(i-3,1)+NORDESTE(i-4,1)+NORDESTE(i-5,1)+NORDESTE(i-6,1);
NORDESTE_week(i,3) = NORDESTE(i,3)+NORDESTE(i-1,3)+NORDESTE(i-2,3)+NORDESTE(i-3,3)+NORDESTE(i-4,3)+NORDESTE(i-5,3)+NORDESTE(i-6,3);
end
SUDESTE_week = SUDESTE;
for (i=7:D)
SUDESTE_week(i,1) = SUDESTE(i,1)+SUDESTE(i-1,1)+SUDESTE(i-2,1)+SUDESTE(i-3,1)+SUDESTE(i-4,1)+SUDESTE(i-5,1)+SUDESTE(i-6,1);
SUDESTE_week(i,3) = SUDESTE(i,3)+SUDESTE(i-1,3)+SUDESTE(i-2,3)+SUDESTE(i-3,3)+SUDESTE(i-4,3)+SUDESTE(i-5,3)+SUDESTE(i-6,3);
end
SUL_week = SUL;
for (i=7:D)
SUL_week(i,1) = SUL(i,1)+SUL(i-1,1)+SUL(i-2,1)+SUL(i-3,1)+SUL(i-4,1)+SUL(i-5,1)+SUL(i-6,1);
SUL_week(i,3) = SUL(i,3)+SUL(i-1,3)+SUL(i-2,3)+SUL(i-3,3)+SUL(i-4,3)+SUL(i-5,3)+SUL(i-6,3);
end
CENTRO_week = CENTRO;
for (i=7:D)
CENTRO_week(i,1) = CENTRO(i,1)+CENTRO(i-1,1)+CENTRO(i-2,1)+CENTRO(i-3,1)+CENTRO(i-4,1)+CENTRO(i-5,1)+CENTRO(i-6,1);
CENTRO_week(i,3) = CENTRO(i,3)+CENTRO(i-1,3)+CENTRO(i-2,3)+CENTRO(i-3,3)+CENTRO(i-4,3)+CENTRO(i-5,3)+CENTRO(i-6,3);
end
BR_week = BR;
for (i=7:D)
BR_week(i,1) = BR(i,1)+BR(i-1,1)+BR(i-2,1)+BR(i-3,1)+BR(i-4,1)+BR(i-5,1)+BR(i-6,1);
BR_week(i,3) = BR(i,3)+BR(i-1,3)+BR(i-2,3)+BR(i-3,3)+BR(i-4,3)+BR(i-5,3)+BR(i-6,3);
end



%Definindo os valores por milhão
NORTE_per_million = NORTE / (popNORTE / 1000000);
NORDESTE_per_million = NORDESTE / (popNORDESTE / 1000000);
SUDESTE_per_million = SUDESTE / (popSUDESTE / 1000000);
SUL_per_million = SUL / (popSUL / 1000000);
CENTRO_per_million = CENTRO / (popCENTRO / 1000000);

BR_per_million = BR / (popBR / 1000000);

NORTE_per_million_week = NORTE_week / (popNORTE / 1000000);
NORDESTE_per_million_week = NORDESTE_week / (popNORDESTE / 1000000);
SUDESTE_per_million_week = SUDESTE_week / (popSUDESTE / 1000000);
SUL_per_million_week = SUL_week / (popSUL / 1000000);
CENTRO_per_million_week = CENTRO_week / (popCENTRO / 1000000);

BR_per_million_week = BR_week / (popBR / 1000000);


%Criando vetores desde dia zero a partir de X mortes/milhao ("_deaths") ou a partir de X casos/milhao ("_cases")
%Usuário define dia zero para casos ou mortes
n=0;
N=0;
for i=1:D
if (NORTE_per_million(i,4) >= X_deaths)
n=n+1;
NORTE_deaths(n,1) = NORTE_per_million(i,1);
NORTE_deaths(n,2) = NORTE_per_million(i,2);
NORTE_deaths(n,3) = NORTE_per_million(i,3);
NORTE_deaths(n,4) = NORTE_per_million(i,4);
end
if (NORTE_per_million(i,2) >= X_cases)
N=N+1;
NORTE_cases(N,1) = NORTE_per_million(i,1);
NORTE_cases(N,2) = NORTE_per_million(i,2);
NORTE_cases(N,3) = NORTE_per_million(i,3);
NORTE_cases(N,4) = NORTE_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (NORDESTE_per_million(i,4) >= X_deaths)
n=n+1;
NORDESTE_deaths(n,1) = NORDESTE_per_million(i,1);
NORDESTE_deaths(n,2) = NORDESTE_per_million(i,2);
NORDESTE_deaths(n,3) = NORDESTE_per_million(i,3);
NORDESTE_deaths(n,4) = NORDESTE_per_million(i,4);
end
if (NORDESTE_per_million(i,2) >= X_cases)
N=N+1;
NORDESTE_cases(N,1) = NORDESTE_per_million(i,1);
NORDESTE_cases(N,2) = NORDESTE_per_million(i,2);
NORDESTE_cases(N,3) = NORDESTE_per_million(i,3);
NORDESTE_cases(N,4) = NORDESTE_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (SUDESTE_per_million(i,4) >= X_deaths)
n=n+1;
SUDESTE_deaths(n,1) = SUDESTE_per_million(i,1);
SUDESTE_deaths(n,2) = SUDESTE_per_million(i,2);
SUDESTE_deaths(n,3) = SUDESTE_per_million(i,3);
SUDESTE_deaths(n,4) = SUDESTE_per_million(i,4);
end
if (SUDESTE_per_million(i,2) >= X_cases)
N=N+1;
SUDESTE_cases(N,1) = SUDESTE_per_million(i,1);
SUDESTE_cases(N,2) = SUDESTE_per_million(i,2);
SUDESTE_cases(N,3) = SUDESTE_per_million(i,3);
SUDESTE_cases(N,4) = SUDESTE_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (SUL_per_million(i,4) >= X_deaths)
n=n+1;
SUL_deaths(n,1) = SUL_per_million(i,1);
SUL_deaths(n,2) = SUL_per_million(i,2);
SUL_deaths(n,3) = SUL_per_million(i,3);
SUL_deaths(n,4) = SUL_per_million(i,4);
end
if (SUL_per_million(i,2) >= X_cases)
N=N+1;
SUL_cases(N,1) = SUL_per_million(i,1);
SUL_cases(N,2) = SUL_per_million(i,2);
SUL_cases(N,3) = SUL_per_million(i,3);
SUL_cases(N,4) = SUL_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (CENTRO_per_million(i,4) >= X_deaths)
n=n+1;
CENTRO_deaths(n,1) = CENTRO_per_million(i,1);
CENTRO_deaths(n,2) = CENTRO_per_million(i,2);
CENTRO_deaths(n,3) = CENTRO_per_million(i,3);
CENTRO_deaths(n,4) = CENTRO_per_million(i,4);
end
if (CENTRO_per_million(i,2) >= X_cases)
N=N+1;
CENTRO_cases(N,1) = CENTRO_per_million(i,1);
CENTRO_cases(N,2) = CENTRO_per_million(i,2);
CENTRO_cases(N,3) = CENTRO_per_million(i,3);
CENTRO_cases(N,4) = CENTRO_per_million(i,4);
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
max_aux = max([max(size(NORTE_deaths)) max(size(NORDESTE_deaths)) max(size(SUDESTE_deaths)) max(size(SUL_deaths)) max(size(CENTRO_deaths)) max(size(BR_deaths))]);
axis_days_deaths = idivide(max_aux,int32(5),'ceil') * 5 + 10;
max_aux = max([max(size(NORTE_cases)) max(size(NORDESTE_cases)) max(size(SUDESTE_cases)) max(size(SUL_cases)) max(size(CENTRO_cases)) max(size(BR_cases))]);
axis_days_cases = idivide(max_aux,int32(5),'ceil') * 5 + 10;

%Mortes aumentam em escala log de 10
max_aux = max([max(NORTE_deaths(:,4)) max(NORDESTE_deaths(:,4)) max(SUDESTE_deaths(:,4)) max(SUL_deaths(:,4)) max(CENTRO_deaths(:,4)) max(BR_deaths(:,4)) ]);
axis_deaths = 10^(ceil(log10(max_aux)));

%Casos aumentam em escala log de 10
max_aux = max([max(NORTE_cases(:,2)) max(NORDESTE_cases(:,2)) max(SUDESTE_cases(:,2)) max(SUL_cases(:,2)) max(CENTRO_cases(:,2)) max(BR_cases(:,2)) ]);
axis_cases = 10^(ceil(log10(max_aux)));

%Novas mortes aumentam em escala log de 10
max_aux = max([max(NORTE_per_million_week(:,3)) max(NORDESTE_per_million_week(:,3)) max(SUDESTE_per_million_week(:,3)) max(SUL_per_million_week(:,3)) max(CENTRO_per_million_week(:,3)) max(BR_per_million_week(:,3))]);
axis_new_deaths = 10^(ceil(log10(max_aux)));

%Novos casos aumentam em escala log de 10
max_aux = max([max(NORTE_per_million_week(:,1)) max(NORDESTE_per_million_week(:,1)) max(SUDESTE_per_million_week(:,1)) max(SUL_per_million_week(:,1)) max(CENTRO_per_million_week(:,1)) max(BR_per_million_week(:,1)) ]);
axis_new_cases = 10^(ceil(log10(max_aux)));

%Para deixar igual aos gráficos do Brasil (ajuste manual)
axis_cases = 10000;
axis_deaths = 1000;

%Estilos e cores
%Fontes, estilos e cores
fonte_titulo = 9;
fonte_labels = 8;
fonte_padrao = 8; %numeros dos eixos
fonte_estados = 7;

colorNORTE = [0,169,74]/255;
colorNORDESTE = [0,99,181]/255;
colorSUDESTE = [254,88,52]/255;
colorSUL = [209,227,105]/255;
colorCENTRO = [135,85,30]/255;
colorBR = [0,0,0];

lineNORTE = '-';
lineNORDESTE = '-';
lineSUDESTE = '-';
lineSUL = '-';
lineCENTRO = '-';
lineBR = '-';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (1);

[n1,n2] = size(NORTE_deaths);
n=n1;
days_state = 0:1:n-1;
figNORTE=semilogy(days_state,NORTE_deaths(:,4))
hold on;
set(figNORTE,'LineWidth', 1,"color",colorNORTE,'DisplayName','Norte','Linestyle',lineNORTE)
text (n-1, NORTE_deaths(n,4), [' Norte'],'FontSize',fonte_estados,"color",colorNORTE);

[n1,n2] = size(NORDESTE_deaths);
n=n1;
days_state = 0:1:n-1;
figNORDESTE=semilogy(days_state,NORDESTE_deaths(:,4))
hold on;
set(figNORDESTE,'LineWidth', 1,"color",colorNORDESTE,'DisplayName','Nordeste','Linestyle',lineNORDESTE)
text (n-1, NORDESTE_deaths(n,4), [' Nordeste'],'FontSize',fonte_estados,"color",colorNORDESTE);

[n1,n2] = size(SUDESTE_deaths);
n=n1;
days_state = 0:1:n-1;
figSUDESTE=semilogy(days_state,SUDESTE_deaths(:,4))
hold on;
set(figSUDESTE,'LineWidth', 1,"color",colorSUDESTE,'DisplayName','Sudeste','Linestyle',lineSUDESTE)
text (n-1, SUDESTE_deaths(n,4), [' Sudeste'],'FontSize',fonte_estados,"color",colorSUDESTE);

[n1,n2] = size(SUL_deaths);
n=n1;
days_state = 0:1:n-1;
figSUL=semilogy(days_state,SUL_deaths(:,4))
hold on;
set(figSUL,'LineWidth', 1,"color",colorSUL,'DisplayName','Sul','Linestyle',lineSUL)
text (n-1, SUL_deaths(n,4), [' Sul'],'FontSize',fonte_estados,"color",colorSUL);

[n1,n2] = size(CENTRO_deaths);
n=n1;
days_state = 0:1:n-1;
figCENTRO=semilogy(days_state,CENTRO_deaths(:,4))
hold on;
set(figCENTRO,'LineWidth', 1,"color",colorCENTRO,'DisplayName','Centro-Oeste','Linestyle',lineCENTRO)
text (n-1, CENTRO_deaths(n,4), [' Centro-Oeste'],'FontSize',fonte_estados,"color",colorCENTRO);


if (plotBR == 1)
[n1,n2] = size(BR_deaths);
n=n1;
days_state = 0:1:n-1;
figBR=semilogy(days_state,BR_deaths(:,4),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR)
text (n-1, BR_deaths(n1,4), [' BR'],'FontSize',fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao)
title({'Letalidade da epidemia',['Regiões do Brasil em ',end_time]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' morte (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northwest");
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

print(gcf,[name,'_letalidade_',datestr(dia(n1dia,n2dia),29),'.png'],'-dpng','-r300');

close(figure(1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure (2);
[n1,n2] = size(NORTE_cases);
n=n1;
days_state = 0:1:n-1;
figNORTE=semilogy(days_state,NORTE_cases(:,2))
hold on;
set(figNORTE,'LineWidth', 1,"color",colorNORTE,'DisplayName','Norte','Linestyle',lineNORTE)
text (n-1, NORTE_cases(n1,2), [' Norte'],'FontSize',fonte_estados,"color",colorNORTE);

[n1,n2] = size(NORDESTE_cases);
n=n1;
days_state = 0:1:n-1;
figNORDESTE=semilogy(days_state,NORDESTE_cases(:,2))
hold on;
set(figNORDESTE,'LineWidth', 1,"color",colorNORDESTE,'DisplayName','Nordeste','Linestyle',lineNORDESTE)
text (n-1, NORDESTE_cases(n1,2), [' Nordeste'],'FontSize',fonte_estados,"color",colorNORDESTE);

[n1,n2] = size(SUDESTE_cases);
n=n1;
days_state = 0:1:n-1;
figSUDESTE=semilogy(days_state,SUDESTE_cases(:,2))
hold on;
set(figSUDESTE,'LineWidth', 1,"color",colorSUDESTE,'DisplayName','Sudeste','Linestyle',lineSUDESTE)
text (n-1, SUDESTE_cases(n1,2), [' Sudeste'],'FontSize',fonte_estados,"color",colorSUDESTE);

[n1,n2] = size(SUL_cases);
n=n1;
days_state = 0:1:n-1;
figSUL=semilogy(days_state,SUL_cases(:,2))
hold on;
set(figSUL,'LineWidth', 1,"color",colorSUL,'DisplayName','Sul','Linestyle',lineSUL)
text (n-1, SUL_cases(n1,2), [' Sul'],'FontSize',fonte_estados,"color",colorSUL);

[n1,n2] = size(CENTRO_cases);
n=n1;
days_state = 0:1:n-1;
figCENTRO=semilogy(days_state,CENTRO_cases(:,2))
hold on;
set(figCENTRO,'LineWidth', 1,"color",colorCENTRO,'DisplayName','Centro-Oeste','Linestyle',lineCENTRO)
text (n-1, CENTRO_cases(n1,2), [' Centro-Oeste'],'FontSize',fonte_estados,"color",colorCENTRO);


if (plotBR == 1)
[n1,n2] = size(BR_cases);
n=n1;
days_state = 0:1:n-1;
figBR=semilogy(days_state,BR_cases(:,2),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR)
text (n-1, BR_cases(n1,2), [' BR'],'FontSize',fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao)
title({'Contágio da epidemia',['Regiões do Brasil em ',end_time]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' morte (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northwest");
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

print(gcf,[name,'_contagio_',datestr(dia(n1dia,n2dia),29),'.png'],'-dpng','-r300');


close(figure(2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
figure (3);

figNORTE=loglog(NORTE_per_million_week(:,4),NORTE_per_million_week(:,3))
hold on;
set(figNORTE,'LineWidth', 1,"color",colorNORTE,'DisplayName','Norte','Linestyle',lineNORTE)
text (NORTE_per_million_week(D,4), NORTE_per_million_week(D,3), [' Norte'],'FontSize',fonte_estados,"color",colorNORTE);

figNORDESTE=loglog(NORDESTE_per_million_week(:,4),NORDESTE_per_million_week(:,3))
hold on;
set(figNORDESTE,'LineWidth', 1,"color",colorNORDESTE,'DisplayName','Nordeste','Linestyle',lineNORDESTE)
text (NORDESTE_per_million_week(D,4), NORDESTE_per_million_week(D,3), [' Nordeste'],'FontSize',fonte_estados,"color",colorNORDESTE);

figSUDESTE=loglog(SUDESTE_per_million_week(:,4),SUDESTE_per_million_week(:,3))
hold on;
set(figSUDESTE,'LineWidth', 1,"color",colorSUDESTE,'DisplayName','Sudeste','Linestyle',lineSUDESTE)
text (SUDESTE_per_million_week(D,4), SUDESTE_per_million_week(D,3), [' Sudeste'],'FontSize',fonte_estados,"color",colorSUDESTE);

figSUL=loglog(SUL_per_million_week(:,4),SUL_per_million_week(:,3))
hold on;
set(figSUL,'LineWidth', 1,"color",colorSUL,'DisplayName','Sul','Linestyle',lineSUL)
text (SUL_per_million_week(D,4), SUL_per_million_week(D,3), [' Sul'],'FontSize',fonte_estados,"color",colorSUL);

figCENTRO=loglog(CENTRO_per_million_week(:,4),CENTRO_per_million_week(:,3))
hold on;
set(figCENTRO,'LineWidth', 1,"color",colorCENTRO,'DisplayName','Centro-oeste','Linestyle',lineCENTRO)
text (CENTRO_per_million_week(D,4), CENTRO_per_million_week(D,3), [' Centro-oeste'],'FontSize',fonte_estados,"color",colorCENTRO);


if (plotBR == 1)
figBR=loglog(BR_per_million_week(:,4),BR_per_million_week(:,3),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR)
text (BR_per_million_week(D,4), BR_per_million_week(D,3), [' BR'],'FontSize',fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao);
title({'Informativo de progresso da epidemia (número de mortes)',['Regiões do Brasil em ',end_time]},'FontSize',fonte_titulo)
ylabel(['Novas mortes por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northwest");
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

print(gcf,[name,'_informativo-mortes_',datestr(dia(n1dia,n2dia),29),'.png'],'-dpng','-r300');

close(figure(3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos (por milhao de hab.)
figure (4);

figNORTE=loglog(NORTE_per_million_week(:,2),NORTE_per_million_week(:,1))
hold on;
set(figNORTE,'LineWidth', 1,"color",colorNORTE,'DisplayName','Norte','Linestyle',lineNORTE)
text (NORTE_per_million_week(D,2), NORTE_per_million_week(D,1), [' Norte'],'FontSize',fonte_estados,"color",colorNORTE);

figNORDESTE=loglog(NORDESTE_per_million_week(:,2),NORDESTE_per_million_week(:,1))
hold on;
set(figNORDESTE,'LineWidth', 1,"color",colorNORDESTE,'DisplayName','Nordeste','Linestyle',lineNORDESTE)
text (NORDESTE_per_million_week(D,2), NORDESTE_per_million_week(D,1), [' Nordeste'],'FontSize',fonte_estados,"color",colorNORDESTE);

figSUDESTE=loglog(SUDESTE_per_million_week(:,2),SUDESTE_per_million_week(:,1))
hold on;
set(figSUDESTE,'LineWidth', 1,"color",colorSUDESTE,'DisplayName','Sudeste','Linestyle',lineSUDESTE)
text (SUDESTE_per_million_week(D,2), SUDESTE_per_million_week(D,1), [' Sudeste'],'FontSize',fonte_estados,"color",colorSUDESTE);

figSUL=loglog(SUL_per_million_week(:,2),SUL_per_million_week(:,1))
hold on;
set(figSUL,'LineWidth', 1,"color",colorSUL,'DisplayName','Sul','Linestyle',lineSUL)
text (SUL_per_million_week(D,2), SUL_per_million_week(D,1), [' Sul'],'FontSize',fonte_estados,"color",colorSUL);

figCENTRO=loglog(CENTRO_per_million_week(:,2),CENTRO_per_million_week(:,1))
hold on;
set(figCENTRO,'LineWidth', 1,"color",colorCENTRO,'DisplayName','Centro-oeste','Linestyle',lineCENTRO)
text (CENTRO_per_million_week(D,2), CENTRO_per_million_week(D,1), [' Centro-oeste'],'FontSize',fonte_estados,"color",colorCENTRO);


if (plotBR == 1)
figBR=loglog(BR_per_million_week(:,2),BR_per_million_week(:,1),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR)
text (BR_per_million_week(D,2), BR_per_million_week(D,1), [' BR'],'FontSize',fonte_estados,"color",colorBR);
end

set(gca,'FontSize',fonte_padrao);
title({'Informativo de progresso da epidemia (número de casos)',['Regiões do Brasil em ',end_time]},'FontSize',fonte_titulo);
ylabel(['Novos casos por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northwest");
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

print(gcf,[name,'_informativo-casos_',datestr(dia(n1dia,n2dia),29),'.png'],'-dpng','-r300');


close(figure(4));

