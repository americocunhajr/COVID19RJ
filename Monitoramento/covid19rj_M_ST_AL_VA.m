%=======================================================================%
%                             COVID-19                                  %
%                      OBSERVATÓRIO FLUMINENSE                          %
%                         www.covid19rj.org                             %
%                                                                       %
%                  - COVID-19 EM DIVERSOS PAÍSES  -                     %
%                                                                       %
% Este algoritmo gera gráficos sobre os números de casos e mortes por   %
% Covid-19 nos países de interesse.                                     %
%                                                                       %
% A série de gráficos contém:                                           %
% - número de casos em relação ao tempo desde 1000 casos                %
% - número de mortes em relação ao tempo desde 100 mortes               %
% - número de Casos por semana em relação ao total de casos       %
% - número de Mortes por semana em relação ao total de mortes     %
%                                                                       %
% Você precisará do arquivo "owid-covid-data.csv" encontrados em        %
% https://ourworldindata.org/coronavirus-source-data                    %
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

%nome que aparece nos arquivos
name = 'AL';

% fullURL = ['https://covid.ourworldindata.org/data/owid-covid-data.csv'];
% filename = 'owid-covid-data.csv';
% urlwrite(fullURL,[pwd '/Dados/',filename]);
% 
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
% filename = 'cases-brazil-states.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

%Lendo o arquivo disponível no site 
all_data = readtable([pwd,'/Dados/owid-covid-data.csv']);
data = [all_data.total_cases,all_data.new_cases,all_data.total_deaths,all_data.new_deaths,all_data.total_cases_per_million,all_data.new_cases_per_million,all_data.total_deaths_per_million,all_data.new_deaths_per_million];

%Lendo o arquivo do Brasil
popBR = 212.559409;
BR_all_data = readtable([pwd,'/Dados/cases-brazil-states.txt']);
BR_data = [BR_all_data.totalCases,BR_all_data.newCases,BR_all_data.deaths,BR_all_data.newDeaths,BR_all_data.totalCases/popBR,BR_all_data.newCases/popBR,BR_all_data.deaths/popBR,BR_all_data.newDeaths/popBR];



%plot_type é pra diferenciar mortes e casos pra organizarmos a ordem da legenda de acordo com o número de mortes ou de casos
for( plot_type = 1:1:2)
%loop nos 13 países estudados
for( init = 1:1:15)

clearvars -except plot_type init all_data data name BR_all_data BR_data

%espessura da linha no plot
linew = 1.25;

if (plot_type == 1)
%ordem por países que tem mais morte
if (init == 1) country = 'Brazil'; color = [0,0,0]/255; linew = 1.75; end
if (init == 3) country = 'Peru'; color = [181,147,87]/255; end
if (init == 5) country = 'Chile'; color = [248,187,208]/255; end
if (init == 4) country = 'Ecuador'; color = [69,169,0]/255; end
if (init == 6) country = 'Colombia'; color = [96,209,224]/255; end  
if (init == 7) country = 'Argentina'; color = [255,130,113]/255; end
if (init == 8) country = 'Bolivia'; color = [209,227,105]/255; end
if (init == 15) country = 'Paraguay'; color = [0,104,44]/255; end
if (init == 13) country = 'Uruguay'; color = [0,45,135]/255; end
if (init == 12) country = 'Venezuela'; color = [135,85,30]/255; end
if (init == 2) country = 'Mexico'; color = [203,63,23]/255; end
if (init == 11) country = 'Cuba'; color = [191,171,72]/255; end
if (init == 9) country = 'Dominican Republic'; color = [236,64,122]/255; end
if (init == 10) country = 'Panama'; color = [0.4,0.4,0.4]; end
if (init == 14) country = 'Costa Rica'; color = [0,0.5,0.6]; end

if strcmp(country, 'Brazil')
    location = BR_data(find(strcmp([BR_all_data.state], 'TOTAL')),1:8);
    dates = BR_all_data.date(find(strcmp([BR_all_data.state],'TOTAL')),:);
end_time = max(datenum(dates));
else
    location = data(find(strcmp([all_data.location], country)),1:8);
    dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;
end

if strcmp(country, 'Brazil') country = 'Brasil           '; end 
if strcmp(country, 'Peru') country = 'Peru               '; end
if strcmp(country, 'Chile') country = 'Chile               '; end 
if strcmp(country, 'Ecuador') country = 'Equador         '; end 
if strcmp(country, 'Colombia') country = 'Colômbia        '; end 
if strcmp(country, 'Argentina') country = 'Argentina         '; end 
if strcmp(country, 'Bolivia') country = 'Bolívia              '; end 
if strcmp(country, 'Paraguay') country = 'Paraguai             '; end 
if strcmp(country, 'Uruguay') country = 'Uruguai              '; end 
if strcmp(country, 'Venezuela') country = 'Venezuela          '; end 
if strcmp(country, 'Mexico') country = 'México         '; end 
if strcmp(country, 'Cuba') country = 'Cuba                  '; end 
if strcmp(country, 'Dominican Republic') country = 'R. Dominicana '; end 
if strcmp(country, 'Panama') country = 'Panamá            '; end 
if strcmp(country, 'Costa Rica') country = 'Costa Rica          '; end 

end

if (plot_type == 2)
%ordem por países que tem mais caso
if (init == 1) country = 'Brazil'; color = [0,0,0]/255; linew = 1.75; end
if (init == 2) country = 'Peru'; color = [181,147,87]/255; end
if (init == 3) country = 'Chile'; color = [248,187,208]/255; end
if (init == 6) country = 'Ecuador'; color = [69,169,0]/255; end
if (init == 5) country = 'Colombia'; color = [96,209,224]/255; end  
if (init == 7) country = 'Argentina'; color = [255,130,113]/255; end
if (init == 10) country = 'Bolivia'; color = [209,227,105]/255; end
if (init == 14) country = 'Paraguay'; color = [0,104,44]/255; end
if (init == 15) country = 'Uruguay'; color = [0,45,135]/255; end
if (init == 11) country = 'Venezuela'; color = [135,85,30]/255; end
if (init == 4) country = 'Mexico'; color = [203,63,23]/255; end
if (init == 12) country = 'Cuba'; color = [191,171,72]/255; end
if (init == 8) country = 'Dominican Republic'; color = [236,64,122]/255; end
if (init == 9) country = 'Panama'; color = [0.4,0.4,0.4]; end
if (init == 13) country = 'Costa Rica'; color = [0,0.5,0.6]; end

if strcmp(country, 'Brazil')
    location = BR_data(find(strcmp([BR_all_data.state], 'TOTAL')),1:8);
    dates = BR_all_data.date(find(strcmp([BR_all_data.state],'TOTAL')),:);
end_time = max(datenum(dates));
else
    location = data(find(strcmp([all_data.location], country)),1:8);
    dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;
end

if strcmp(country, 'Brazil') country = 'Brasil           '; end 
if strcmp(country, 'Peru') country = 'Peru             '; end
if strcmp(country, 'Chile') country = 'Chile            '; end 
if strcmp(country, 'Ecuador') country = 'Equador         '; end 
if strcmp(country, 'Colombia') country = 'Colômbia        '; end 
if strcmp(country, 'Argentina') country = 'Argentina        '; end 
if strcmp(country, 'Bolivia') country = 'Bolívia             '; end 
if strcmp(country, 'Paraguay') country = 'Paraguai            '; end 
if strcmp(country, 'Uruguay') country = 'Uruguai               '; end 
if strcmp(country, 'Venezuela') country = 'Venezuela         '; end 
if strcmp(country, 'Mexico') country = 'México         '; end 
if strcmp(country, 'Cuba') country = 'Cuba                 '; end 
if strcmp(country, 'Dominican Republic') country = 'R. Dominicana'; end 
if strcmp(country, 'Panama') country = 'Panamá           '; end 
if strcmp(country, 'Costa Rica') country = 'Costa Rica         '; end 

end




tot_cases = location(:,1);
new_cases = location(:,2);
tot_deaths = location(:,3);
new_deaths = location(:,4);

tot_cases_pm = location(:,5);
new_cases_pm = location(:,6);
tot_deaths_pm = location(:,7);
new_deaths_pm = location(:,8);

%consolidando os Casos e mortes por semana
new_cases7 = new_cases;
for (i=7:1:max(max(size(dates))) ) 
new_cases7(i,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(i,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
new_cases7_pm(i,1) = new_cases_pm(i,1)+new_cases_pm(i-1,1)+new_cases_pm(i-2,1)+new_cases_pm(i-3,1)+new_cases_pm(i-4,1)+new_cases_pm(i-5,1)+new_cases_pm(i-6,1);
new_deaths7_pm(i,1) = new_deaths_pm(i,1)+new_deaths_pm(i-1,1)+new_deaths_pm(i-2,1)+new_deaths_pm(i-3,1)+new_deaths_pm(i-4,1)+new_deaths_pm(i-5,1)+new_deaths_pm(i-6,1);
end

%Criando vetores desde dia zero a partir de X mortes ("_deaths") ou a partir de X casos ("_cases")
%Usuário define dia zero para casos ou mortes
X_deaths_pm = 0.1;
X_cases_pm = 1;
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

day_axis = 140;

Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

if (plot_type == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes por tempo (dia zero definido por mortes)
figure (1);

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
x1(i+1) = 5*i;
x2(i+1) = 6*i;
x3(i+1) = 7*i;
x4(i+1) = 8*i;
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
 fig=semilogy(days,tot_deaths_X,'DisplayName',[country,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_deaths_X(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

tot_mortes(init,1) = max(tot_deaths);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Mortes X total de mortes (por milhao de hab.)
figure (3);

grid1=loglog([1,1000000],10*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,1000000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=loglog([1,1000000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid33=loglog([1,1000000],10000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid4=loglog(10*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(100*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid6=loglog(1000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid7=loglog(10000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid77=loglog(100000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
 
 %Tirando os zeros de Mortes
 new_deaths7w0 = new_deaths7;
 tot_deathsw0 = tot_deaths;
  pos0 = new_deaths7(:,1) <= 0;
 tot_deathsw0(pos0,:) = [];
 new_deaths7w0(pos0,:) = [];
 n = max(max(size(tot_deaths)));
 
 n = max(max(size(tot_deathsw0)));

 if strcmp(country, 'Costa Rica          ') new_deaths7w0 = zeros(n,1); end
 if strcmp(country, 'Paraguai             ') new_deaths7w0 = zeros(n,1); end
 if strcmp(country, 'Venezuela          ') new_deaths7w0 = zeros(n,1); end
 if strcmp(country, 'Uruguai              ') new_deaths7w0 = zeros(n,1); end

 fig=loglog(tot_deathsw0,new_deaths7w0,'DisplayName',[country,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_deathsw0(n,1), new_deaths7w0(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

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

% %Linhas "dobram"
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

 n = max(max(size(new_deaths7_X)));
  if strcmp(country, 'Costa Rica          ') new_deaths7_X = zeros(n,1); end
 if strcmp(country, 'Paraguai             ') new_deaths7_X = zeros(n,1); end
 if strcmp(country, 'Venezuela          ') new_deaths7_X = zeros(n,1); end
 if strcmp(country, 'Uruguai              ') new_deaths7_X = zeros(n,1); end
 days = 0:1:n-1;
 fig=semilogy(days,new_deaths7_X/7,'DisplayName',[country,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_deaths7_X(n,1)/7, [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

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
grid4=semilogy(0:1:(day_axis-1),1000000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
y_init=100;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 5*i;
x2(i+1) = 6*i;
x3(i+1) = 7*i;
x4(i+1) = 8*i;
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
 fig=semilogy(days,tot_cases_X,'DisplayName',[country,'  ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_cases_X(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos X total de casos (por milhao de hab.)
figure (4);

grid1=loglog([1,10000000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,10000000],10000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=loglog([1,10000000],100000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid4=loglog(1000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(10000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid6=loglog(100000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid7=loglog(1000000*(ones(2, 1)),[1,1000000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Casos
 new_cases7w0 = new_cases7;
 tot_casesw0 = tot_cases;
  pos0 = new_cases7(:,1) <= 0;
 tot_casesw0(pos0,:) = [];
 new_cases7w0(pos0,:) = [];
 
 n = max(max(size(tot_casesw0)));
   if strcmp(country, 'Equador         ') new_cases7w0 = zeros(n,1); end
 fig=loglog(tot_casesw0,new_cases7w0,'DisplayName',[country,'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_casesw0(n,1), new_cases7w0(n,1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

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

% %Linhas "dobram"
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


 
 n = max(max(size(new_cases7_X)));
    if strcmp(country, 'Equador         ') new_cases7_X = zeros(n,1); end
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
title({'Mortalidade da epidemia',['América Latina em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=10;
max_y=100000;
ang = 56;
h1=text(63.5,0.9*max_y,'números dobram a cada 5 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 50;
h2=text(76.9,0.9*max_y,'6 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 45;
h3=text(90,0.9*max_y,'7 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 42;
h4=text(103,0.9*max_y,'8 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k','1M'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


axis([0 day_axis y_init max_y]);
Pos = [250,250,600,450];




% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.15], .2,.15,]);
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
title({'Contágio da epidemia',['América Latina em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos'],'FontSize',fonte_labels);
ylabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=100;
max_y=10000000;
ang = 50;
h1=text(80,0.9*max_y,'números dobram a cada 5 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 46;
h2=text(96.5,0.9*max_y,'6 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 42;
h3=text(112.8,0.9*max_y,'7 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 39;
h4=text(129.1,0.9*max_y,'8 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'100','1k','10k','100k','1M','10M'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 day_axis y_init max_y]);
Pos = [250,250,600,450];

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.15], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de mortes)',['América Latina em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Mortes por semana'],'FontSize',fonte_labels);
xlabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 1000000;
max_y = 100000;
axis([1 max_x 1 max_y]);

set(gca,'YTickLabel',{'1','10','100','1k','10k','100k'})
set(gca,'XTickLabel',{'1','10','100','1k','10k','100k','1M'})

hfonte=text(max_x,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

dim = [0.705 0.035 0.8 0.2];
str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados ainda não seguem um padrão,','resultando em curvas de difícil análise.'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.15], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de casos)',['América Latina em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Novos casos por semana'],'FontSize',fonte_labels);
xlabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 10000000;
max_y = 1000000;
axis([100 max_x 100 max_y]);

set(gca,'YTickLabel',{'100','1k','10k','100k','1M'})
set(gca,'XTickLabel',{'100','1k','10k','100k','1M','10M'})

hfonte=text(max_x,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

dim = [0.705 0.035 0.8 0.2];
str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados não foram atualizados continuamente,','resultando em curvas de difícil análise.'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.15], .2,.15,]);
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
title({'Mortalidade diária da epidemia',['América Latina em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes']},'FontSize',fonte_labels);
ylabel ({'Mortes diárias','(Média móvel de 7 dias)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=1;
max_y=10000;
% ang = 52;
% h1=text(46.7,0.8*max_y,'números dobram a cada 5 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 45;
% h2=text(56.1,0.8*max_y,'6 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 39.5;
% h3=text(66,0.8*max_y,'7 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 33.5;
% h4=text(75.9,0.8*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k','10k','100k','1M'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 day_axis y_init max_y]);

dim = [0.705 0.035 0.8 0.2];
str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados ainda não seguem um padrão,','resultando em curvas de difícil análise.'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.15], .2,.15,]);
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
title({'Contágio diário da epidemia',['América Latina em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases),' casos']},'FontSize',fonte_labels);
ylabel ({'Casos por dia','(Média móvel de 7 dias)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
y_init=1;
max_y=100000;
% ang = 45;
% h1=text(63.5,0.8*max_y,'números dobram a cada 5 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 39.5;
% h2=text(75.8,0.8*max_y,'6 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 35;
% h3=text(89.5,0.8*max_y,'7 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 30;
% h4=text(102,0.8*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k','10k','100k','1M'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 day_axis y_init max_y]);

dim = [0.705 0.035 0.8 0.2];
str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados não foram atualizados continuamente,','resultando em curvas de difícil análise.'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.15], .2,.15,]);
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

close all

copyfile( [pwd '/Dados/owid-covid-data.csv'], [pwd '/',outputdir,'/owid-covid-data.csv']);

