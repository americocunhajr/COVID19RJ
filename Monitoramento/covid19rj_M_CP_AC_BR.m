clear all
close all
clc

%nome que aparece nos arquivos
name = 'BR';

%Lendo o arquivo disponível no site 
arquivogeral = readtable([pwd '/Dados/cases-brazil-states.txt']);

Estados = {"AC"; "AP"; "AM"; "PA"; "TO"; "RO"; "RR"; "AL"; "BA"; "CE"; "MA"; "PB"; "PE"; "PI"; "RN"; "SE"; "DF"; "GO"; "MT"; "MS";"ES"; "MG"; "RJ"; "SP"; "PR"; "RS"; "SC";"TOTAL"};

colors = [69,169,0
    5,163,29
    53,143,31
    0,169,74
    0,109,22
    0,104,44
    0,67,21
    96,209,224
    0,170,196
    0,116,136
    0,74,84
    27,78,142
    0,99,181
    0,45,135
    0,34,80
    0,20,37
    181,147,87
    135,85,30
    110,71,28
    86,62,32
    255,130,113
    254,88,52
    248,66,9
    203,63,23
    209,227,105
    193,203,68
    191,171,72
    0,0,0
    ]/255;

%Data final
end_time = datestr(datenum(max(arquivogeral.date)));
    
% Encontrando data inicial
min_casos_acum_consider = 0;
max_size = 1;

for i=1:length(Estados)
    I_estado=find(arquivogeral.state == string(Estados(i,:)));
    tabela = arquivogeral(I_estado,:);
    I = find(tabela.totalCases>= min_casos_acum_consider);
    max_size = max([max(size(I));max_size]);
end

% Extraindo dados
casos_diarios = zeros(length(Estados),max_size);
casos_acumulados = zeros(length(Estados),max_size);
obitos_diarios = zeros(length(Estados),max_size);
obitos_acumulados = zeros(length(Estados),max_size);

recuperados_acumulados = zeros(length(Estados),max_size);

casos_diarios_pm = zeros(length(Estados),max_size);
casos_acumulados_pm = zeros(length(Estados),max_size);
obitos_diarios_pm = zeros(length(Estados),max_size);
obitos_acumulados_pm = zeros(length(Estados),max_size);


%Gerando matrizes para os 4: caso e obitos x diario e acumulados
for i=1:length(Estados)
    I_estado=find(arquivogeral.state == string(Estados(i,:)));
    tabela_aux = arquivogeral(I_estado,:);
    tabela = tabela_aux;
    %casos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.new_cases;
    %obitos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.new_deaths;
    casos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.totalCases;
    %obitos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.total_deaths;
 
    recuperados_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.recovered;
    
    %casos_diarios_pm(i,max_size-height(tabela_aux)+1:end) = tabela.new_cases_per_million;
    %obitos_diarios_pm(i,max_size-height(tabela_aux)+1:end) = tabela.new_deaths_per_million;
    casos_acumulados_pm(i,max_size-height(tabela_aux)+1:end) = tabela.totalCases_per_100k_inhabitants * 10;
    obitos_acumulados_pm(i,max_size-height(tabela_aux)+1:end) = tabela.deaths_per_100k_inhabitants * 10;
end

%Legenda
Estados_leg = {"AC"; "AP"; "AM"; "PA"; "TO"; "RO"; "RR"; "AL"; "BA"; "CE"; "MA"; "PB"; "PE"; "PI"; "RN"; "SE"; "DF"; "GO"; "MT"; "MS";"ES"; "MG"; "RJ"; "SP"; "PR"; "RS"; "SC";"BR"};




Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);


%Casos por milhão
figure(1)
b = bar(1:length(Estados),casos_acumulados_pm(:,max_size));
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(:,:) = colors;

for(i=1:length(Estados))
text (i, casos_acumulados_pm(i,max_size), [' ',mat2str(round(casos_acumulados_pm(i,max_size)))],'HorizontalAlignment', 'left','VerticalAlignment', 'middle','FontSize',8,'Rotation',90)
end

set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
set(gca, 'XTick', 1:1:length(Estados));
xtickangle(45);

ymin = 0;
ymax = 80000;
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', ymin:10000:ymax);
set(gca,'YTickLabel',{'0','10k','20k','30k','40k','50k','60k','70k','80k','90k','100k','110k','120k'});
set(gca,'YGrid', 'on');
title({'Casos acumulados por milhão de habitantes',['Estados do Brasil em ',datestr(end_time,24)]},'FontSize',11);

xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://covid19br.wcota.me/');
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


%Mortes por milhão
figure(2)
b = bar(1:length(Estados),obitos_acumulados_pm(:,max_size));
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(:,:) = colors;

for(i=1:length(Estados))
text (i, obitos_acumulados_pm(i,max_size), [' ',mat2str(round(obitos_acumulados_pm(i,max_size)))],'HorizontalAlignment', 'left','VerticalAlignment', 'middle','FontSize',8,'Rotation',90)
end

set(gca, 'XTick', 1:1:length(Estados));
set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
xtickangle(45);

ymin = 0;
ymax =1200;
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', ymin:200:ymax);
set(gca,'YTickLabel',{'0','200','400','600','800','1000','1200','1400','1600','1800','2000'});
set(gca,'YGrid', 'on');
title({'Mortes acumuladas por milhão de habitantes',['Estados do Brasil em ',datestr(end_time,24)]},'FontSize',11);

xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://covid19br.wcota.me/');
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


%Letalidade em relação aos casos confirmados
figure(3)
b = bar(1:length(Estados),100*obitos_acumulados_pm(:,max_size)./casos_acumulados_pm(:,max_size));
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(:,:) = colors;

for(i=1:length(Estados))
text (i, 100*obitos_acumulados_pm(i,max_size)./casos_acumulados_pm(i,max_size),[sprintf(' %.1f',(100*obitos_acumulados_pm(i,max_size)./casos_acumulados_pm(i,max_size))),'%'],'HorizontalAlignment', 'left','VerticalAlignment', 'middle','FontSize',8,'Rotation',90)
end

set(gca, 'XTick', 1:1:length(Estados));
set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
xtickangle(45);

ymin = 0;
ymax = 12;
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', ymin:2:ymax);
set(gca,'YTickLabel',{'0','2%','4%','6%','8%','10%','12%','14%','16%','18%','20%'});
set(gca,'YGrid', 'on');
title({'Letalidade em relação aos casos confirmados',['Estados do Brasil em ',datestr(end_time,24)]},'FontSize',11);


xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://covid19br.wcota.me/');
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

%Recuperados em relação aos casos confirmados
figure(4)
b = bar(1:length(Estados),100*recuperados_acumulados(:,max_size)./casos_acumulados(:,max_size));
hold on;

b.FaceColor = 'flat';
b.EdgeColor = 'flat';
b.CData(:,:) = colors;

for(i=1:length(Estados))
text (i, 100*recuperados_acumulados(i,max_size)./casos_acumulados(i,max_size),[sprintf(' %.1f',(100*recuperados_acumulados(i,max_size)./casos_acumulados(i,max_size))),'%'],'HorizontalAlignment', 'left','VerticalAlignment', 'middle','FontSize',8,'Rotation',90)
end

set(gca, 'XTick', 1:1:length(Estados));
set(gca,'XTickLabel',Estados_leg, 'FontSize',9);
xtickangle(45);

ymin = 0;
ymax = 120;
set(gca,'YLim',[ymin ymax]);
set(gca, 'YTick', ymin:10:ymax);
set(gca,'YTickLabel',{'0','10%','20%','30%','40%','50%','60%','70%','80%','90%','100%',' ',' '});
set(gca,'YGrid', 'on');
title({'Recuperados em relação aos casos confirmados',['Estados do Brasil em ',datestr(end_time,24)]},'FontSize',11);


xmax=max(xlim);
hfonte=text(xmax,ymax,'Fonte: https://covid19br.wcota.me/');
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
print(figure(3),[pwd '/upload/',name,'/covid19rj_M_CP_NM_NA_AC_',name,'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/upload/',name,'/covid19rj_M_CP_RE_NA_AC_',name,'.png'],'-dpng','-r400'); 


%Controle github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NC_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NM_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_NM_NA_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_RE_NA_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 


close all
