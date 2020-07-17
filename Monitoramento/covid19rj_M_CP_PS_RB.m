clc;
clear all;
close all;

%nome que aparece nos arquivos
name = 'RB';


% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
% filename = 'cases-brazil-states.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

%Lendo o arquivo do Brasil
popBR = 212.559409;
table = readtable([pwd,'/Dados/cases-brazil-states.txt']);

Pos = [0,500,900,750];
set(0, 'DefaultFigurePosition', Pos);

%Calculando casos diários
casos = table.totalCases;
mortes = table.deaths;

BRASIL = [casos, mortes];

%Definindo o número de dias com informações do COVID-19, que representa o tamanho das matrizes dos estados
dates = table.date(find(strcmp([table.state],'TOTAL')),:);
end_time = max(datenum(dates));
D = length(dates);


for( init = 1:1:6)

clearvars -except plot_type init data table name D BRASIL end_time dates

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

if (init == 1)
country = 'Norte';
tot_cases = NORTE(:,1);
tot_deaths = NORTE(:,2);
cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 2)
country = 'Nordeste';
color = [0,99,181]/255;
tot_cases = NORDESTE(:,1);
tot_deaths = NORDESTE(:,2);
cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 4) 
country = 'Sudeste';
tot_cases = SUDESTE(:,1);
tot_deaths = SUDESTE(:,2);
cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 5)
country = 'Sul';
tot_cases = SUL(:,1);
tot_deaths = SUL(:,2);
cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 3)
country = 'Centro-Oeste';
tot_cases = CENTRO(:,1);
tot_deaths = CENTRO(:,2);
cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end
if (init == 6)
country = 'Brasil';
tot_cases = BR(:,1);
tot_deaths = BR(:,2);
cases_old = [zeros(1,1) ; tot_cases(1:end-1,:)];
deaths_old= [zeros(1,1) ; tot_deaths(1:end-1,:)];
new_cases = -cases_old + tot_cases;
new_deaths = -deaths_old + tot_deaths;
end

r = [255, 0, 0 ]/255;
y = [255, 225, 0]/255;
g = [0, 125, 0]/255; 

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


subplot(2,3,init)
plot(dates_cases,new_cases7_X,'linewidth',2,'color',color)

yticks([])

xlim([dates_cases(1,1) dates_cases(length(dates_cases),1)]);
set(gca, 'XTick', linspace(dates_cases(1,1),datestr(end_time),3))
set(gca,'FontSize',10);
datetick('x',19,'keepticks')

title({[country]},'FontSize',11);

xlabel({['Total de casos: ',num2str(max(tot_cases))],' '},'FontSize', 10);

figure(2)

color = r;
if (new_deaths7_X(length(new_deaths7_X)) < 0.5 * max(new_deaths7_X)) color = y; end
if (new_deaths7_X(length(new_deaths7_X)) < 0.2 * max(new_deaths7_X)) color = g; end

subplot(2,3,init)
plot(dates_deaths,new_deaths7_X,'linewidth',2,'color',color)

yticks([])

xlim([dates_deaths(1,1) dates_deaths(length(dates_deaths),1)]);
set(gca, 'XTick', linspace(dates_deaths(1,1),datestr(end_time),3));
set(gca,'FontSize',10);
datetick('x',19,'keepticks')

title({[country]},'FontSize',11);

xlabel(['Total de mortes: ',num2str(max(tot_deaths))],'FontSize', 10);
% 
% figure(3)
% 
% color = r;
% if (active_cases_X(length(active_cases_X)) < 0.5 * max(active_cases_X)) color = y; end
% if (active_cases_X(length(active_cases_X)) < 0.2 * max(active_cases_X)) color = g; end
% 
% 
% subplot(4,7,init)
% plot(dates_cases,active_cases_X,'linewidth',2,'color',color)
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
sgtitle({'Regiões do Brasil enfrentando a Covid-19',datestr(end_time,24),' ','Comparação da curva de novos casos por semana'})

hold on;
hfonte=text(max(dates)+50,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://covid19br.wcota.me/'});
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.55 -0.2], .2,.11,]);
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
ha2=axes('position',[haPos([3 1])-[0.10 -0.48], .16,.09,]);
[x, map]=imread('legenda.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

figure(2)
sgtitle({'Regiões do Brasil enfrentando a Covid-19',datestr(end_time,24),' ','Comparação da curva de novas mortes por semana'})

hold on;
hfonte=text(max(dates)+40,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://covid19br.wcota.me/'});
set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.55 -0.2], .2,.11,]);
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
ha2=axes('position',[haPos([3 1])-[0.10 -0.48], .16,.09,]);
[x, map]=imread('legenda.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')



% 
% figure(3)
% sgtitle({'Brasil enfrentando a Covid-19',datestr(end_time,24),' ','Comparação da curva de casos ativos'})
% 
% 
% hold on;
% hfonte=text(max(dates)+80,0,{'Gráfico inspirado em: https://www.endcoronavirus.org/countries','Fonte: https://covid19br.wcota.me/','Casos ativos são calculados pela subtração da soma de recuperados e óbitos dos casos acumulados.','O estado de Goiás ainda não forneceu dados sobre recuperados.'});
% set(hfonte,'Rotation',90,'color',[0,0,0],'FontSize',7.5);
% 
% % pra botar o logo no inferior direito
% ha =gca;
% uistack(ha,'bottom');
% haPos = get(ha,'position');
% ha2=axes('position',[haPos([3 1])-[-0.62 -0.07], .2,.11,]);
% [x, map]=imread('logo.png');
% image(x)
% % Setting the colormap to the colormap of the imported logo image
% colormap (map)
% % Turn the handlevisibility off so that we don't inadvertently plot
% % into the axes again. Also, make the axes invisible
% set(ha2,'handlevisibility','off','visible','off')
% 
% hold on;
% 
% ha =gca;
% uistack(ha,'bottom');
% haPos = get(ha,'position');
% ha2=axes('position',[haPos([3 1])-[-0.05 -0.2], .16,.09,]);
% [x, map]=imread('legenda.png');
% image(x)
% % Setting the colormap to the colormap of the imported logo image
% colormap (map)
% % Turn the handlevisibility off so that we don't inadvertently plot
% % into the axes again. Also, make the axes invisible
% set(ha2,'handlevisibility','off','visible','off')

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

% print(figure(3),[pwd '/upload/',name,'/covid19rj_M_CP_AT_AC_NA_',name,'.png'],'-dpng','-r400'); 
% print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_CP_AT_AC_NA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 


% close all




