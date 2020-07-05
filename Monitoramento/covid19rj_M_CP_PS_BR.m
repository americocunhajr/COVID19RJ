clc;
clear all;
close all;

%nome que aparece nos arquivos
name = 'BR';


% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
% filename = 'cases-brazil-states.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

%Lendo o arquivo do Brasil
popBR = 212.559409;
table = readtable([pwd,'/Dados/cases-brazil-states.txt']);

Pos = [0,500,900,750];
set(0, 'DefaultFigurePosition', Pos);




for (init=1:1:28)

clearvars -except plot_type init all_data data name table
r = [255, 0, 0 ]/255;
y = [255, 225, 0]/255;
g = [0, 125, 0]/255; 
if (init == 1) country = 'AC'; color = y; end
if (init == 4) country = 'AM'; color = y;  end
if (init == 3) country = 'AP'; color = r;  end
if (init == 14) country = 'PA'; color = r;  end
if (init == 22) country = 'RO'; color = r; end  
if (init == 23) country = 'RR'; color = r; end
if (init == 27) country = 'TO'; color = r; end
if (init == 2) country = 'AL'; color = r; end
if (init == 5) country = 'BA'; color = r; end
if (init == 6) country = 'CE'; color = r; end
if (init == 10) country = 'MA'; color = r; end
if (init == 15) country = 'PB'; color = r; end
if (init == 17) country = 'PE'; color = y; end
if (init == 18) country = 'PI'; color = r; end
if (init == 20) country = 'RN'; color = r; end
if (init == 26) country = 'SE'; color = r; end
if (init == 7) country = 'DF'; color = r; end
if (init == 9) country = 'GO'; color = r; end
if (init == 12) country = 'MS'; color = r; end
if (init == 11) country = 'MT'; color = r; end
if (init == 8) country = 'ES'; color = r; end
if (init == 13) country = 'MG'; color = r; end
if (init == 19) country = 'RJ'; color = r; end
if (init == 25) country = 'SP'; color = r; end
if (init == 16) country = 'PR'; color = r; end
if (init == 21) country = 'RS'; color = r; end
if (init == 24) country = 'SC'; color = r; end
if (init == 28) country = 'TOTAL'; color = r; end

%Definindo os números de casos e mortes
tot_cases = table.totalCases(find(strcmp([table.state],country)),:);
new_cases = table.newCases(find(strcmp([table.state],country)),:);
tot_deaths = table.deaths(find(strcmp([table.state],country)),:);
new_deaths = table.newDeaths(find(strcmp([table.state],country)),:);
recovered = table.recovered(find(strcmp([table.state],country)),:);
recovered(isnan(recovered))=0;
active_cases = tot_cases-recovered - tot_deaths;

dates = table.date(find(strcmp([table.state],country)),:);
end_time = max(datenum(dates));

if strcmp(country, 'TOTAL') country = 'Brasil'; end



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
for (i=1:1:max(max(size(dates))) )
if (tot_deaths(i,1) >= X_deaths)
n=n+1;
tot_deaths_X(n,1) = tot_deaths(i,1);
new_deaths_X(n,1) = new_deaths(i,1);
new_deaths7_X(n,1) = new_deaths7(i,1);
dates_deaths(n,1) = dates(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_cases(i,1) >= X_cases)
n=n+1;
tot_cases_X(n,1) = tot_cases(i,1);
new_cases_X(n,1) = new_cases(i,1);
new_cases7_X(n,1) = new_cases7(i,1);
active_cases_X(n,1) = active_cases(i,1);
recovered_X(n,1) = recovered(i,1);
dates_cases(n,1) = dates(i,1);
end
end

% aux = dctmtx(length(new_cases7_X))*new_cases7_X
% evens=aux(mod(aux,2)==0);
% odds=aux(mod(aux,2)~=0);
% sum_evens = sum(evens);
% sum_odds = sum(odds);


figure(1)

color = r;
if (new_cases7_X(length(new_cases7_X)) < 0.5 * max(new_cases7_X)) color = y; end
if (new_cases7_X(length(new_cases7_X)) < 0.2 * max(new_cases7_X)) color = g; end


subplot(4,7,init)
plot(dates_cases,new_cases7_X,'linewidth',2,'color',color)

yticks([])

xlim([dates_cases(1,1) dates_cases(length(dates_cases),1)]);
set(gca, 'XTick', linspace(dates_cases(1,1),datestr(end_time),3))
set(gca,'FontSize',6.5);
datetick('x',19,'keepticks')

title({[country]},'FontSize',11);

xlabel({['Total de casos: ',num2str(max(tot_cases))],' '},'FontSize', 6.5);

figure(2)

color = r;
if (new_deaths7_X(length(new_deaths7_X)) < 0.5 * max(new_deaths7_X)) color = y; end
if (new_deaths7_X(length(new_deaths7_X)) < 0.2 * max(new_deaths7_X)) color = g; end

subplot(4,7,init)
plot(dates_deaths,new_deaths7_X,'linewidth',2,'color',color)

yticks([])

xlim([dates_deaths(1,1) dates_deaths(length(dates_deaths),1)]);
set(gca, 'XTick', linspace(dates_deaths(1,1),datestr(end_time),3));
set(gca,'FontSize',6.5);
datetick('x',19,'keepticks')

title({[country]},'FontSize',11);

xlabel(['Total de mortes: ',num2str(max(tot_deaths))],'FontSize', 6.5);

figure(3)

color = r;
if (active_cases_X(length(active_cases_X)) < 0.5 * max(active_cases_X)) color = y; end
if (active_cases_X(length(active_cases_X)) < 0.2 * max(active_cases_X)) color = g; end


subplot(4,7,init)
plot(dates_cases,active_cases_X,'linewidth',2,'color',color)

yticks([])

xlim([dates_cases(1,1) dates_cases(length(dates_cases),1)]);
set(gca, 'XTick', linspace(dates_cases(1,1),datestr(end_time),3))
set(gca,'FontSize',6.5);
datetick('x',19,'keepticks')

title({[country]},'FontSize',11);

xlabel({['Casos ativos: ',num2str(max(active_cases))],' '},'FontSize', 6.5);
% 
% figure(4)
% 
% color = r;
% if (recovered_X(length(recovered_X)) < 0.5 * max(recovered_X)) color = y; end
% if (recovered_X(length(recovered_X)) < 0.2 * max(recovered_X)) color = g; end
% 
% 
% subplot(4,7,init)
% plot(dates_cases,recovered_X,'linewidth',2,'color',color)
% 
% yticks([])
% 
% xlim([dates_cases(1,1) dates_cases(length(dates_cases),1)]);
% set(gca, 'XTick', linspace(dates_cases(1,1),datestr(end_time),3))
% set(gca,'FontSize',6.5);
% datetick('x',19,'keepticks')
% 
% title({[country]},'FontSize',11);
% 
% xlabel({['Casos ativos: ',num2str(max(active_cases))],' '},'FontSize', 6.5);

end


figure(1)
sgtitle({'Brasil enfrentando a Covid-19',datestr(end_time,24),' ','Comparação da curva de novos casos por semana'})

hold on;
hfonte=text(max(dates)+80,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://covid19br.wcota.me/'});
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.62 -0.07], .2,.11,]);
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

hold on;

ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.05 -0.2], .16,.09,]);
[x, map]=imread('legenda.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

figure(2)
sgtitle({'Brasil enfrentando a Covid-19',datestr(end_time,24),' ','Comparação da curva de novas mortes por semana'})

hold on;
hfonte=text(max(dates)+80,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://covid19br.wcota.me/'});
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.62 -0.07], .2,.11,]);
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
ha2=axes('position',[haPos([3 1])-[-0.05 -0.2], .16,.09,]);
[x, map]=imread('legenda.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')



figure(3)
sgtitle({'Brasil enfrentando a Covid-19',datestr(end_time,24),' ','Comparação da curva de casos ativos'})


hold on;
hfonte=text(max(dates)+80,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://covid19br.wcota.me/','Casos ativos são calculados pela subtração da soma de recuperados e óbitos dos casos acumulados.','O estado de Goiás ainda não forneceu dados sobre recuperados.'});
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.62 -0.07], .2,.11,]);
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

hold on;

ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.05 -0.2], .16,.09,]);
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
%Controle do github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NC_PS_NA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 

print(figure(2),[pwd '/upload/',name,'/covid19rj_M_CP_NM_PS_NA_',name,'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NM_PS_NA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 

print(figure(3),[pwd '/upload/',name,'/covid19rj_M_CP_AT_AC_NA_',name,'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_AT_AC_NA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 


% close all




