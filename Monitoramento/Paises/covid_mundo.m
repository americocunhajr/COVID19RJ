%=======================================================================%
%                             COVID-19                                  %
%                      OBSERVATÓRIO FLUMINENSE                          %
%                           covid19rj.org                               %
%                                                                       %
%                  - COVID-19 NOS PAÍSES MAIS AFETADOS -                %
%                                                                       %
% Este algoritmo gera gráficos sobre os números de casos e mortes por   %
% Covid-19 nos países mais afetados.                                    %
%                                                                       %
% A série de gráficos contém:                                           %
% - número de casos por milhão em relação ao tempo desde 10 casos por   %
% milhão;                                                               %
% - número de mortes por milhão em relação ao tempo desde 1 morte por   %
% milhão;                                                               %
% - número de novos casos por semana em relação ao total de casos (por  %
% milhão de habitantes);                                                %
% - número de novas mortes por semana em relação ao total de mortes     %
% (por milhão de habitantes).                                           %
%                                                                       %
% Você precisará dos arquivos "global_cases.csv" e "global_deaths.csv"  %
% encontrados no repositório https://github.com/americocunhajr/COVID19RJ % 
% Esses arquivos são atualizados conforme os dados do                   % 
% https://www.worldometers.info/coronavirus/                            %
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
% Last Update [07/05/2020]                                              %
%_______________________________________________________________________%
%=======================================================================%
clc;
clear all;

name = 'paises';

% Definindo o dia zero para casos e mortes (por milhão)
X_cases = 10;
X_deaths = 1;

%Lendo o arquivo disponível no site 
data_cases = readtable('global_cases.csv','ReadVariableNames',false);
data_deaths = readtable('global_deaths.csv','ReadVariableNames',false);

world_cases = table2array(data_cases(:,2:end));
world_deaths = table2array(data_deaths(:,2:end));

BR_cases_init= world_cases(find(strcmp([data_cases.Var1], 'Brazil')),:);
BR_deaths_init = world_deaths(find(strcmp([data_deaths.Var1], 'Brazil')),:);
BR_cases_init = BR_cases_init';
BR_deaths_init = BR_deaths_init';
[n1,n2] = size(BR_cases_init);
for (i=n1:-1:2)
BR(i,1) = BR_cases_init(i,1)- BR_cases_init(i-1,1);
BR(i,2) = BR_cases_init(i,1);
BR(i,3) = BR_deaths_init(i,1)- BR_deaths_init(i-1,1);
BR(i,4) = BR_deaths_init(i,1);
end

US_cases_init = world_cases(find(strcmp([data_cases.Var1], 'US')),:);
US_deaths_init = world_deaths(find(strcmp([data_deaths.Var1], 'US')),:);
US_cases_init = US_cases_init';
US_deaths_init = US_deaths_init';
[n1,n2] = size(US_cases_init);
for (i=n1:-1:2)
US(i,1) = US_cases_init(i,1)- US_cases_init(i-1,1);
US(i,2) = US_cases_init(i,1);
US(i,3) = US_deaths_init(i,1)- US_deaths_init(i-1,1);
US(i,4) = US_deaths_init(i,1);
end

FR_cases_init = world_cases(find(strcmp([data_cases.Var1], 'France')),:);
FR_deaths_init = world_deaths(find(strcmp([data_deaths.Var1], 'France')),:);
FR_cases_init = FR_cases_init';
FR_deaths_init = FR_deaths_init';
[n1,n2] = size(FR_cases_init);
for (i=n1:-1:2)
FR(i,1) = FR_cases_init(i,1)- FR_cases_init(i-1,1);
FR(i,2) = FR_cases_init(i,1);
FR(i,3) = FR_deaths_init(i,1)- FR_deaths_init(i-1,1);
FR(i,4) = FR_deaths_init(i,1);
end

IT_cases_init = world_cases(find(strcmp([data_cases.Var1], 'Italy')),:);
IT_deaths_init = world_deaths(find(strcmp([data_deaths.Var1], 'Italy')),:);
IT_cases_init = IT_cases_init';
IT_deaths_init = IT_deaths_init';
[n1,n2] = size(IT_cases_init);
for (i=n1:-1:2)
IT(i,1) = IT_cases_init(i,1)- IT_cases_init(i-1,1);
IT(i,2) = IT_cases_init(i,1);
IT(i,3) = IT_deaths_init(i,1)- IT_deaths_init(i-1,1);
IT(i,4) = IT_deaths_init(i,1);
end

SP_cases_init = world_cases(find(strcmp([data_cases.Var1], 'Spain')),:);
SP_deaths_init = world_deaths(find(strcmp([data_deaths.Var1], 'Spain')),:);
SP_cases_init = SP_cases_init';
SP_deaths_init = SP_deaths_init';
[n1,n2] = size(SP_cases_init);
for (i=n1:-1:2)
SP(i,1) = SP_cases_init(i,1)- SP_cases_init(i-1,1);
SP(i,2) = SP_cases_init(i,1);
SP(i,3) = SP_deaths_init(i,1)- SP_deaths_init(i-1,1);
SP(i,4) = SP_deaths_init(i,1);
end

GE_cases_init = world_cases(find(strcmp([data_cases.Var1], 'Germany')),:);
GE_deaths_init = world_deaths(find(strcmp([data_deaths.Var1], 'Germany')),:);
GE_cases_init = GE_cases_init';
GE_deaths_init = GE_deaths_init';
[n1,n2] = size(GE_cases_init);
for (i=n1:-1:2)
GE(i,1) = GE_cases_init(i,1)- GE_cases_init(i-1,1);
GE(i,2) = GE_cases_init(i,1);
GE(i,3) = GE_deaths_init(i,1)- GE_deaths_init(i-1,1);
GE(i,4) = GE_deaths_init(i,1);
end

% %Definindo até que dia temos informações
 [d,D]=size(world_cases);
 begin_time = datenum (2020, 2, 15);
 end_time = datestr(begin_time + D-1, 24);


%População de cada estado (fonte worldometer)
popBR = 212337669;
popUS = 331002651;
popFR = 60461826;
popIT = 60461826;
popSP = 46752142;
popGE = 83744809;


% %Consolidando os valores por semana
BR_week = BR;
for (i=7:D)
BR_week(i,1) = BR(i,1)+BR(i-1,1)+BR(i-2,1)+BR(i-3,1)+BR(i-4,1)+BR(i-5,1)+BR(i-6,1);
BR_week(i,3) = BR(i,3)+BR(i-1,3)+BR(i-2,3)+BR(i-3,3)+BR(i-4,3)+BR(i-5,3)+BR(i-6,3);
end
US_week = US;
for (i=7:D)
US_week(i,1) = US(i,1)+US(i-1,1)+US(i-2,1)+US(i-3,1)+US(i-4,1)+US(i-5,1)+US(i-6,1);
US_week(i,3) = US(i,3)+US(i-1,3)+US(i-2,3)+US(i-3,3)+US(i-4,3)+US(i-5,3)+US(i-6,3);
end
FR_week = FR;
for (i=7:D)
FR_week(i,1) = FR(i,1)+FR(i-1,1)+FR(i-2,1)+FR(i-3,1)+FR(i-4,1)+FR(i-5,1)+FR(i-6,1);
FR_week(i,3) = FR(i,3)+FR(i-1,3)+FR(i-2,3)+FR(i-3,3)+FR(i-4,3)+FR(i-5,3)+FR(i-6,3);
end
IT_week = IT;
for (i=7:D)
IT_week(i,1) = IT(i,1)+IT(i-1,1)+IT(i-2,1)+IT(i-3,1)+IT(i-4,1)+IT(i-5,1)+IT(i-6,1);
IT_week(i,3) = IT(i,3)+IT(i-1,3)+IT(i-2,3)+IT(i-3,3)+IT(i-4,3)+IT(i-5,3)+IT(i-6,3);
end
SP_week = SP;
for (i=7:D)
SP_week(i,1) = SP(i,1)+SP(i-1,1)+SP(i-2,1)+SP(i-3,1)+SP(i-4,1)+SP(i-5,1)+SP(i-6,1);
SP_week(i,3) = SP(i,3)+SP(i-1,3)+SP(i-2,3)+SP(i-3,3)+SP(i-4,3)+SP(i-5,3)+SP(i-6,3);
end
GE_week = GE;
for (i=7:D)
GE_week(i,1) = GE(i,1)+GE(i-1,1)+GE(i-2,1)+GE(i-3,1)+GE(i-4,1)+GE(i-5,1)+GE(i-6,1);
GE_week(i,3) = GE(i,3)+GE(i-1,3)+GE(i-2,3)+GE(i-3,3)+GE(i-4,3)+GE(i-5,3)+GE(i-6,3);
end


%Definindo os valores por milhão
BR_per_million = BR / (popBR / 1000000);
US_per_million = US / (popUS / 1000000);
FR_per_million = FR / (popFR / 1000000);
IT_per_million = IT / (popIT / 1000000);
SP_per_million = SP / (popSP / 1000000);
GE_per_million = GE / (popGE / 1000000);

BR_per_million_week = BR_week / (popBR / 1000000);
US_per_million_week = US_week / (popUS / 1000000);
FR_per_million_week = FR_week / (popFR / 1000000);
IT_per_million_week = IT_week / (popIT / 1000000);
SP_per_million_week = SP_week / (popSP / 1000000);
GE_per_million_week = GE_week / (popGE / 1000000);

%Criando vetores desde dia zero a partir de X mortes/milhao ("_deaths") ou a partir de X casos/milhao ("_cases")
%Usuário define dia zero para casos ou mortes
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

n=0;
N=0;
for i=1:1:D
if (US_per_million(i,4) >= X_deaths)
n=n+1;
US_deaths(n,1) = US_per_million(i,1);
US_deaths(n,2) = US_per_million(i,2);
US_deaths(n,3) = US_per_million(i,3);
US_deaths(n,4) = US_per_million(i,4);
end
if (US_per_million(i,2) >= X_cases)
N=N+1;
US_cases(N,1) = US_per_million(i,1);
US_cases(N,2) = US_per_million(i,2);
US_cases(N,3) = US_per_million(i,3);
US_cases(N,4) = US_per_million(i,4);
end
end


n=0;
N=0;
for i=1:D
if (FR_per_million(i,4) >= X_deaths)
n=n+1;
FR_deaths(n,1) = FR_per_million(i,1);
FR_deaths(n,2) = FR_per_million(i,2);
FR_deaths(n,3) = FR_per_million(i,3);
FR_deaths(n,4) = FR_per_million(i,4);
end
if (FR_per_million(i,2) >= X_cases)
N=N+1;
FR_cases(N,1) = FR_per_million(i,1);
FR_cases(N,2) = FR_per_million(i,2);
FR_cases(N,3) = FR_per_million(i,3);
FR_cases(N,4) = FR_per_million(i,4);
end
end

n=0;
N=0;
for i=1:D
if (IT_per_million(i,4) >= X_deaths)
n=n+1;
IT_deaths(n,1) = IT_per_million(i,1);
IT_deaths(n,2) = IT_per_million(i,2);
IT_deaths(n,3) = IT_per_million(i,3);
IT_deaths(n,4) = IT_per_million(i,4);
end
if (IT_per_million(i,2) >= X_cases)
N=N+1;
IT_cases(N,1) = IT_per_million(i,1);
IT_cases(N,2) = IT_per_million(i,2);
IT_cases(N,3) = IT_per_million(i,3);
IT_cases(N,4) = IT_per_million(i,4);
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
if (GE_per_million(i,4) >= X_deaths)
n=n+1;
GE_deaths(n,1) = GE_per_million(i,1);
GE_deaths(n,2) = GE_per_million(i,2);
GE_deaths(n,3) = GE_per_million(i,3);
GE_deaths(n,4) = GE_per_million(i,4);
end
if (GE_per_million(i,2) >= X_cases)
N=N+1;
GE_cases(N,1) = GE_per_million(i,1);
GE_cases(N,2) = GE_per_million(i,2);
GE_cases(N,3) = GE_per_million(i,3);
GE_cases(N,4) = GE_per_million(i,4);
end
end
 
% %Definindo valor maximo dos eixos, considerando todos os estados
axis_days_deaths = 70;
axis_days_cases = 80;
axis_deaths = 1000; 
axis_cases = 10000;
axis_new_deaths = 1000; 
axis_new_cases = 10000;


%Estilos e cores
%Fontes, estilos e cores
fonte_titulo = 9;
fonte_labels = 8;
fonte_padrao = 8; %numeros dos eixos
fonte_estados = 7;
 
colorUS = [0,169,74]/255;
colorFR = [0,99,181]/255;
colorIT = [254,88,52]/255;
colorSP = [209,227,105]/255;
colorGE = [135,85,30]/255;
colorBR = [0,0,0];

lineUS = '-';
lineFR = '-';
lineIT = '-';
lineSP = '-';
lineGE = '-';
lineBR = '-';
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (1);
  
[n1,n2] = size(BR_deaths);
n=n1;
days_state = 0:1:n-1;
figBR=semilogy(days_state,BR_deaths(:,4),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR);
text (n-1, BR_deaths(n,4), [' Brasil'],'FontSize',fonte_estados,"color",colorBR)

[n1,n2] = size(US_deaths);
n=n1;
days_state = 0:1:n-1;
figUS=semilogy(days_state,US_deaths(:,4))
hold on;
set(figUS,'LineWidth', 1,"color",colorUS,'DisplayName','US','Linestyle',lineUS)
text (n-1, US_deaths(n,4), [' US'],'FontSize',fonte_estados,"color",colorUS);

[n1,n2] = size(FR_deaths);
n=n1;
days_state = 0:1:n-1;
figFR=semilogy(days_state,FR_deaths(:,4))
hold on;
set(figFR,'LineWidth', 1,"color",colorFR,'DisplayName','France','Linestyle',lineFR)
text (n-1, FR_deaths(n,4), [' France'],'FontSize',fonte_estados,"color",colorFR);

[n1,n2] = size(IT_deaths);
n=n1;
days_state = 0:1:n-1;
figIT=semilogy(days_state,IT_deaths(:,4))
hold on;
set(figIT,'LineWidth', 1,"color",colorIT,'DisplayName','Italy','Linestyle',lineIT)
text (n-1, IT_deaths(n,4), [' Italy'],'FontSize',fonte_estados,"color",colorIT);

[n1,n2] = size(SP_deaths);
n=n1;
days_state = 0:1:n-1;
figSP=semilogy(days_state,SP_deaths(:,4))
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'DisplayName','Spain','Linestyle',lineSP)
text (n, SP_deaths(n,4), [' Spain'],'FontSize',fonte_estados,"color",colorSP);

[n1,n2] = size(GE_deaths);
n=n1;
days_state = 0:1:n-1;
figGE=semilogy(days_state,GE_deaths(:,4))
hold on;
set(figGE,'LineWidth', 1,"color",colorGE,'DisplayName','Germany','Linestyle',lineGE)
text (n-1, GE_deaths(n1,4), [' Germany'],'FontSize',fonte_estados,"color",colorGE);

 
set(gca,'FontSize',fonte_padrao)
title({'Letalidade da epidemia',['Países mais afetados em ',end_time]},'FontSize',fonte_titulo);
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

saveas(gcf,[name,'_letalidade_',datestr(end_time,29),'.png']);

close(figure(1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure (2);
[n1,n2] = size(BR_cases);
n=n1;
days_state = 0:1:n-1;
figBR=semilogy(days_state,BR_cases(:,2),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR)
text (n-1, BR_cases(n,2), [' Brasil'],'FontSize',fonte_estados,"color",colorBR);

[n1,n2] = size(US_cases);
n=n1;
days_state = 0:1:n-1;
figUS=semilogy(days_state,US_cases(:,2))
hold on;
set(figUS,'LineWidth', 1,"color",colorUS,'DisplayName','US','Linestyle',lineUS)
text (n-1, US_cases(n1,2), [' US'],'FontSize',fonte_estados,"color",colorUS);

[n1,n2] = size(FR_cases);
n=n1;
days_state = 0:1:n-1;
figFR=semilogy(days_state,FR_cases(:,2))
hold on;
set(figFR,'LineWidth', 1,"color",colorFR,'DisplayName','France','Linestyle',lineFR)
text (n-1, FR_cases(n1,2), [' France'],'FontSize',fonte_estados,"color",colorFR);

[n1,n2] = size(IT_cases);
n=n1;
days_state = 0:1:n-1;
figIT=semilogy(days_state,IT_cases(:,2))
hold on;
set(figIT,'LineWidth', 1,"color",colorIT,'DisplayName','Italy','Linestyle',lineIT)
text (n-1, IT_cases(n1,2), [' Italy'],'FontSize',fonte_estados,"color",colorIT);

[n1,n2] = size(SP_cases);
n=n1;
days_state = 0:1:n-1;
figSP=semilogy(days_state,SP_cases(:,2))
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'DisplayName','Spain','Linestyle',lineSP)
text (n-1, SP_cases(n1,2), [' Spain'],'FontSize',fonte_estados,"color",colorSP);

[n1,n2] = size(GE_cases);
n=n1;
days_state = 0:1:n-1;
figGE=semilogy(days_state,GE_cases(:,2))
hold on;
set(figGE,'LineWidth', 1,"color",colorGE,'DisplayName','Germany','Linestyle',lineGE)
text (n-1, GE_cases(n1,2), [' Germany'],'FontSize',fonte_estados,"color",colorGE);

set(gca,'FontSize',fonte_padrao)
title({'Contágio da epidemia',['Países mais afetados em ',end_time]},'FontSize',fonte_titulo);
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

saveas(gcf,[name,'_contagio_',datestr(end_time,29),'.png']);


close(figure(2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
figure (3);

figBR=loglog(BR_per_million_week(:,4),BR_per_million_week(:,3),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR)
text (BR_per_million_week(D,4), BR_per_million_week(D,3), [' BR'],'FontSize',fonte_estados,"color",colorBR);

figUS=loglog(US_per_million_week(:,4),US_per_million_week(:,3),'DisplayName','US')
hold on;
set(figUS,'LineWidth', 1,"color",colorUS,'Linestyle',lineUS)
text (US_per_million_week(D,4), US_per_million_week(D,3), [' US'],'FontSize',fonte_estados,"color",colorUS);

figFR=loglog(FR_per_million_week(:,4),FR_per_million_week(:,3),'DisplayName','France')
hold on;
set(figFR,'LineWidth', 1,"color",colorFR,'Linestyle',lineFR)
text (FR_per_million_week(D,4), FR_per_million_week(D,3), [' France'],'FontSize',fonte_estados,"color",colorFR);

figIT=loglog(IT_per_million_week(:,4),IT_per_million_week(:,3),'DisplayName','Italy')
hold on;
set(figIT,'LineWidth', 1,"color",colorIT,'Linestyle',lineIT)
text (IT_per_million_week(D,4), IT_per_million_week(D,3), [' Italy'],'FontSize',fonte_estados,"color",colorIT);

figSP=loglog(SP_per_million_week(:,4),SP_per_million_week(:,3),'DisplayName','Spain')
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'Linestyle',lineSP)
text (SP_per_million_week(D,4), SP_per_million_week(D,3), [' Spain'],'FontSize',fonte_estados,"color",colorSP);

figGE=loglog(GE_per_million_week(:,4),GE_per_million_week(:,3),'DisplayName','Germany')
hold on;
set(figGE,'LineWidth', 1,"color",colorGE,'Linestyle',lineGE)
text (GE_per_million_week(D,4), GE_per_million_week(D,3), [' Germany'],'FontSize',fonte_estados,"color",colorGE);


set(gca,'FontSize',fonte_padrao);
title({'Informativo de progresso da epidemia (número de mortes)',['Países mais afetados em ',end_time]},'FontSize',fonte_titulo)
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

saveas(gcf,[name,'_informativo-mortes_',datestr(end_time,29),'.png']);


close(figure(3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos (por milhao de hab.)
figure (4);


figBR=loglog(BR_per_million_week(:,2),BR_per_million_week(:,1),'DisplayName','Brasil')
hold on;
set(figBR,'LineWidth', 1,"color",colorBR,'Linestyle',lineBR)
text (BR_per_million_week(D,2), BR_per_million_week(D,1), [' Brasil'],'FontSize',fonte_estados,"color",colorBR);

figUS=loglog(US_per_million_week(:,2),US_per_million_week(:,1),'DisplayName','US')
hold on;
set(figUS,'LineWidth', 1,"color",colorUS,'Linestyle',lineUS)
text (US_per_million_week(D,2), US_per_million_week(D,1), [' US'],'FontSize',fonte_estados,"color",colorUS);

figFR=loglog(FR_per_million_week(:,2),FR_per_million_week(:,1),'DisplayName','France')
hold on;
set(figFR,'LineWidth', 1,"color",colorFR,'Linestyle',lineFR)
text (FR_per_million_week(D,2), FR_per_million_week(D,1), [' France'],'FontSize',fonte_estados,"color",colorFR);

figIT=loglog(IT_per_million_week(:,2),IT_per_million_week(:,1),'DisplayName','Italy')
hold on;
set(figIT,'LineWidth', 1,"color",colorIT,'Linestyle',lineIT)
text (IT_per_million_week(D,2), IT_per_million_week(D,1), [' Italy'],'FontSize',fonte_estados,"color",colorIT);

figSP=loglog(SP_per_million_week(:,2),SP_per_million_week(:,1),'DisplayName','Spain')
hold on;
set(figSP,'LineWidth', 1,"color",colorSP,'Linestyle',lineSP)
text (SP_per_million_week(D,2), SP_per_million_week(D,1), [' Spain'],'FontSize',fonte_estados,"color",colorSP);

figGE=loglog(GE_per_million_week(:,2),GE_per_million_week(:,1),'DisplayName','Germany')
hold on;
set(figGE,'LineWidth', 1,"color",colorGE,'Linestyle',lineGE)
text (GE_per_million_week(D,2), GE_per_million_week(D,1), [' Germany'],'FontSize',fonte_estados,"color",colorGE);


set(gca,'FontSize',fonte_padrao);
title({'Informativo de progresso da epidemia (número de casos)',['Países mais afetados em ',end_time]},'FontSize',fonte_titulo);
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

saveas(gcf,[name,'_informativo-casos_',datestr(end_time,29),'.png']);


close(figure(4));

    
    
        
