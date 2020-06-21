clear all
close all
clc

%nome que aparece nos arquivos
name = 'WD';

%Lendo o arquivo disponível no site 
% fullURL = ['https://covid.ourworldindata.org/data/owid-covid-data.csv'];
% filename = 'owid-covid-data.csv';
% urlwrite(fullURL,[pwd '/Dados/',filename]);
arquivogeral = readtable([pwd '/Dados/owid-covid-data.csv']);
% 
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
% filename = 'cases-brazil-states.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);
BRarquivogeral = readtable([pwd '/Dados/cases-brazil-states.txt']);

Estados = {"Germany"; "Belgium"; "Brazil"; "Chile";"China";"Spain"; "United States"; "France";"India";"Iran";"Italy"; "Peru"; "United Kingdom";"Russia"; "Sweden"; "Turkey"};

%Data final
end_time = datestr(datenum(max(arquivogeral.date)-1));
    
% Encontrando data inicial
min_casos_acum_consider = 0;
max_size = 1;

for i=1:length(Estados)
    I_estado=find(arquivogeral.location == string(Estados(i,:)));
    tabela = arquivogeral(I_estado,:);
    I = find(tabela.total_cases>= min_casos_acum_consider);
    max_size = max([max(size(I));max_size]);
end

% Extraindo dados
casos_diarios = zeros(length(Estados),max_size);
casos_acumulados = zeros(length(Estados),max_size);
obitos_diarios = zeros(length(Estados),max_size);
obitos_acumulados = zeros(length(Estados),max_size);

casos_diarios_pm = zeros(length(Estados),max_size);
casos_acumulados_pm = zeros(length(Estados),max_size);
obitos_diarios_pm = zeros(length(Estados),max_size);
obitos_acumulados_pm = zeros(length(Estados),max_size);

population = zeros(length(Estados),max_size);
tests = zeros(length(Estados),max_size);


%Gerando matrizes para os 4: caso e obitos x diario e acumulados
for i=1:length(Estados)
    if (i==3) %Brazil position
    I_estado=find(BRarquivogeral.state == string("TOTAL"));
    tabela_aux = BRarquivogeral(I_estado,:);
    tabela = tabela_aux;
    
    casos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.newCases;
    obitos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.newDeaths;
    casos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.totalCases;
    obitos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.deaths;
 
    popBR = 212.559409;
    casos_diarios_pm(i,max_size-height(tabela_aux)+1:end) = tabela.newCases/popBR;
    obitos_diarios_pm(i,max_size-height(tabela_aux)+1:end) = tabela.newDeaths/popBR;
    casos_acumulados_pm(i,max_size-height(tabela_aux)+1:end) = tabela.totalCases/popBR;
    obitos_acumulados_pm(i,max_size-height(tabela_aux)+1:end) = tabela.deaths/popBR;
    
    population(i,max_size-height(tabela_aux)+1:end) = 212559409;
    tests(i,max_size-height(tabela_aux)+1:end) = tabela.tests;
    
    else
        
    I_estado=find(arquivogeral.location == string(Estados(i,:)));
    tabela_aux = arquivogeral(I_estado,:);
    tabela = tabela_aux;
    
    casos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.new_cases;
    obitos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.new_deaths;
    casos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.total_cases;
    obitos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.total_deaths;
 
    casos_diarios_pm(i,max_size-height(tabela_aux)+1:end) = tabela.new_cases_per_million;
    obitos_diarios_pm(i,max_size-height(tabela_aux)+1:end) = tabela.new_deaths_per_million;
    casos_acumulados_pm(i,max_size-height(tabela_aux)+1:end) = tabela.total_cases_per_million;
    obitos_acumulados_pm(i,max_size-height(tabela_aux)+1:end) = tabela.total_deaths_per_million;
    
    population(i,max_size-height(tabela_aux)+1:end) = tabela.population;
    tests(i,max_size-height(tabela_aux)+1:end) = tabela.total_tests;   
    end
end

for i=1:length(Estados)
   tests_max(i) = max(tests(i,:)) 
end

%Legenda
Estados_leg = {"Alemanha     "; "Bélgica     "; "Brasil     "; "Chile     ";"China     "; "Espanha     "; "EUA     ";"França     ";"Índia     " ; "Irã     ";"Itália     "; "Peru     "; "Reino Unido     "; "Rússia     "; "Suécia     ";"Turquia     "};




Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

color_paises = [0.9290 0.6940 0.1250];
color_brasil = [0.4660 0.6740 0.1880];


%Casos por milhão
figure(1)
b = bar(1:length(Estados),casos_acumulados_pm(:,max_size),'FaceColor',color_paises,'EdgeColor',color_paises);
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(3,:) = color_brasil;

for(i=1:length(Estados))
text (i, casos_acumulados_pm(i,max_size), mat2str(round(casos_acumulados_pm(i,max_size))),'HorizontalAlignment', 'center','VerticalAlignment', 'bottom','FontSize',7.5)
end

set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
set(gca, 'XTick', 1.4:1:length(Estados)+0.4);
xtickangle(45);


ymin = 0;
ymax = 14000;
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', ymin:2000:ymax);
set(gca,'YTickLabel',{'0','2000','4000','6000','8000','10000','12000','14000'});
set(gca,'YGrid', 'on');
title({'Casos acumulados por milhão de habitantes',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',11);

xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.65], .24,.12,]);
[x, map]=imread('logo.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')

%Bandeiras
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[0.6115 -0.005], 0.7075,.038,]);
[x, map]=imread('bandeiras.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')



%Mortes por milhão
figure(2)
b = bar(1:length(Estados),obitos_acumulados_pm(:,max_size),'FaceColor',color_paises,'EdgeColor',color_paises);
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(3,:) = color_brasil;

for(i=1:length(Estados))
text (i, obitos_acumulados_pm(i,max_size), mat2str(round(obitos_acumulados_pm(i,max_size))),'HorizontalAlignment', 'center','VerticalAlignment', 'bottom','FontSize',7.5)
end

set(gca, 'XTick', 1.4:1:length(Estados)+0.4);
set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
xtickangle(45);

ymin = 0;
ymax = 1000;
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', ymin:200:ymax);
set(gca,'YTickLabel',{'0','200','400','600','800','1000'});
set(gca,'YGrid', 'on');
title({'Mortes acumuladas por milhão de habitantes',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',11);

xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.65], .24,.12,]);
[x, map]=imread('logo.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')

%Bandeiras
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[0.6115 -0.005], 0.7075,.038,]);
[x, map]=imread('bandeiras.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')

%Letalidade em relação aos casos confirmados
figure(3)
b = bar(1:length(Estados),100*obitos_acumulados_pm(:,max_size)./casos_acumulados_pm(:,max_size),'FaceColor',color_paises,'EdgeColor',color_paises);
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(3,:) = color_brasil;

for(i=1:length(Estados))
text (i, 100*obitos_acumulados_pm(i,max_size)./casos_acumulados_pm(i,max_size),[sprintf('%.1f',(100*obitos_acumulados_pm(i,max_size)./casos_acumulados_pm(i,max_size))),'%'],'HorizontalAlignment', 'center','VerticalAlignment', 'bottom','FontSize',7.5)
end

set(gca, 'XTick', 1.4:1:length(Estados)+0.4);
set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
xtickangle(45);

ymin = 0;
ymax = 20;
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', ymin:5:ymax);
set(gca,'YTickLabel',{'0','5%','10%','15%','20%','25%','30%'});
set(gca,'YGrid', 'on');
title({'Letalidade em relação aos casos confirmados',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',11);


xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.65], .24,.12,]);
[x, map]=imread('logo.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')

%Bandeiras
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[0.6115 -0.005], 0.7075,.038,]);
[x, map]=imread('bandeiras.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')


%TESTES
figure(4)
b = bar(1:length(Estados),population(:,max_size),'FaceColor',color_paises,'EdgeColor',color_paises);
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(3,:) = color_brasil;

for(i=1:length(Estados))
text (i, population(i,max_size),[' ',sprintf('%.2f',tests_max(i) ./ population(i,max_size)*100),'%'],'HorizontalAlignment', 'left','VerticalAlignment', 'middle','FontSize',8,'Rotation',90)
end

set(gca, 'XTick', 1.4:1:length(Estados)+0.4);
set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
xtickangle(45);
ylabel('Número de habitantes / Número de testes (azul)','FontSize',9);

ymin = 100000;
ymax = 10000000000;
set(gca,'yscale','log')
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', [100000,1000000,10000000,100000000,1000000000,10000000000]);
set(gca,'YTickLabel',{'100K','1M','10M','100M','1B','10B'});
set(gca,'YGrid', 'on');
set(gca,'yminorgrid','off')
title({'Testes em relação à população',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',11);

hold on;
b2 = bar(1:length(Estados),tests_max,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410]);
hold on;

xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.65], .24,.12,]);
[x, map]=imread('logo.png');
image(x)
colormap (map)
set(ha2,'handlevisibility','off','visible','off')

%Bandeiras
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[0.6115 -0.005], 0.7075,.038,]);
[x, map]=imread('bandeiras.png');
image(x)
colormap (map)
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
print(figure(1),[pwd '/upload/',name,'/covid19rj_M_CP_NC_AC_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/upload/',name,'/covid19rj_M_CP_NM_AC_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/upload/',name,'/covid19rj_M_CP_NM_NA_PM_',name,'.png'],'-dpng','-r400'); 

%Controle github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NC_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NM_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NM_NA_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 



close all

