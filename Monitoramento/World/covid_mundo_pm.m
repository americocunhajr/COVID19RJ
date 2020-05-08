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
% - número de casos por milhão em relação ao tempo desde 100 casos por  %
% milhão;                                                               %
% - número de mortes por milhão em relação ao tempo desde 10 mortes por %
% milhão;                                                               %
% - número de novos casos por semana em relação ao total de casos (por  %
% milhão de habitantes);                                                %
% - número de novas mortes por semana em relação ao total de mortes     %
% (por milhão de habitantes).                                           %
%                                                                       %
% Você precisará do arquivo "owid-covid-data.csv" encontrados em        %
% https://ourworldindata.org/coronavirus-source-data                    %
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
close all;

%nome que aparece nos arquivos
name = 'paises';

%Lendo o arquivo disponível no site 
all_data = readtable('owid-covid-data.csv');
data = table2array(all_data(:,4:end));

for( init = 1:1:13)

clearvars -except init all_data data name 

if (init == 1) country = 'Brazil'; color = [0,0,0]/255; end
if (init == 2) country = 'China'; color = [69,169,0]/255; end
if (init == 3) country = 'Turkey'; color = [96,209,224]/255; end  
if (init == 4) country = 'Peru'; color = [181,147,87]/255; end
if (init == 5) country = 'Iran'; color = [255,130,113]/255; end
if (init == 6) country = 'Germany'; color = [209,227,105]/255; end
if (init == 7) country = 'Ecuador'; color = [248,187,208]/255; end
if (init == 8) country = 'United States'; color = [0,104,44]/255; end
if (init == 9) country = 'France'; color = [0,45,135]/255; end
if (init == 10) country = 'United Kingdom'; color = [135,85,30]/255; end
if (init == 11) country = 'Italy'; color = [203,63,23]/255; end
if (init == 12) country = 'Spain'; color = [191,171,72]/255; end
if (init == 13) country = 'Belgium'; color = [236,64,122]/255; end




location = data(find(strcmp([all_data.location], country)),1:8);

dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;

tot_cases = location(:,1);
new_cases = location(:,2);
tot_deaths = location(:,3);
new_deaths = location(:,4);

tot_cases_pm = location(:,5);
new_cases_pm = location(:,6);
tot_deaths_pm = location(:,7);
new_deaths_pm = location(:,8);

%consolidando os novos casos e mortes por semana
new_cases7 = new_cases;
for (i=7:1:max(max(size(dates))) ) 
new_cases7(i,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(i,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
new_cases7_pm(i,1) = new_cases_pm(i,1)+new_cases_pm(i-1,1)+new_cases_pm(i-2,1)+new_cases_pm(i-3,1)+new_cases_pm(i-4,1)+new_cases_pm(i-5,1)+new_cases_pm(i-6,1);
new_deaths7_pm(i,1) = new_deaths_pm(i,1)+new_deaths_pm(i-1,1)+new_deaths_pm(i-2,1)+new_deaths_pm(i-3,1)+new_deaths_pm(i-4,1)+new_deaths_pm(i-5,1)+new_deaths_pm(i-6,1);
end

%Criando vetores desde dia zero a partir de X mortes/milhao ("_deaths") ou a partir de X casos/milhao ("_cases")
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
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_cases(i,1) >= X_cases)
n=n+1;
tot_cases_X(n,1) = tot_cases(i,1);
new_cases_X(n,1) = new_cases(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_cases_pm(i,1) >= X_cases_pm)
n=n+1;
tot_cases_pmX(n,1) = tot_cases_pm(i,1);
new_cases_pmX(n,1) = new_cases_pm(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_deaths_pm(i,1) >= X_deaths_pm)
n=n+1;
tot_deaths_pmX(n,1) = tot_deaths_pm(i,1);
new_deaths_pm(n,1) = new_deaths_pm(i,1);
end
end




%Fontes
fonte_titulo = 10;
fonte_labels = 9;
fonte_padrao = 9; %numeros dos eixos
fonte_location = 8;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (1);
 n = max(max(size(tot_deaths_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_pmX,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color);
 hold on;
 text (n-1, tot_deaths_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos/milhao por tempo (dia zero definido por casos/milhao)
figure (2);

 n = max(max(size(tot_cases_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_pmX,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color);
 hold on;
 text (n-1, tot_cases_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
figure (3);
 n = max(max(size(tot_deaths_pm)));
 fig=loglog(tot_deaths_pm,new_deaths7_pm,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color);
 hold on;
 text (tot_deaths_pm(n,1), new_deaths7_pm(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos (por milhao de hab.)
figure (4);
 n = max(max(size(tot_cases_pm)));
 fig=loglog(tot_cases_pm,new_cases7_pm,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color);
 hold on;
 text (tot_cases_pm(n,1), new_cases7_pm(n,1), [' ',country],'FontSize',fonte_location,"color",color);


end


% Configurações:

figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Letalidade da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([0 100 1 1000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.15 -0.2], .2,.15,]);
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

saveas(gcf,[name,'_letalidade-pm_',datestr(end_time,29),'.png']);


figure (2)

set(gca,'FontSize',fonte_padrao)
title({'Contágio da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([0 110 10 10000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.15 -0.2], .2,.15,]);
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

saveas(gcf,[name,'_contagio-pm_',datestr(end_time,29),'.png']);

figure (3)

set(gca,'FontSize',fonte_padrao);
title({'Informativo de progresso da epidemia (número de mortes por milhão de habitantes)',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Novas mortes por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([1 10000 1 1000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.15 -0.2], .2,.15,]);
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

saveas(gcf,[name,'_informativo-mortes-pm_',datestr(end_time,29),'.png']);

figure (4)

set(gca,'FontSize',fonte_padrao);
title({'Informativo de progresso da epidemia (número de casos por milhão de habitantes)',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Novos casos por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([10 100000 10 10000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.15 -0.2], .2,.15,]);
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

saveas(gcf,[name,'_informativo-casos-pm_',datestr(end_time,29),'.png']);

