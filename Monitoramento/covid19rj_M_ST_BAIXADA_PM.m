clear all;
clc;
close all;


%Lendo o arquivo disponível no site 
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities-time.csv'];
% filename = 'cases-brazil-cities-time.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

table = readtable([pwd,'/Dados/cases-brazil-cities-time.txt']);

%nome dos arquivos que serão salvos
name = 'BAIXADA';

%Separei em dois tipos de plot pra organizar em ordem de mais mortes (tipo 1) e mais casos (tipo 2)
for( plot_type = 1:1:2)

for( init = 1:1:13)

clearvars -except plot_type init table data name


if (plot_type == 1)

if (init == 1) city = 'Duque de Caxias/RJ'; pop = 919596; color = [96,209,224]/255; end
if (init == 2) city = 'Nova Iguaçu/RJ'; pop = 821128; color = [181,147,87]/255; end
if (init == 4) city = 'Belford Roxo/RJ'; pop = 508013; color = [248,187,208]/255; end
if (init == 3) city = 'São João de Meriti/RJ'; pop = 472406; color = [0,104,44]/255; end
if (init == 6) city = 'Mesquita/RJ'; pop = 176103; color = [135,85,30]/255; end
if (init == 9) city = 'Guapimirim/RJ'; pop = 60517; color = [236,64,122]/255; end
if (init == 8) city = 'Itaguaí/RJ'; pop = 133019; color = [69,169,0]/255; end
if (init == 13) city = 'Japeri/RJ'; pop = 104768; color = [255,130,113]/255; end
if (init == 7) city = 'Nilópolis/RJ'; pop = 162485; color = [209,227,105]/255; end
if (init == 12) city = 'Paracambi/RJ'; pop = 	52257; color = [0,45,135]/255; end
if (init == 10) city = 'Queimados/RJ'; pop = 150319; color = [203,63,23]/255; end
if (init == 11) city = 'Seropédica/RJ'; pop = 	86312; color = [0.5,0.5,0.5]; end
if (init == 5) city = 'Magé/RJ'; pop = 245071; color = [191,171,72]/255; end

%Definindo os números de casos e mortes
tot_cases = table.totalCases(find(strcmp([table.city],city)),:);
new_cases = table.newCases(find(strcmp([table.city],city)),:);
tot_deaths = table.deaths(find(strcmp([table.city],city)),:);
new_deaths = table.newDeaths(find(strcmp([table.city],city)),:);

dates = table.date(find(strcmp([table.city],city)),:);
end_time = max(datenum(dates));

% if strcmp(city, 'Rio de Janeiro/RJ') city = 'Rio de Janeiro (capital)'; end 
% if strcmp(city, 'Duque de Caxias/RJ') city = 'Duque de Caxias           '; end 
% if strcmp(city, 'Nova Iguaçu/RJ') city = 'Nova Iguaçu                  '; end 
% if strcmp(city, 'São Gonçalo/RJ') city = 'São Gonçalo                  '; end 
% if strcmp(city, 'Niterói/RJ') city = 'Niterói                           '; end 
% if strcmp(city, 'Belford Roxo/RJ') city = 'Belford Roxo                 '; end 
% if strcmp(city, 'São João de Meriti/RJ') city = 'São João de Meriti         '; end 
% if strcmp(city, 'Itaboraí/RJ') city = 'Itaboraí                         '; end 
% if strcmp(city, 'Mesquita/RJ') city = 'Mesquita                       '; end 
% if strcmp(city, 'Petrópolis/RJ') city = 'Petrópolis                      '; end 
% if strcmp(city, 'Volta Redonda/RJ') city = 'Volta Redonda              '; end 
% if strcmp(city, 'Magé/RJ') city = 'Magé                             '; end 

end

if (plot_type == 2)

if (init == 1) city = 'Duque de Caxias/RJ'; pop = 919596; color = [96,209,224]/255; end
if (init == 2) city = 'Nova Iguaçu/RJ'; pop = 821128; color = [181,147,87]/255; end
if (init == 5) city = 'Belford Roxo/RJ'; pop = 508013; color = [248,187,208]/255; end
if (init == 4) city = 'São João de Meriti/RJ'; pop = 472406; color = [0,104,44]/255; end
if (init == 9) city = 'Mesquita/RJ'; pop = 176103; color = [135,85,30]/255; end
if (init == 8) city = 'Guapimirim/RJ'; pop = 60517; color = [236,64,122]/255; end
if (init == 7) city = 'Itaguaí/RJ'; pop = 133019; color = [69,169,0]/255; end
if (init == 13) city = 'Japeri/RJ'; pop = 104768; color = [255,130,113]/255; end
if (init == 10) city = 'Nilópolis/RJ'; pop = 162485; color = [209,227,105]/255; end
if (init == 12) city = 'Paracambi/RJ'; pop = 	52257; color = [0,45,135]/255; end
if (init == 6) city = 'Queimados/RJ'; pop = 150319; color = [203,63,23]/255; end
if (init == 11) city = 'Seropédica/RJ'; pop = 	86312; color = [0.5,0.5,0.5]; end
if (init == 3) city = 'Magé/RJ'; pop = 245071; color = [191,171,72]/255; end

%Definindo os números de casos e mortes
tot_cases = table.totalCases(find(strcmp([table.city],city)),:);
new_cases = table.newCases(find(strcmp([table.city],city)),:);
tot_deaths = table.deaths(find(strcmp([table.city],city)),:);
new_deaths = table.newDeaths(find(strcmp([table.city],city)),:);

dates = table.date(find(strcmp([table.city],city)),:);
end_time = max(datenum(dates));

% if strcmp(city, 'Rio de Janeiro/RJ') city = 'Rio de Janeiro (capital)'; end 
% if strcmp(city, 'Duque de Caxias/RJ') city = 'Duque de Caxias           '; end 
% if strcmp(city, 'Nova Iguaçu/RJ') city = 'Nova Iguaçu                  '; end 
% if strcmp(city, 'São Gonçalo/RJ') city = 'São Gonçalo                  '; end 
% if strcmp(city, 'Niterói/RJ') city = 'Niterói                           '; end 
% if strcmp(city, 'Belford Roxo/RJ') city = 'Belford Roxo                 '; end 
% if strcmp(city, 'São João de Meriti/RJ') city = 'São João de Meriti         '; end 
% if strcmp(city, 'Itaboraí/RJ') city = 'Itaboraí                         '; end 
% if strcmp(city, 'Mesquita/RJ') city = 'Mesquita                         '; end 
% if strcmp(city, 'Petrópolis/RJ') city = 'Petrópolis                      '; end 
% if strcmp(city, 'Volta Redonda/RJ') city = 'Volta Redonda              '; end 
% if strcmp(city, 'Magé/RJ') city = 'Magé                             '; end 

end





%Por 100 mil hab
tot_cases_pm = tot_cases / ( pop / 100000 );
new_cases_pm = new_cases / ( pop / 100000 );
tot_deaths_pm = tot_deaths / ( pop / 100000 );
new_deaths_pm = new_deaths / ( pop / 100000 );


%consolidando os Casos e mortes por semana
for (i=7:1:max(max(size(dates))) ) 
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

Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

%Fontes
fonte_titulo = 10.5;
fonte_labels = 10;
fonte_padrao = 9; %numeros dos eixos
fonte_location = 8;

day_axis = 160;

if (plot_type == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes por tempo (dia zero definido por mortes)
figure (1);

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
% dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(tot_deaths_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_pmX,'DisplayName',[city,'  ',num2str(tot_deaths(max(size(tot_deaths)),1)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;


 text (n-1, tot_deaths_pmX(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Mortes X total de mortes (por milhao de hab.)
figure (3);

grid1=loglog([1,100000],10*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,100000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=loglog([1,100000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid4=loglog(10*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(100*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid6=loglog(1000*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid7=loglog(10000*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Mortes
 new_deaths7w0_pm = new_deaths7_pm;
 tot_deathsw0_pm = tot_deaths_pm;
  pos0 = new_deaths7_pm(:,1) <= 0;
 tot_deathsw0_pm(pos0,:) = [];
 new_deaths7w0_pm(pos0,:) = [];

 n = max(max(size(tot_deaths_pm)));
 fig=loglog(tot_deathsw0_pm,new_deaths7w0_pm,'DisplayName',[city,'  ',num2str(tot_deaths(max(size(tot_deaths)),1)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_deaths_pm(n,1), new_deaths7_pm(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas de mortes por tempo (dia zero definido por mortes/milhao)
figure (5);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),0.1*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),1*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
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
 fig=semilogy(days,new_deaths7_pmX/7,'DisplayName',[city,'  ',num2str(tot_deaths(max(size(tot_deaths)),1)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_deaths7_pmX(n,1)/7, [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

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
% dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(tot_cases_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_pmX,'DisplayName',[city,'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, tot_cases_pmX(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos X total de casos 
figure (4);

grid1=loglog([1,1000000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,1000000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=loglog([1,1000000],10000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid4=loglog(100*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(1000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid6=loglog(10000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid7=loglog(100000*(ones(2, 1)),[1,100000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Casos
 new_cases7w0_pm = new_cases7_pm;
 tot_casesw0_pm = tot_cases_pm;
  pos0 = new_cases7_pm(:,1) <= 0;
 tot_casesw0_pm(pos0,:) = [];
 new_cases7w0_pm(pos0,:) = [];
  

 n = max(max(size(tot_cases_pm)));
 fig=loglog(tot_casesw0_pm,new_cases7w0_pm,'DisplayName',[city,'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_cases_pm(n,1), new_cases7_pm(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos por tempo (dia zero definido por casos/milhao)
figure (6);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),1*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
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
 fig=semilogy(days,new_cases7_pmX/7,'DisplayName',[city,'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_cases7_pmX(n,1)/7, [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');


end

end

end


% Configurações:


figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Mortalidade da epidemia',['Baixada Fluminense em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte'],['(por 100 mil habitantes)']},'FontSize',fonte_labels);
ylabel ({'Total de mortes', '(por 100 mil habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=1;
max_y=100;

% ang = 65;
% h1=text(66,0.9*max_y,'números dobram a cada 7 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 44;
% h2=text(135,0.9*max_y,'14 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 30;
% h3=text(198,0.8*max_y,'21 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 45;
% h4=text(76.7,0.9*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k'})

hfonte=text(day_axis,max_y,'Fonte: https://covid19br.wcota.me/');
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
ha2=axes('position',[haPos([3 1])-[-0.16 -0.2], .2,.15,]);
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
title({'Contágio da epidemia',['Baixada Fluminense em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos'], '(por 100 mil habitantes)'},'FontSize',fonte_labels);
ylabel ({'Total de casos','(por 100 mil habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=10;
max_y=10000;
ang = 60;

% ang = 65;
% h1=text(66,0.9*max_y,'números dobram a cada 7 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 44;
% h2=text(135,0.9*max_y,'14 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 30;
% h3=text(198,0.8*max_y,'21 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% h4=text(76.7,0.9*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k'})

hfonte=text(day_axis,max_y,'Fonte: https://covid19br.wcota.me/');
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
ha2=axes('position',[haPos([3 1])-[-0.16 -0.2], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de mortes)',['Baixada Fluminense em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel({'Mortes por semana','(por 100 mil habitantes)'},'FontSize',fonte_labels);
xlabel ({'Total de mortes','(por 100 mil habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 1000;
max_y = 100;
axis([1 max_x 1 max_y]);


set(gca,'YTickLabel',{'1','10','100'})
set(gca,'XTickLabel',{'1','10','100','1k'})

hfonte=text(max_x,max_y,{'Gráfico inspirado em: https://aatishb.com/covidtrends/','Fonte: https://covid19br.wcota.me/'});
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.2], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de casos)',['Baixada Fluminense em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel({'Casos por semana','(por 100 mil habitantes)'},'FontSize',fonte_labels);
xlabel ({'Total de casos','(por 100 mil habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 10000;
max_y = 1000;
axis([10 max_x 10 max_y]);


set(gca,'YTickLabel',{'10','100','1k'})
set(gca,'XTickLabel',{'10','100','1k','10k'})

hfonte=text(max_x,max_y,{'Gráfico inspirado em: https://aatishb.com/covidtrends/','Fonte: https://covid19br.wcota.me/'});
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.2], .2,.15,]);
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
title({'Mortalidade diária da epidemia',['Baixada Fluminense em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte'],'(por 100 mil habitantes)'},'FontSize',fonte_labels);
ylabel ({'Mortes diárias por 100 mil habitantes','(Média móvel de 7 dias)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=0.01;
max_y=10;

% ang = 56;
% h1=text(31.2,0.9*max_y,'números dobram a cada 5 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 50;
% h2=text(37.75,0.9*max_y,'6 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 48;
% h3=text(44,0.9*max_y,'7 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 46;
% h4=text(50.2,0.9*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'0.01','0.1','1','10','100'})

hfonte=text(day_axis,max_y,'Fonte: https://covid19br.wcota.me/');
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
ha2=axes('position',[haPos([3 1])-[-0.16 -0.2], .2,.15,]);
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
title({'Contágio diário da epidemia',['Baixada Fluminense em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos'],'(por 100 mil habitantes)'},'FontSize',fonte_labels);
ylabel ({'Casos por dia por 100 mil habitantes','(Média móvel de 7 dias)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
y_init=0.1;
max_y=1000;

% ang = 56;
% h1=text(31.2,0.9*max_y,'números dobram a cada 5 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 50;
% h2=text(37.75,0.9*max_y,'6 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 48;
% h3=text(44,0.9*max_y,'7 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 46;
% h4=text(50.2,0.9*max_y,'8 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'0.1','1','10','100','1k'})

hfonte=text(day_axis,max_y,'Fonte: https://covid19br.wcota.me/');
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
ha2=axes('position',[haPos([3 1])-[-0.16 -0.2], .2,.15,]);
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


