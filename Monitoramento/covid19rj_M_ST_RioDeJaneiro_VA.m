clear all;
clc;
close all;

colors = [
0.609999999999973   0   0
0.689999999999979   0   0
0.769999999999985   0   0
0.84999999999999    0   0
0.929999999999996   0   0
1   0   0
1   0.09    0
1   0.17    0
1   0.25    0
1   0.33    0
1   0.41    0
1   0.49    0
1   0.57    0
1   0.65    0
1   0.73    0
1   0.81    0
1   0.89    0
1   0.97    0
0.950000000000001   1   0.05
0.87    1   0.13
0.79    1   0.21
0.71    1   0.29
0.63    1   0.37
0.55    1   0.45
0.476   0.988   0.53
0.412   0.956   0.61
0.348   0.924   0.69
0.284   0.892   0.77
0.22    0.86    0.85
0.156   0.828   0.93
    0.1 0.8 1
];

%Lendo o arquivo disponível no site 
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities-time.csv'];
% filename = 'cases-brazil-cities-time.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

table = readtable([pwd,'/Dados/cases-brazil-cities-time.csv']);


all_dates = table.date;

Data = table(table.date == (all_dates(length(all_dates))), :);
    indices = (find(strcmp([Data.city],'CASO SEM LOCALIZAÇÃO DEFINIDA/RJ')));
    Data(indices,:) = [];

deaths = Data.deaths(find(strcmp([Data.state],'RJ')),:);
cities = Data.city(find(strcmp([Data.state],'RJ')),:);


[E,index] = sortrows(deaths,'descend');
cities_order = cities(index);

%nome dos arquivos que serão salvos
name = 'RJ';

%Separei em dois tipos de plot pra organizar em ordem de mais mortes (tipo 1) e mais casos (tipo 2)

for( init = 1:1:30)
      
clearvars -except plot_type init table data name colors cities_order

if (init == 0) city = 'Três Rios/RJ'; color = [0,1,0]; cityprint = sprintf('%.0f',init); 
else
city = cities_order(init); color = colors(init,:); cityprint = sprintf('%.0f',init);
end

% if (init == 30) city = 'Rio de Janeiro/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 29) city = 'Duque de Caxias/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 28) city = 'São Gonçalo/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 27) city = 'Nova Iguaçu/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 26) city = 'São João de Meriti/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 25) city = 'Niterói/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 24) city = 'Belford Roxo/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 23) city = 'Magé/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 22) city = 'Itaboraí/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 21) city = 'Mesquita/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 20) city = 'Petrópolis/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 19) city = 'Campos dos Goytacazes/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 18) city = 'Angra dos Reis/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 17) city = 'Itaguaí/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 16) city = 'Macaé/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 15) city = 'Nilópolis/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 14) city = 'Volta Redonda/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 13) city = 'Maricá/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 12) city = 'Teresópolis/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 11) city = 'Araruama/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 10) city = 'Guapimirim/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 9) city = 'Cabo Frio/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 8) city = 'Nova Friburgo/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 7) city = 'Barra Mansa/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 6) city = 'Queimados/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 5) city = 'Rio das Ostras/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 4) city = 'Tanguá/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 3) city = 'Barra do Piraí/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 2) city = 'Seropédica/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end
% if (init == 1) city = 'Mangaratiba/RJ'; color = colors(init,:); cityprint = sprintf('%.0f',init); end


dates = table.date(find(strcmp([table.city],city)),:);
end_time = max(datenum(dates));

dia = dates(length(dates),1);
tend = dia + days(7);
numdays = datenum(tend) - datenum({'11/03/20'},'dd/mm/yy');
weeks = round(numdays / 7)
if (rem(weeks, 2) ~= 0)
    weeks = weeks + 1;
end
tstart = tend - days(weeks * 7)

%Definindo os números de casos e mortes
tot_cases = table.totalCases(find(strcmp([table.city],city)),:);
new_cases = table.newCases(find(strcmp([table.city],city)),:);
tot_deaths = table.deaths(find(strcmp([table.city],city)),:);
new_deaths = table.newDeaths(find(strcmp([table.city],city)),:);

%consolidando os Casos e mortes por semana
for (i=length(dates):-7:7)  
j=round(i/7)
new_cases7(j,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(j,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
dates7(j,1) = dates(i,1);
end

Pos = [0,250,900,600];
set(0, 'DefaultFigurePosition', Pos);

%Fontes
fonte_titulo = 10;
fonte_labels = 9;
fonte_padrao = 8; %numeros dos eixos
fonte_location = 9;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes por tempo (dia zero definido por mortes)
figure (1);

sgtitle({'',[char(city),' em ',datestr(end_time,24)],''})

subplot(2,2,3)

 fig=plot(dates,tot_deaths,'DisplayName',[char(city),'  ',num2str(tot_deaths(max(size(tot_deaths)),1)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
%  text (max(dates), tot_deaths(length(tot_deaths)), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas de mortes por tempo (dia zero definido por mortes/milhao)
subplot(2,2,4)


 fig=bar(dates7,new_deaths7,"FaceColor",color,"EdgeColor",'none');
 hold on;
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos/milhao por tempo (dia zero definido por casos/milhao)
subplot(2,2,1)

 fig=plot(dates,tot_cases,'DisplayName',[char(city),'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
%  text (max(dates), tot_cases(length(tot_cases)), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos por tempo (dia zero definido por casos/milhao)
subplot(2,2,2)

 fig=bar(dates7,new_cases7,"FaceColor",color,"EdgeColor",'none');
 hold on;
%  text (max(dates7), new_cases7(length(new_cases7)), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');






% Configurações:


subplot(2,2,3)

set(gca,'FontSize',fonte_padrao)
title({'Mortalidade por COVID-19'},'FontSize',fonte_titulo);
% xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Total de óbitos",'FontSize',fonte_labels);
legend ("location", "northwest");

% hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
% set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,(weeks/2.0 + 1.0)))
datetick('x',19,'keepticks')
xtickangle(90);
set(gca,'YGrid', 'on');
set(gca,'yminorgrid','off')



subplot(2,2,1)

set(gca,'FontSize',fonte_padrao)
title({'Contágio por COVID-19'},'FontSize',fonte_titulo);
% xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos'],'FontSize',fonte_labels);
ylabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northwest");

% hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
% set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,(weeks/2.0 + 1.0)))
datetick('x',19,'keepticks')
xtickangle(90);
set(gca,'YGrid', 'on');
set(gca,'yminorgrid','off')




subplot(2,2,2)

set(gca,'FontSize',fonte_padrao)
title({'Contágio semanal por COVID-19'},'FontSize',fonte_titulo);
% xlabel({['Dias desde que se ultrapassou ',num2str(X_cases),' casos']},'FontSize',fonte_labels);
ylabel ({'Novos casos por semana'},'FontSize',fonte_labels);
% legend ("location", "northwest");

% hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
% set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,(weeks/2.0 + 1.0)))
datetick('x',19,'keepticks')
xtickangle(90);
set(gca,'YGrid', 'on');
set(gca,'yminorgrid','off')


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.37 -0.3], .2,.12,]);
[x, map]=imread('logo.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')

subplot(2,2,4)

set(gca,'FontSize',fonte_padrao)
title({'Mortalidade semanal por COVID-19'},'FontSize',fonte_titulo);
% xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes']},'FontSize',fonte_labels);
ylabel ({'Novos óbitos por semana'},'FontSize',fonte_labels);
% legend ("location", "northwest");

% hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
% set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,(weeks/2.0 + 1.0)))
datetick('x',19,'keepticks')
xtickangle(90);
set(gca,'YGrid', 'on');
set(gca,'yminorgrid','off')


hold on;
if (any(new_deaths < 0) || any(new_cases < 0))
hfonte=text(max(dates)+25,0,{'Fonte: https://covid19br.wcota.me/','Obs: números negativos se devem à reavaliação de dados anteriormente divulgados pelos orgãos competentes.'});
else
hfonte=text(max(dates)+25,0,{'Fonte: https://covid19br.wcota.me/'});
end
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7);



outputdir = datestr(end_time,29);
if ~exist([pwd,'/',outputdir], 'dir')
  mkdir([pwd,'/',outputdir]);
end

outputdir2 = name;
if ~exist([pwd,'/',outputdir,'/',outputdir2], 'dir')
  mkdir([pwd,'/',outputdir,'/',outputdir2]);
end

% %Controle do site
print(figure(1),[pwd '/upload/',name,'/covid19RJ_M_ST_',cityprint,'.png'],'-dpng','-r400'); 

% %Controle do github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19RS_M_ST_',cityprint,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 

close all;

end

