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

Pos = [0,250,900,750];
set(0, 'DefaultFigurePosition', Pos);




for (init=1:1:15)

clearvars -except plot_type init all_data data name BR_all_data BR_data
r = [255, 0, 0 ]/255;
y = [255, 225, 0]/255;
g = [0, 125, 0]/255; 
if (init == 1) country = 'Argentina'; color = r; pais = 'Argentina'; end
if (init == 2) country = 'Bolivia'; color = r; pais = 'Bolívia'; end
if (init == 3) country = 'Brazil'; color = r; pais = 'Brasil'; end
if (init == 4) country = 'Chile'; color = r; pais = 'Chile'; end
if (init == 5) country = 'Colombia'; color = r; pais = 'Colômbia'; end  
if (init == 6) country = 'Costa Rica'; color = r; pais = 'Costa Rica'; end
if (init == 7) country = 'Cuba'; color = y; pais = 'Cuba';end
if (init == 8) country = 'Ecuador'; color = y; pais = 'Equador'; end
if (init == 9) country = 'Mexico'; color = r; pais = 'México'; end
if (init == 10) country = 'Panama'; color = r; pais = 'Panamá'; end
if (init == 11) country = 'Paraguay'; color = y; pais = 'Paraguai'; end
if (init == 12) country = 'Peru'; color = r; pais = 'Peru'; end
if (init == 13) country = 'Dominican Republic'; color = r; pais = 'República Dominicana'; end
if (init == 14) country = 'Uruguay'; color = y; pais = 'Uruguai'; end
if (init == 15) country = 'Venezuela'; color = r; pais = 'Venezuela'; end


if strcmp(country, 'Brazil')
    location = BR_data(find(strcmp([BR_all_data.state], 'TOTAL')),1:8);
    dates = BR_all_data.date(find(strcmp([BR_all_data.state],'TOTAL')),:);
end_time = max(datenum(dates));
else
    location = data(find(strcmp([all_data.location], country)),1:8);
    dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;
end

tot_cases = location(:,1);
new_cases = location(:,2);
tot_deaths = location(:,3);
new_deaths = location(:,4);

%consolidando os novos casos e mortes por semana
for (i=7:1:max(max(size(dates))) ) 
new_cases7(i,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(i,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
end

%Criando vetores desde dia zero a partir de X mortes ("_deaths") ou a partir de X casos ("_cases")
%Usuário define dia zero para casos ou mortes
X_deaths = 1;
X_cases = 1;

n=0;
for (i=2:1:max(max(size(dates))) )
if (tot_deaths(i,1) >= X_deaths)
n=n+1;
tot_deaths_X(n,1) = tot_deaths(i,1);
new_deaths_X(n,1) = new_deaths(i,1);
new_deaths7_X(n,1) = new_deaths7(i,1);
    if strcmp(country, 'Brazil')
       dates_deaths(n,1) = dates(i,1);
    else
        dates_deaths(n,1) = dates(i-1,1);
    end
end
end
n=0;
for (i=2:1:max(max(size(dates))) )
if (tot_cases(i,1) >= X_cases)
n=n+1;
tot_cases_X(n,1) = tot_cases(i,1);
new_cases_X(n,1) = new_cases(i,1);
new_cases7_X(n,1) = new_cases7(i,1);
    if strcmp(country, 'Brazil')
       dates_cases(n,1) = dates(i,1);
    else
        dates_cases(n,1) = dates(i-1,1);
    end
end
end

figure(1)

color = r;
if (new_cases7_X(length(new_cases7_X)) < 0.5 * max(new_cases7_X)) color = y; end
if (new_cases7_X(length(new_cases7_X)) < 0.2 * max(new_cases7_X)) color = g; end

subplot(4,4,init)
plot(dates_cases,new_cases7_X,'linewidth',2,'color',color)

yticks([])

xlim([dates_cases(1,1) dates_cases(length(dates_cases),1)]);
set(gca, 'XTick', linspace(dates_cases(1,1),dates_cases(length(dates_cases),1),4))
set(gca,'FontSize',8);
datetick('x',19,'keepticks')

title({[pais]},'FontSize',11);

xlabel({['Total de casos: ',num2str(max(tot_cases))],' '});

figure(2)

color = r;
if (new_deaths7_X(length(new_deaths7_X)) < 0.5 * max(new_deaths7_X)) color = y; end
if (new_deaths7_X(length(new_deaths7_X)) < 0.2 * max(new_deaths7_X)) color = g; end

subplot(4,4,init)
plot(dates_deaths,new_deaths7_X,'linewidth',2,'color',color)

yticks([])

xlim([dates_deaths(1,1) dates_deaths(length(dates_deaths),1)]);
set(gca, 'XTick', linspace(dates_deaths(1,1),dates_deaths(length(dates_deaths),1),4))
set(gca,'FontSize',8);
datetick('x',19,'keepticks')

title({[pais]},'FontSize',11);

xlabel(['Total de mortes: ',num2str(max(tot_deaths))]);
end


figure(1)
sgtitle({'América Latina enfrentando o COVID-19',datestr(end_time,24),' ','Comparação do número de novos casos por semana'})

hold on;
hfonte=text(max(dates)+165,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://ourworldindata.org/coronavirus-source-data'});
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.58 -0.33], .18,.1,]);
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[0.02 -0.55], .14,.08,]);
[x, map]=imread('legenda.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')


figure(2)
sgtitle({'América Latina enfrentando o COVID-19',datestr(end_time,24),' ','Comparação do número de novas mortes por semana'})

hold on;
hfonte=text(max(dates)+135,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://ourworldindata.org/coronavirus-source-data'});
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.58 -0.33], .18,.1,]);
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[0.02 -0.55], .14,.08,]);
[x, map]=imread('legenda.png');
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
print(figure(1),[pwd '/upload/',name,'/covid19rj_M_CP_NC_PS_NA_',name,'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/upload/',name,'/covid19rj_M_CP_NM_PS_NA_',name,'.png'],'-dpng','-r400'); 

%Controle do github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NC_PS_NA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NM_PS_NA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 




close all


