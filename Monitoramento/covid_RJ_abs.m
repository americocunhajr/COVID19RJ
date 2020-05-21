clear all;
clc;
close all;

table = readtable([pwd,'/Dados/cases-brazil-cities-time.txt']);
data = table2cell(table);

%nome dos arquivos que serão salvos
name = 'RJ';

%Separei em dois tipos de plot pra organizar em ordem de mais mortes (tipo 1) e mais casos (tipo 2)
for( plot_type = 1:1:2)

for( init = 1:1:12)

clearvars -except plot_type init table data name


if (plot_type == 1)

if (init == 1) city = 'Rio de Janeiro/RJ'; pop = 6718903; color = [69,169,0]/255; end
if (init == 2) city = 'Duque de Caxias/RJ'; pop = 919596; color = [96,209,224]/255; end
if (init == 3) city = 'Nova Iguaçu/RJ'; pop = 821128; color = [181,147,87]/255; end
if (init == 4) city = 'São Gonçalo/RJ'; pop = 1084839; color = [255,130,113]/255; end
if (init == 5) city = 'Niterói/RJ'; pop = 524687; color = [209,227,105]/255; end
if (init == 6) city = 'Belford Roxo/RJ'; pop = 508013; color = [248,187,208]/255; end
if (init == 7) city = 'São João de Meriti/RJ'; pop = 472406; color = [0,104,44]/255; end
if (init == 9) city = 'Itaboraí/RJ'; pop = 240592; color = [0,45,135]/255; end
if (init == 8) city = 'Mesquita/RJ'; pop = 176103; color = [135,85,30]/255; end
if (init == 11) city = 'Petrópolis/RJ'; pop = 306191; color = [203,63,23]/255; end
if (init == 12) city = 'Volta Redonda/RJ'; pop = 273012; color = [191,171,72]/255; end
if (init == 10) city = 'Magé/RJ'; pop = 260497; color = [236,64,122]/255; end

location = data(find(strcmp([table.city], city)),:);

dates = table.date(find(strcmp([table.city],city)),:);
end_time = max(datenum(dates));

if strcmp(city, 'Rio de Janeiro/RJ') city = 'Rio de Janeiro (capital)'; end 
if strcmp(city, 'Duque de Caxias/RJ') city = 'Duque de Caxias           '; end 
if strcmp(city, 'Nova Iguaçu/RJ') city = 'Nova Iguaçu                  '; end 
if strcmp(city, 'São Gonçalo/RJ') city = 'São Gonçalo                    '; end 
if strcmp(city, 'Niterói/RJ') city = 'Niterói                             '; end 
if strcmp(city, 'Belford Roxo/RJ') city = 'Belford Roxo                   '; end 
if strcmp(city, 'São João de Meriti/RJ') city = 'São João de Meriti           '; end 
if strcmp(city, 'Itaboraí/RJ') city = 'Itaboraí                           '; end 
if strcmp(city, 'Mesquita/RJ') city = 'Mesquita                         '; end 
if strcmp(city, 'Petrópolis/RJ') city = 'Petrópolis                        '; end 
if strcmp(city, 'Volta Redonda/RJ') city = 'Volta Redonda                '; end 
if strcmp(city, 'Magé/RJ') city = 'Magé                               '; end 

end

if (plot_type == 2)

if (init == 1) city = 'Rio de Janeiro/RJ'; pop = 6718903; color = [69,169,0]/255; end
if (init == 4) city = 'Duque de Caxias/RJ'; pop = 919596; color = [96,209,224]/255; end
if (init == 3) city = 'Nova Iguaçu/RJ'; pop = 821128; color = [181,147,87]/255; end
if (init == 5) city = 'São Gonçalo/RJ'; pop = 1084839; color = [255,130,113]/255; end
if (init == 2) city = 'Niterói/RJ'; pop = 524687; color = [209,227,105]/255; end
if (init == 9) city = 'Belford Roxo/RJ'; pop = 508013; color = [248,187,208]/255; end
if (init == 6) city = 'São João de Meriti/RJ'; pop = 472406; color = [0,104,44]/255; end
if (init == 8) city = 'Itaboraí/RJ'; pop = 240592; color = [0,45,135]/255; end
if (init == 10) city = 'Mesquita/RJ'; pop = 176103; color = [135,85,30]/255; end
if (init == 12) city = 'Petrópolis/RJ'; pop = 306191; color = [203,63,23]/255; end
if (init == 7) city = 'Volta Redonda/RJ'; pop = 273012; color = [191,171,72]/255; end
if (init == 11) city = 'Magé/RJ'; pop = 260497; color = [236,64,122]/255; end

location = data(find(strcmp([table.city], city)),:);

dates = table.date(find(strcmp([table.city],city)),:);
end_time = max(datenum(dates));

if strcmp(city, 'Rio de Janeiro/RJ') city = 'Rio de Janeiro (capital)'; end 
if strcmp(city, 'Duque de Caxias/RJ') city = 'Duque de Caxias           '; end 
if strcmp(city, 'Nova Iguaçu/RJ') city = 'Nova Iguaçu                  '; end 
if strcmp(city, 'São Gonçalo/RJ') city = 'São Gonçalo                    '; end 
if strcmp(city, 'Niterói/RJ') city = 'Niterói                           '; end 
if strcmp(city, 'Belford Roxo/RJ') city = 'Belford Roxo                   '; end 
if strcmp(city, 'São João de Meriti/RJ') city = 'São João de Meriti           '; end 
if strcmp(city, 'Itaboraí/RJ') city = 'Itaboraí                           '; end 
if strcmp(city, 'Mesquita/RJ') city = 'Mesquita                         '; end 
if strcmp(city, 'Petrópolis/RJ') city = 'Petrópolis                        '; end 
if strcmp(city, 'Volta Redonda/RJ') city = 'Volta Redonda                '; end 
if strcmp(city, 'Magé/RJ') city = 'Magé                               '; end 

end


%Definindo os números de casos e mortes
tot_cases = cell2mat(location(:,9));
new_cases = cell2mat(location(:,8));
tot_deaths = cell2mat(location(:,7));
new_deaths = cell2mat(location(:,6));


tot_cases_pm = tot_cases / ( pop / 1000000 );
new_cases_pm = new_cases / ( pop / 1000000 );
tot_deaths_pm = tot_deaths / ( pop / 1000000 );
new_deaths_pm = new_deaths / ( pop / 1000000 );


%consolidando os novos casos e mortes por semana
new_cases7 = new_cases;
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

day_axis = 80;

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
 fig=semilogy(days,tot_deaths_X,'DisplayName',[city,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, tot_deaths_X(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

tot_mortes(init,1) = max(tot_deaths);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
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

 n = max(max(size(tot_deaths)));
 fig=loglog(tot_deaths,new_deaths7,'DisplayName',[city,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_deaths(n,1), new_deaths7(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

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
 fig=plot(days,new_deaths7_X,'DisplayName',[city,'  ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_deaths7_X(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

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
 fig=semilogy(days,tot_cases_X,'DisplayName',[city,'  ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, tot_cases_X(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos 
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


 n = max(max(size(tot_cases)));
 fig=loglog(tot_cases,new_cases7,'DisplayName',[city,'  ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_cases(n,1), new_cases7(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');

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
 fig=plot(days,new_cases7_X,'DisplayName',[city,'  ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_cases7_X(n,1), [' ',city],'FontSize',fonte_location,"color",color,"Clipping",'on');


end

end

end


% Configurações:


figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Letalidade da epidemia',['Municípios do RJ em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init = 10;
max_y = 10000;
max_x = day_axis;

ang = 54;
h1=text(38,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 50;
h2=text(47.7,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 43;
h3=text(57.3,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 39;
h4=text(67,0.9*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k'})

hfonte=text(max_x,max_y,'Fonte: http://painel.saude.rj.gov.br/monitoramento/covid19.html');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 max_x y_init max_y]);
Pos = [250,250,600,450];




% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.26], .2,.15,]);
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
title({'Contágio da epidemia',['Municípios do RJ em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos'],'FontSize',fonte_labels);
ylabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=100;
max_y=100000;
max_x=day_axis;

ang = 54;
h1=text(38,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 50;
h2=text(47.7,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 43;
h3=text(57.3,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 39;
h4=text(67,0.9*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'100','1k','10k','100k'})

hfonte=text(max_x,max_y,'Fonte: http://painel.saude.rj.gov.br/monitoramento/covid19.html');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 max_x y_init max_y]);
Pos = [250,250,600,450];

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.26], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de mortes)',['Municípios do RJ em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Novas mortes por semana'],'FontSize',fonte_labels);
xlabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 50000;
max_y = 5000;
axis([1 max_x 1 max_y]);


set(gca,'YTickLabel',{'1','10','100','1k'})
set(gca,'XTickLabel',{'1','10','100','1k','10k'})

hfonte=text(max_x,max_y,'Fonte: http://painel.saude.rj.gov.br/monitoramento/covid19.html');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);



% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.26], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de casos)',['Municípios do RJ em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Novos casos por semana'],'FontSize',fonte_labels);
xlabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 500000;
max_y = 50000;
axis([10 500000 10 50000]);

set(gca,'YTickLabel',{'10','100','1k','10k'})
set(gca,'XTickLabel',{'10','100','1k','10k','100k'})

hfonte=text(max_x,max_y,'Fonte: http://painel.saude.rj.gov.br/monitoramento/covid19.html');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.26], .2,.15,]);
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
title({'Letalidade semanal da epidemia',['Municípios do RJ em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes']},'FontSize',fonte_labels);
ylabel ({'Novas mortes por semana'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=1;
max_y=10000;
max_x=day_axis;

ang = 47;
h1=text(37.2,0.8*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 44;
h2=text(46.7,0.8*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 39;
h3=text(56,0.8*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 34;
h4=text(65.9,0.8*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k','10k','100k'})

hfonte=text(max_x,max_y,'Fonte: http://painel.saude.rj.gov.br/monitoramento/covid19.html');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 max_x y_init max_y]);
Pos = [250,250,600,450];


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.26], .2,.15,]);
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
title({'Contágio semanal da epidemia',['Municípios do RJ em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases),' casos']},'FontSize',fonte_labels);
ylabel ({'Novos casos por semana'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
y_init=10;
max_y=100000;
max_x=day_axis;

ang = 47;
h1=text(37.2,0.8*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 44;
h2=text(46.7,0.8*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 39;
h3=text(56,0.8*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 34;
h4=text(65.9,0.8*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k'})

hfonte=text(max_x,max_y,'Fonte: http://painel.saude.rj.gov.br/monitoramento/covid19.html');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 max_x y_init max_y]);
Pos = [250,250,600,450];


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.16 -0.26], .2,.15,]);
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
print(figure(1),[pwd '/upload/',name,'/covid19rj_M_ST_NM_AC_VA_',name,'.png'],'-dpng','-r300'); 
print(figure(2),[pwd '/upload/',name,'/covid19rj_M_ST_NC_AC_VA_',name,'.png'],'-dpng','-r300'); 
print(figure(3),[pwd '/upload/',name,'/covid19rj_M_EF_NM_NA_VA_',name,'.png'],'-dpng','-r300'); 
print(figure(4),[pwd '/upload/',name,'/covid19rj_M_EF_NC_NA_VA_',name,'.png'],'-dpng','-r300'); 
print(figure(5),[pwd '/upload/',name,'/covid19rj_M_ST_NM_PS_VA_',name,'.png'],'-dpng','-r300'); 
print(figure(6),[pwd '/upload/',name,'/covid19rj_M_ST_NC_PS_VA_',name,'.png'],'-dpng','-r300'); 

%Controle do github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 
print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NM_NA_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 
print(figure(4),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NC_NA_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 
print(figure(5),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_PS_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 
print(figure(6),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_PS_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 

close all;

copyfile( [pwd '/Dados/cases-brazil-cities-time.txt'], [pwd '/',outputdir,'/cases-brazil-cities-time.txt']);

