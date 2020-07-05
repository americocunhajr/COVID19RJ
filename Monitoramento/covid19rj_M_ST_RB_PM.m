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
% - número de Casos por semana em relação ao total de casos (por  %
% milhão de habitantes);                                                %
% - número de Mortes por semana em relação ao total de mortes     %
% (por milhão de habitantes).                                           %
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

%nome que aparece nos arquivos
name = 'RB';

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


%plot_type é pra diferenciar mortes e casos pra organizarmos a ordem da legenda de acordo com o número de mortes ou de casos
for( plot_type = 1:1:2)
%loop nas 5 regiões estudados
for( init = 1:1:6)

clearvars -except plot_type init data table name D BRASIL end_time

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

%Juntando os estados em regiões
NORTE = RO + AC + AM + RR + PA + AP + TO;
NORDESTE = MA + PI + CE + RN + PB + PE + AL + SE + BA; 
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

popBR=popRO+popAC+popAM+popRR+popPA+popAP+popTO+popMA+popPI+popCE+popRN+popPE+popAL+popSE+popBA+popMG+popES+popRJ+popSP+popPR+popSC+popRS+popMS+popMT+popDF+popPB+popGO;

%População de cada região
popNORTE = popRO + popAC+ popAM + popRR + popPA;
popNORDESTE = popMA + popPI + popCE + popRN + popPB + popPE + popAL + popSE; 
popSUDESTE = popMG + popES + popRJ + popSP;
popSUL = popPR + popSC + popRS;
popCENTRO = popMS + popMT + popGO + popDF;


if (plot_type == 1)
%ordem por países que tem mais morte
if (init == 3)
country = 'Norte              ';
color = [0,169,74]/255; 
pop = popNORTE;
tot_cases = NORTE(:,1);
tot_deaths = NORTE(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 2)
country = 'Nordeste      ';
color = [0,99,181]/255;
pop = popNORDESTE;
tot_cases = NORDESTE(:,1);
tot_deaths = NORDESTE(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 1) 
country = 'Sudeste        ';
color = [254,88,52]/255;
pop = popSUDESTE;
tot_cases = SUDESTE(:,1);
tot_deaths = SUDESTE(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 5)
country = 'Sul                  ';
color = [193,203,68]/255;
pop = popSUL;
tot_cases = SUL(:,1);
tot_deaths = SUL(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 4)
country = 'Centro-Oeste  ';
color = [135,85,30]/255;
pop = popCENTRO;
tot_cases = CENTRO(:,1);
tot_deaths = CENTRO(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 6)
country = 'Brasil            ';
color = [0,0,0]/255;
pop = popBR;
tot_cases = BR(:,1);
tot_deaths = BR(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end

end


if (plot_type == 2)
%ordem por países que tem mais morte
if (init == 3)
country = 'Norte              ';
color = [0,169,74]/255; 
pop = popNORTE;
tot_cases = NORTE(:,1);
tot_deaths = NORTE(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 2)
country = 'Nordeste        ';
color = [0,99,181]/255;
pop = popNORDESTE;
tot_cases = NORDESTE(:,1);
tot_deaths = NORDESTE(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 1)
country = 'Sudeste          ';
color = [254,88,52]/255;
pop = popSUDESTE;
tot_cases = SUDESTE(:,1);
tot_deaths = SUDESTE(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 5)
country = 'Sul                    ';
color = [193,203,68]/255;
pop = popSUL;
tot_cases = SUL(:,1);
tot_deaths = SUL(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 4)
country = 'Centro-Oeste  ';
color = [135,85,30]/255;
pop = popCENTRO;
tot_cases = CENTRO(:,1);
tot_deaths = CENTRO(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 6)
country = 'Brasil            ';
color = [0,0,0]/255;
pop = popBR;
tot_cases = BR(:,1);
tot_deaths = BR(:,2);

cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end

end

if (init < 6)  linew = 1.2; end
if (init == 6) linew = 1.75; end

tot_cases_pm = tot_cases/ (pop / 1000000);
new_cases_pm = new_cases/ (pop / 1000000);
tot_deaths_pm = tot_deaths/ (pop / 1000000);
new_deaths_pm = new_deaths/ (pop / 1000000);


%consolidando os Casos e mortes por semana
for (i=7:1:D ) 
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
for (i=1:1:D )
if (tot_deaths(i,1) >= X_deaths)
n=n+1;
tot_deaths_X(n,1) = tot_deaths(i,1);
new_deaths_X(n,1) = new_deaths(i,1);
new_deaths7_X(n,1) = new_deaths7(i,1);
end
end
n=0;
for (i=1:1:D )
if (tot_cases(i,1) >= X_cases)
n=n+1;
tot_cases_X(n,1) = tot_cases(i,1);
new_cases_X(n,1) = new_cases(i,1);
new_cases7_X(n,1) = new_cases7(i,1);
end
end
n=0;
for (i=1:1:D )
if (tot_cases_pm(i,1) >= X_cases_pm)
n=n+1;
tot_cases_pmX(n,1) = tot_cases_pm(i,1);
new_cases_pmX(n,1) = new_cases_pm(i,1);
new_cases7_pmX(n,1) = new_cases7_pm(i,1);
end
end
n=0;
for (i=1:1:D )
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

day_axis = 160;

Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

if (plot_type == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (1);


%Grid manual
grid1=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
y_init=1;
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

 n = max(max(size(tot_deaths_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_pmX,'DisplayName',[country,' ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_deaths_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Mortes X total de mortes (por milhao de hab.)
figure (3);

%Grid manual
grid1=loglog([1,10000],10*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,10000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid3=loglog(10*(ones(2, 1)),[1,1000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=loglog(100*(ones(2, 1)),[1,1000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(1000*(ones(2, 1)),[1,1000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Mortes
 new_deaths7w0_pm = new_deaths7_pm;
 for (i=2:length(new_deaths7w0_pm))
     if (new_deaths7w0_pm(i) <= 0) new_deaths7w0_pm(i) = new_deaths7w0_pm(i-1); end
 end


 n = max(max(size(tot_deaths_pm)));
 fig=loglog(tot_deaths_pm,new_deaths7w0_pm,'DisplayName',[country,' ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_deaths_pm(n,1), new_deaths7_pm(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (5);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),1*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
% y_init=1;
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

 n = max(max(size(new_deaths_pmX)));
 days = 0:1:n-1;
 fig=plot(days,new_deaths7_pmX/7,'DisplayName',[country,' ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_deaths7_pmX(n,1)/7, [' ',country],'FontSize',fonte_location,"color",color);
end

if (plot_type == 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos/milhao por tempo (dia zero definido por casos/milhao)
figure (2);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),10000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
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

 n = max(max(size(tot_cases_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_pmX,'DisplayName',[country,' ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_cases_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos X total de casos (por milhao de hab.)
figure (4);

grid1=loglog([1,1000000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,1000000],10000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid3=loglog(1000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=loglog(10000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(100000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Casos
 new_cases7w0_pm = new_cases7_pm;
 for (i=2:length(new_cases7w0_pm/7))
     if (new_cases7w0_pm(i)/7 <= 0) new_cases7w0_pm(i) = new_cases7w0_pm(i-1); end
 end

 n = max(max(size(tot_cases_pm)));
 fig=loglog(tot_cases_pm,new_cases7w0_pm,'DisplayName',[country,' ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_cases_pm(n,1), new_cases7_pm(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos/milhao por tempo (dia zero definido por casos/milhao)
figure (6);

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

 n = max(max(size(new_cases_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,new_cases7_pmX/7,'DisplayName',[country,' ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_cases7_pmX(n,1)/7, [' ',country],'FontSize',fonte_location,"color",color);


end

end

end


% Configurações:

figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Mortalidade da epidemia',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte'],['(por milhão de habitantes)']},'FontSize',fonte_labels);
ylabel ({'Total de mortes', '(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northwest");;

y_init=1;
max_y=10000;
max_x=day_axis;

ang = 52;
h1=text(90,0.92*max_y,'números dobram a cada 7 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 32;
h2=text(158,0.29*max_y,'14 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
 ang = 25;
 h3=text(158,0.022*max_y,'21 dias');
 set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 38;
% h4=text(99,0.65*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k','10k'})

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
title({'Contágio da epidemia',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos'], '(por milhão de habitantes)'},'FontSize',fonte_labels);
ylabel ({'Total de casos','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northwest");

y_init=10;
max_y=100000;
max_x=day_axis;

ang = 52;
h1=text(90,0.92*max_y,'números dobram a cada 7 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 32;
h2=text(158,0.29*max_y,'14 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
 ang = 25;
 h3=text(158,0.022*max_y,'21 dias');
 set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 38;
% h4=text(99,0.65*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k'})

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
title({'Informativo de progresso da epidemia (número de mortes)',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel({'Mortes por semana','(por milhão de habitantes)'},'FontSize',fonte_labels);
xlabel ({'Total de mortes','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northwest");
max_x = 10000;
max_y = 1000;
axis([1 max_x 1 max_y]);

set(gca,'YTickLabel',{'1','10','100','1k'})
set(gca,'XTickLabel',{'1','10','100','1k','10k'})

hfonte=text(max_x,max_y,{'Gráfico inspirado em: https://aatishb.com/covidtrends/','Fonte: https://covid19br.wcota.me/'});
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
title({'Informativo de progresso da epidemia (número de casos)',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo)

ylabel({'Casos por semana','(por milhão de habitantes)'},'FontSize',fonte_labels);
xlabel ({'Total de casos','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northwest");

max_x = 200000;
max_y = 20000;
axis([100 max_x 100 max_y]);


set(gca,'YTickLabel',{'100','1k','10k','100k'})
set(gca,'XTickLabel',{'100','1k','10k','100k','1M'})

hfonte=text(max_x,max_y,{'Gráfico inspirado em: https://aatishb.com/covidtrends/','Fonte: https://covid19br.wcota.me/'});
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
title({'Mortalidade diária da epidemia',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte'],'(por milhão de habitantes)'},'FontSize',fonte_labels);
ylabel ({'Mortes diárias por milhão de habitantes','(Média móvel de 7 dias)'},'FontSize',fonte_labels);
legend ("location", "northwest");

y_init=0.1;
max_y=100;
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

set(gca,'YTickLabel',{'0.1','1','10','100','1k','10k'})

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
title({'Contágio diário da epidemia',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos'],'(por milhão de habitantes)'},'FontSize',fonte_labels);
ylabel ({'Novos casos por dia por milhão de habitantes','(Média móvel de 7 dias)'},'FontSize',fonte_labels);
legend ("location", "northwest");;

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



outputdir = datestr(end_time,29);
if ~exist([pwd,'/',outputdir], 'dir')
  mkdir([pwd,'/',outputdir]);
end

outputdir2 = name;
if ~exist([pwd,'/',outputdir,'/',outputdir2], 'dir')
  mkdir([pwd,'/',outputdir,'/',outputdir2]);
end

%Controle do site
print(figure(1),[pwd '/upload/',name,'/covid19rj_M_ST_NM_AC_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/upload/',name,'/covid19rj_M_ST_NC_AC_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/upload/',name,'/covid19rj_M_EF_NM_NA_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/upload/',name,'/covid19rj_M_EF_NC_NA_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(5),[pwd '/upload/',name,'/covid19rj_M_ST_NM_PS_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(6),[pwd '/upload/',name,'/covid19rj_M_ST_NC_PS_PM_',name,'.png'],'-dpng','-r400'); 

%Controle do github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NM_NA_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NC_NA_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(5),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_PS_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(6),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_PS_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 

close all

