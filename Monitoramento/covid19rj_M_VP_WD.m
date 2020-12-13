clear all
close all
clc

%nome que aparece nos arquivos
name = 'WD';

% fullURL = ['https://covid.ourworldindata.org/data/owid-covid-data.csv'];
% filename = 'owid-covid-data.csv';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

%Lendo o arquivo disponível no site 
all_data = readtable([pwd '/Dados/owid-covid-data.csv']);
data = [all_data.total_cases,all_data.new_cases,all_data.total_deaths,all_data.new_deaths,all_data.total_cases_per_million,all_data.new_cases_per_million,all_data.total_deaths_per_million,all_data.new_deaths_per_million];

for( plot_type = 1:1:2)
for( init = 1:1:16)

clearvars -except init all_data data name plot_type 

linew = 1.25;

if (plot_type == 1)
%ordem por países que tem mais morte
if (init == 3) country = 'Brazil'; color = [0,0,0]/255; linew = 1.75; end
if (init == 9) country = 'India'; color = [69,169,0]/255; end
if (init == 16) country = 'Turkey'; color = [96,209,224]/255; end  
if (init == 12) country = 'Peru'; color = [181,147,87]/255; end
if (init == 10) country = 'Iran'; color = [255,130,113]/255; end
if (init == 1) country = 'Germany'; color = [209,227,105]/255; end
if (init == 4) country = 'Chile'; color = [248,187,208]/255; end
if (init == 7) country = 'United States'; color = [0,104,44]/255; end
if (init == 8) country = 'France'; color = [0,45,135]/255; end
if (init == 13) country = 'United Kingdom'; color = [135,85,30]/255; end
if (init == 11) country = 'Italy'; color = [203,63,23]/255; end
if (init == 6) country = 'Spain'; color = [191,171,72]/255; end
if (init == 2) country = 'Belgium'; color = [236,64,122]/255; end
if (init == 14) country = 'Russia'; color = [0.4,0.4,0.4]; end
if (init == 15) country = 'Sweden'; color = [0,0.5,0.6]; end
if (init == 5) country = 'China'; color = [185,205,140]/255; end
location = data(find(strcmp([all_data.location], country)),1:8);

dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;

if strcmp(country, 'United States') country = 'EUA             '; end 
if strcmp(country, 'United Kingdom') country = 'Reino Unido'; end
if strcmp(country, 'Belgium') country = 'Bélgica       '; end 
if strcmp(country, 'Brazil') country = 'Brasil          '; end 
if strcmp(country, 'Iran') country = 'Irã               '; end 
if strcmp(country, 'Peru') country = 'Peru            '; end 
if strcmp(country, 'Turkey') country = 'Turquia        '; end 
if strcmp(country, 'India') country = 'Índia           '; end 
if strcmp(country, 'Chile') country = 'Chile           '; end 
if strcmp(country, 'France') country = 'França         '; end 
if strcmp(country, 'Spain') country = 'Espanha      '; end 
if strcmp(country, 'Italy') country = 'Itália           '; end 
if strcmp(country, 'Germany') country = 'Alemanha   '; end 
if strcmp(country, 'Russia') country = 'Rússia         '; end 
if strcmp(country, 'Sweden') country = 'Suécia         '; end 
if strcmp(country, 'China') country = 'China          '; end 
end

if (plot_type == 2)
%ordem por países que tem mais morte
if (init == 3) country = 'Brazil'; color = [0,0,0]/255; linew = 1.75; end
if (init == 9) country = 'India'; color = [69,169,0]/255; end
if (init == 16) country = 'Turkey'; color = [96,209,224]/255; end  
if (init == 12) country = 'Peru'; color = [181,147,87]/255; end
if (init == 10) country = 'Iran'; color = [255,130,113]/255; end
if (init == 1) country = 'Germany'; color = [209,227,105]/255; end
if (init == 4) country = 'Chile'; color = [248,187,208]/255; end
if (init == 7) country = 'United States'; color = [0,104,44]/255; end
if (init == 8) country = 'France'; color = [0,45,135]/255; end
if (init == 13) country = 'United Kingdom'; color = [135,85,30]/255; end
if (init == 11) country = 'Italy'; color = [203,63,23]/255; end
if (init == 6) country = 'Spain'; color = [191,171,72]/255; end
if (init == 2) country = 'Belgium'; color = [236,64,122]/255; end
if (init == 14) country = 'Russia'; color = [0.4,0.4,0.4]; end
if (init == 15) country = 'Sweden'; color = [0,0.5,0.6]; end
if (init == 5) country = 'China'; color = [185,205,140]/255; end
location = data(find(strcmp([all_data.location], country)),1:8);

dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;

if strcmp(country, 'United States') country = 'EUA             '; end 
if strcmp(country, 'United Kingdom') country = 'Reino Unido'; end
if strcmp(country, 'Belgium') country = 'Bélgica       '; end 
if strcmp(country, 'Brazil') country = 'Brasil          '; end 
if strcmp(country, 'Iran') country = 'Irã               '; end 
if strcmp(country, 'Peru') country = 'Peru            '; end 
if strcmp(country, 'Turkey') country = 'Turquia        '; end 
if strcmp(country, 'India') country = 'Índia           '; end 
if strcmp(country, 'Chile') country = 'Chile           '; end 
if strcmp(country, 'France') country = 'França         '; end 
if strcmp(country, 'Spain') country = 'Espanha      '; end 
if strcmp(country, 'Italy') country = 'Itália           '; end 
if strcmp(country, 'Germany') country = 'Alemanha   '; end 
if strcmp(country, 'Russia') country = 'Rússia         '; end 
if strcmp(country, 'Sweden') country = 'Suécia         '; end 
if strcmp(country, 'China') country = 'China          '; end 
end

tot_cases = location(:,1);
new_cases = location(:,2);
tot_deaths = location(:,3);
new_deaths = location(:,4);

tot_cases_pm = location(:,5);
new_cases_pm = location(:,6);
tot_deaths_pm = location(:,7);
new_deaths_pm = location(:,8);

%consolidando os novos casos e mortes por semana
for (i=7:1:max(max(size(dates))) ) 
new_cases7(i,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(i,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
new_cases7_pm(i,1) = new_cases_pm(i,1)+new_cases_pm(i-1,1)+new_cases_pm(i-2,1)+new_cases_pm(i-3,1)+new_cases_pm(i-4,1)+new_cases_pm(i-5,1)+new_cases_pm(i-6,1);
new_deaths7_pm(i,1) = new_deaths_pm(i,1)+new_deaths_pm(i-1,1)+new_deaths_pm(i-2,1)+new_deaths_pm(i-3,1)+new_deaths_pm(i-4,1)+new_deaths_pm(i-5,1)+new_deaths_pm(i-6,1);
tot_cases7(i,1) = tot_cases(i,1)+tot_cases(i-1,1)+tot_cases(i-2,1)+tot_cases(i-3,1)+tot_cases(i-4,1)+tot_cases(i-5,1)+tot_cases(i-6,1);
tot_deaths7(i,1) = tot_deaths(i,1)+tot_deaths(i-1,1)+tot_deaths(i-2,1)+tot_deaths(i-3,1)+tot_deaths(i-4,1)+tot_deaths(i-5,1)+tot_deaths(i-6,1);

end


perc_deaths = 100 * new_deaths7(8:end,:) ./ tot_deaths(1:(end-7));
perc_cases = 100 * new_cases7(8:end,:) ./ tot_cases(1:(end-7));




%Fontes
fonte_titulo = 10.5;
fonte_labels = 10;
fonte_padrao = 9; %numeros dos eixos
fonte_location = 8;

Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

if(plot_type == 1)
figure(1)
fig=plot(dates(8:end,:),perc_deaths,'DisplayName',[country,'  ',num2str((perc_deaths(max(size(perc_deaths)),1)),'%.2f'),' %'],"color",color,'LineWidth', linew);
 text (dates(max(size(dates)),1), perc_deaths(max(size(perc_deaths)),1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

 hold on;
end

if(plot_type == 2)
 figure(2)
 fig=plot(dates(8:end,:),perc_cases(1:end,:),'DisplayName',[country,'  ',num2str((perc_cases(max(size(perc_deaths)),1)),'%.2f'),' %'],"color",color,'LineWidth', linew);
 text (dates(max(size(dates)),1), perc_cases(max(size(perc_cases)),1), [' ',country],'FontSize',fonte_location,"color",color,"Clipping",'on');

 hold on;
end

end

end


figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Percentual de novas mortes por semana em relação ao total',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northeastoutside");
tstart = datetime(2020,4,1,0,0,0);
tend = datetime(2020,12,23,0,0,0);
xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,10))
datetick('x',19,'keepticks')
ylim([0 120]);

yticks([0 20 40 60 80 100 120]);
set(gca,'YTickLabel',{'0','20%','40%','60%','80%','100%','120%'})

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.13], .2,.15,]);
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

figure(2)

set(gca,'FontSize',fonte_padrao)
title({'Percentual de novos casos por semana em relação ao total',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northeastoutside");
tstart = datetime(2020,4,1,0,0,0);
tend = datetime(2020,12,23,0,0,0);
xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,10))
datetick('x',19,'keepticks')
ylim([0 120]);


yticks([0 20 40 60 80 100 120]);
set(gca,'YTickLabel',{'0','20%','40%','60%','80%','100%','120%'})

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.13 -0.13], .2,.15,]);
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

print(figure(1),[pwd '/upload/',name,'/covid19rj_M_VP_NM_NA_VA_',name,'.png'],'-dpng','-r300'); 
print(figure(2),[pwd '/upload/',name,'/covid19rj_M_VP_NC_NA_VA_',name,'.png'],'-dpng','-r300'); 

print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_VP_NM_NA_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_VP_NC_NA_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); 

close all
