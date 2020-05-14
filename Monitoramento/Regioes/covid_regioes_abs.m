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
% - número de casos em relação ao tempo desde 100 casos                % 
% - número de mortes em relação ao tempo desde 10 mortes               % 
% - número de novos casos por semana em relação ao total de casos       %
% - número de novas mortes por semana em relação ao total de mortes     %
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
% Last Update [11/05/2020]                                              %
%_______________________________________________________________________%
%=======================================================================%
clc;
clear all;
close all;

% IMPORTANTE
% Esse código só funciona se o Ministério da Saúde manter o padrão de formatação dos arquivos.
% O padrão é:
% - Conter headers com os nomes: "estado","data","casosNovos","casosAcumulados", "obitosNovos", "obitosAcumulados".

%nome que aparece nos arquivos
name = 'regioes';

%Lendo o arquivo disponível no site 
data = readtable('arquivo_geral.csv');
BRASIL = [data.casosAcumulados, data.casosNovos, data.obitosAcumulados, data.obitosNovos];

%Definindo o número de dias com informações do COVID-19, que representa o tamanho das matrizes dos estados
[n1,n2] = size(BRASIL);
D = n1/27;
dates = data.data(find(strcmp([data.estado],'RO')),:);
end_time = max(datenum(dates));


%plot_type é pra diferenciar mortes e casos pra organizarmos a ordem da legenda de acordo com o número de mortes ou de casos
for( plot_type = 1:1:2)
%loop nas 5 regiões estudados
for( init = 1:1:6)

clearvars -except plot_type init data name D BRASIL end_time

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

BR=RO+AC+AM+RR+PA+AP+TO+MA+PI+CE+RN+PE+AL+SE+BA+MG+ES+RJ+SP+PR+SC+RS+MS+MT+DF+PB+GO;

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
new_cases = NORTE(:,2);
tot_deaths = NORTE(:,3);
new_deaths = NORTE(:,4);
end
if (init == 2)
country = 'Nordeste         ';
color = [0,99,181]/255;
pop = popNORDESTE;
tot_cases = NORDESTE(:,1);
new_cases = NORDESTE(:,2);
tot_deaths = NORDESTE(:,3);
new_deaths = NORDESTE(:,4);
end
if (init == 1)
country = 'Sudeste          ';
color = [254,88,52]/255;
pop = popSUDESTE;
tot_cases = SUDESTE(:,1);
new_cases = SUDESTE(:,2);
tot_deaths = SUDESTE(:,3);
new_deaths = SUDESTE(:,4);
end
if (init == 4)
country = 'Sul                    ';
color = [193,203,68]/255;
pop = popSUL;
tot_cases = SUL(:,1);
new_cases = SUL(:,2);
tot_deaths = SUL(:,3);
new_deaths = SUL(:,4);
end
if (init == 5)
country = 'Centro-Oeste    ';
color = [135,85,30]/255;
pop = popCENTRO;
tot_cases = CENTRO(:,1);
new_cases = CENTRO(:,2);
tot_deaths = CENTRO(:,3);
new_deaths = CENTRO(:,4);
end
if (init == 6)
country = 'Brasil            ';
color = [0,0,0]/255;
pop = popBR;
tot_cases = BR(:,1);
new_cases = BR(:,2);
tot_deaths = BR(:,3);
new_deaths = BR(:,4);
end

end


if (plot_type == 2)
%ordem por países que tem mais morte
if (init == 3)
country = 'Norte              ';
color = [0,169,74]/255; 
pop = popNORTE;
tot_cases = NORTE(:,1);
new_cases = NORTE(:,2);
tot_deaths = NORTE(:,3);
new_deaths = NORTE(:,4);
end
if (init == 2)
country = 'Nordeste        ';
color = [0,99,181]/255;
pop = popNORDESTE;
tot_cases = NORDESTE(:,1);
new_cases = NORDESTE(:,2);
tot_deaths = NORDESTE(:,3);
new_deaths = NORDESTE(:,4);
end
if (init == 1)
country = 'Sudeste         ';
color = [254,88,52]/255;
pop = popSUDESTE;
tot_cases = SUDESTE(:,1);
new_cases = SUDESTE(:,2);
tot_deaths = SUDESTE(:,3);
new_deaths = SUDESTE(:,4);
end
if (init == 4)
country = 'Sul                    ';
color = [193,203,68]/255;
pop = popSUL;
tot_cases = SUL(:,1);
new_cases = SUL(:,2);
tot_deaths = SUL(:,3);
new_deaths = SUL(:,4);
end
if (init == 5)
country = 'Centro-Oeste    ';
color = [135,85,30]/255;
pop = popCENTRO;
tot_cases = CENTRO(:,1);
new_cases = CENTRO(:,2);
tot_deaths = CENTRO(:,3);
new_deaths = CENTRO(:,4);
end
if (init == 6)
country = 'Brasil            ';
color = [0,0,0]/255;
pop = popBR;
tot_cases = BR(:,1);
new_cases = BR(:,2);
tot_deaths = BR(:,3);
new_deaths = BR(:,4);
end

end

if (init < 6)  linew = 1.2; end
if (init == 6) linew = 1.75; end

tot_cases_pm = tot_cases/ (pop / 1000000);
new_cases_pm = new_cases/ (pop / 1000000);
tot_deaths_pm = tot_deaths/ (pop / 1000000);
new_deaths_pm = new_deaths/ (pop / 1000000);


%consolidando os novos casos e mortes por semana
new_cases7 = new_cases;
for (i=7:1:D ) 
new_cases7(i,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(i,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
new_cases7_pm(i,1) = new_cases_pm(i,1)+new_cases_pm(i-1,1)+new_cases_pm(i-2,1)+new_cases_pm(i-3,1)+new_cases_pm(i-4,1)+new_cases_pm(i-5,1)+new_cases_pm(i-6,1);
new_deaths7_pm(i,1) = new_deaths_pm(i,1)+new_deaths_pm(i-1,1)+new_deaths_pm(i-2,1)+new_deaths_pm(i-3,1)+new_deaths_pm(i-4,1)+new_deaths_pm(i-5,1)+new_deaths_pm(i-6,1);
end

%Criando vetores desde dia zero a partir de X mortes ("_deaths") ou a partir de X casos ("_cases")
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

day_axis = 80;

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

%Linhas "dobram"
y_init=10;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 4*i;
x2(i+1) = 5*i;
x3(i+1) = 6*i;
x4(i+1) = 7*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;

 n = max(max(size(tot_deaths_X)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_X,'DisplayName',[country,' ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, tot_deaths_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
figure (3);

%Grid manual
grid1=loglog([1,100000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,100000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid3=loglog(100*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=loglog(1000*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(10000*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;


 n = max(max(size(tot_deaths)));
 fig=loglog(tot_deaths,new_deaths7,'DisplayName',[country,' ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_deaths(n,1), new_deaths7(n,1), [' ',country],'FontSize',fonte_location,"color",color);

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
y_init=10;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 4*i;
x2(i+1) = 5*i;
x3(i+1) = 6*i;
x4(i+1) = 7*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;

 n = max(max(size(new_deaths_X)));
 days = 0:1:n-1;
 fig=plot(days,new_deaths7_X,'DisplayName',[country,' ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_deaths7_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);
end

if (plot_type == 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos/milhao por tempo (dia zero definido por casos/milhao)
figure (2);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),10000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),100000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
y_init=100;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 4*i;
x2(i+1) = 5*i;
x3(i+1) = 6*i;
x4(i+1) = 7*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;

 n = max(max(size(tot_cases_X)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_X,'DisplayName',[country,' ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, tot_cases_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos (por milhao de hab.)
figure (4);

grid1=loglog([1,1000000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,1000000],10000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid1=loglog(1000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=loglog(10000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=loglog(100000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 n = max(max(size(tot_cases)));
 fig=loglog(tot_cases,new_cases7,'DisplayName',[country,' ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_cases(n,1), new_cases7(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos por tempo (dia zero definido por casos/milhao)
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
y_init=100;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 4*i;
x2(i+1) = 5*i;
x3(i+1) = 6*i;
x4(i+1) = 7*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;

 n = max(max(size(new_cases_X)));
 days = 0:1:n-1;
 fig=plot(days,new_cases7_X,'DisplayName',[country,' ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_cases7_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);


end

end

end


% Configurações:

outputdir = datestr(end_time,29);
if ~exist(outputdir, 'dir')
  mkdir(outputdir);
end


figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Letalidade da epidemia',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northwest");;

y_init=10;
max_y=100000;
ang = 49;
h1=text(51,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 45;
h2=text(64,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 40;
h3=text(76.9,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 38;
h4=text(79.1,0.32*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k'})


axis([0 day_axis y_init max_y]);


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
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos'],'FontSize',fonte_labels);
ylabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northwest");;

y_init=100;
max_y=1000000;
ang = 49;
h1=text(51,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 45;
h2=text(64,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 40;
h3=text(76.9,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 38;
h4=text(79.1,0.32*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'100','1k','10k','100k','1M'})

axis([0 day_axis y_init max_y]);



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
ylabel(['Novas mortes por semana'],'FontSize',fonte_labels);
xlabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northwest");;

axis([10 100000 10 10000]);

set(gca,'YTickLabel',{'10','100','1k','10k'})
set(gca,'XTickLabel',{'10','100','1k','10k','100k'})

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

figure (4)

set(gca,'FontSize',fonte_padrao);
title({'Informativo de progresso da epidemia (número de casos)',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo)

ylabel(['Novos casos por semana'],'FontSize',fonte_labels);
xlabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northwest");

axis([100 1000000 100 100000]);

set(gca,'YTickLabel',{'100','1k','10k','100k'})
set(gca,'XTickLabel',{'100','1k','10k','100k','1M'})

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
title({'Letalidade semanal da epidemia',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Novas mortes por semana",'FontSize',fonte_labels);
legend ("location", "northwest");

y_init=1;
max_y=100000;
ang = 43;
h1=text(51.2,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 39;
h2=text(64,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 35;
h3=text(76.9,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 33;
h4=text(79.1,0.32*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k','10k','100k'})

axis([0 day_axis y_init max_y]);

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
title({'Contágio semanal da epidemia',['Regiões do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos'],'FontSize',fonte_labels);
ylabel ("Novos casos por semana",'FontSize',fonte_labels);
legend ("location", "northwest");

y_init=10;
max_y=1000000;
ang = 43;
h1=text(51.2,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 39;
h2=text(64,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 35;
h3=text(76.9,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 33;
h4=text(79.1,0.32*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k','1M'})

axis([0 day_axis y_init max_y]);


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



saveas(figure(1),[pwd '/',outputdir,'/',name,'_letalidade-abs_',datestr(end_time,29),'.png']);
saveas(figure(2),[pwd '/',outputdir,'/',name,'_contagio-abs_',datestr(end_time,29),'.png']);
saveas(figure(3),[pwd '/',outputdir,'/',name,'_informativo-mortes-abs_',datestr(end_time,29),'.png']);
saveas(figure(4),[pwd '/',outputdir,'/',name,'_informativo-casos-abs_',datestr(end_time,29),'.png']);
saveas(figure(5),[pwd '/',outputdir,'/',name,'_letalidade-semanal-abs_',datestr(end_time,29),'.png']);
saveas(figure(6),[pwd '/',outputdir,'/',name,'_contagio_semanal-abs_',datestr(end_time,29),'.png']);


close all



