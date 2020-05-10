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
% - número de novos casos por semana em relação ao total de casos       %
% - número de novas mortes por semana em relação ao total de mortes     %
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

%parâmetro pra legenda (não funcionou)
paises = cell(13,1);

%plot_type é pra diferenciar mortes e casos pra organizarmos a ordem da legenda de acordo com o número de mortes ou de casos
for( plot_type = 1:1:2)
%loop nos 13 países estudados
for( init = 1:1:13)

clearvars -except plot_type init all_data data name paises tot_mortes tot_casos

if (plot_type == 1)
%ordem por países que tem mais morte
if (init == 6) country = 'Brazil'; color = [0,0,0]/255; end
if (init == 10) country = 'China'; color = [69,169,0]/255; end
if (init == 11) country = 'Turkey'; color = [96,209,224]/255; end  
if (init == 13) country = 'Peru'; color = [181,147,87]/255; end
if (init == 9) country = 'Iran'; color = [255,130,113]/255; end
if (init == 8) country = 'Germany'; color = [209,227,105]/255; end
if (init == 12) country = 'Ecuador'; color = [248,187,208]/255; end
if (init == 1) country = 'United States'; color = [0,104,44]/255; end
if (init == 5) country = 'France'; color = [0,45,135]/255; end
if (init == 2) country = 'United Kingdom'; color = [135,85,30]/255; end
if (init == 3) country = 'Italy'; color = [203,63,23]/255; end
if (init == 4) country = 'Spain'; color = [191,171,72]/255; end
if (init == 7) country = 'Belgium'; color = [236,64,122]/255; end

paises{init} =  country;

end

if (plot_type == 2)
%ordem por países que tem mais caso
if (init == 6) country = 'Brazil'; color = [0,0,0]/255; end
if (init == 10) country = 'China'; color = [69,169,0]/255; end
if (init == 8) country = 'Turkey'; color = [96,209,224]/255; end  
if (init == 11) country = 'Peru'; color = [181,147,87]/255; end
if (init == 9) country = 'Iran'; color = [255,130,113]/255; end
if (init == 5) country = 'Germany'; color = [209,227,105]/255; end
if (init == 13) country = 'Ecuador'; color = [248,187,208]/255; end
if (init == 1) country = 'United States'; color = [0,104,44]/255; end
if (init == 7) country = 'France'; color = [0,45,135]/255; end
if (init == 4) country = 'United Kingdom'; color = [135,85,30]/255; end
if (init == 3) country = 'Italy'; color = [203,63,23]/255; end
if (init == 2) country = 'Spain'; color = [191,171,72]/255; end
if (init == 12) country = 'Belgium'; color = [236,64,122]/255; end

end


location = data(find(strcmp([all_data.location], country)),1:8);

dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;

if strcmp(country, 'United States') country = 'USA'; end 
if strcmp(country, 'United Kingdom') country = 'UK'; end 

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

%Criando vetores desde dia zero a partir de X mortes ("_deaths") ou a partir de X casos ("_cases")
%Usuário define dia zero para casos ou mortes
X_deaths_pm = 1;
X_cases_pm = 10;
X_deaths = 100;
X_cases = 1000;

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
fonte_titulo = 10;
fonte_labels = 9;
fonte_padrao = 9; %numeros dos eixos
fonte_location = 8;

if (plot_type == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes por tempo (dia zero definido por mortes)
figure (1);
 n = max(max(size(tot_deaths_X)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_X,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, tot_deaths_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);

tot_mortes(init,1) = max(tot_deaths);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
figure (3);
 n = max(max(size(tot_deaths)));
 fig=loglog(tot_deaths,new_deaths7,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_deaths(n,1), new_deaths7(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas de mortes por tempo (dia zero definido por mortes/milhao)
figure (5);
 n = max(max(size(new_deaths_X)));
 days = 0:1:n-1;
 fig=plot(days,new_deaths7_X,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_deaths7_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);

end

if (plot_type == 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos/milhao por tempo (dia zero definido por casos/milhao)
figure (2);

 n = max(max(size(tot_cases_X)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_X,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, tot_cases_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos (por milhao de hab.)
figure (4);
 n = max(max(size(tot_cases)));
 fig=loglog(tot_cases,new_cases7,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (tot_cases(n,1), new_cases7(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos por tempo (dia zero definido por casos/milhao)
figure (6);

 n = max(max(size(new_cases_X)));
 days = 0:1:n-1;
 fig=plot(days,new_cases7_X,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', 1.25);
 hold on;
 text (n-1, new_cases7_X(n,1), [' ',country],'FontSize',fonte_location,"color",color);


end

end

end


% Configurações:

outputdir = datestr(end_time,29);
if ~exist(outputdir, 'dir')
  mkdir(outputdir);
end


figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Letalidade da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([0 120 100 100000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));




% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.2], .2,.15,]);
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
title({'Contágio da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos'],'FontSize',fonte_labels);
ylabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([0 120 1000 10000000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.2], .2,.15,]);
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
title({'Informativo de progresso da epidemia (mortes)',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Novas mortes por semana'],'FontSize',fonte_labels);
xlabel ("Total de mortes",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([100 1000000 100 100000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));
curtick = get(gca, 'XTick');
set(gca, 'XTickLabel', cellstr(num2str(curtick(:))));

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.2], .2,.15,]);
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
title({'Informativo de progresso da epidemia (casos)',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel(['Novos casos por semana'],'FontSize',fonte_labels);
xlabel ("Total de casos",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([1000 10000000 1000 1000000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));
curtick = get(gca, 'XTick');
set(gca, 'XTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.2], .2,.15,]);
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
title({'Letalidade semanal da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths),' mortes'],'FontSize',fonte_labels);
ylabel ("Novas mortes por semana",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([0 80 1 22000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.2], .2,.15,]);
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
title({'Contágio semanal da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases),' casos'],'FontSize',fonte_labels);
ylabel ("Novos casos por semana",'FontSize',fonte_labels);
legend ("location", "northeastoutside");
axis([0 80 10 230000]);
Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.2], .2,.15,]);
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



saveas(figure(1),[pwd '/',outputdir,'/',name,'_letalidade-abs_',datestr(end_time,29),'.png']);
saveas(figure(2),[pwd '/',outputdir,'/',name,'_contagio-abs_',datestr(end_time,29),'.png']);
saveas(figure(3),[pwd '/',outputdir,'/',name,'_informativo-mortes-abs_',datestr(end_time,29),'.png']);
saveas(figure(4),[pwd '/',outputdir,'/',name,'_informativo-casos-abs_',datestr(end_time,29),'.png']);
saveas(figure(5),[pwd '/',outputdir,'/',name,'_letalidade-semanal-abs_',datestr(end_time,29),'.png']);
saveas(figure(6),[pwd '/',outputdir,'/',name,'_contagio_semanal-abs_',datestr(end_time,29),'.png']);


close all
