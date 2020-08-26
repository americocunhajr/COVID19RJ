clear all;
clc;
close all;

%Lendo o arquivo disponível no site 
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
% filename = 'cases-brazil-states.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

name = 'BR';

all_data = readtable([pwd,'/Dados/cases-brazil-states.txt']);

table = all_data(find(strcmp([all_data.state], 'TOTAL')),:);


y = [table.totalCases - table.recovered-table.deaths,table.recovered,table.deaths];
dates_aux = datetime([table.date]);
end_time_aux = max(dates_aux);




BRASIL_aux= y;%str2double(y);

tstart = datetime(2020,4,19,0,0,0);
tend = end_time_aux;
nt = datenum(tend - tstart)+1;

for (t=nt:-1:1)
h = figure('Position',[250,250,600,450]);


clearvars BRASIL dates;
BRASIL = BRASIL_aux([1:max(size(BRASIL_aux))-t+1],:);
dates = dates_aux([1:max(size(dates_aux))-t+1],:);

end_time = max(dates);

b = bar(dates,BRASIL,'stacked')

b(1).FaceColor = [0.9290 0.6940 0.1250];
b(2).FaceColor = [0 0.4470 0.7410];
b(3).FaceColor = [0.8500 0.3250 0.0980];

b(1).EdgeColor = [0.9290 0.6940 0.1250];
b(2).EdgeColor = [0 0.4470 0.7410];
b(3).EdgeColor = [0.8500 0.3250 0.0980];


tend = datetime(2020,9,6,0,0,0);
xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,11))
datetick('x',19,'keepticks')
max_x=tend;
max_y=4000000;
ylim([0 max_y]);
set(gca, 'YTick', 0:500000:max_y)
set(gca,'YTickLabel',{'0','500k','1M','1.5M','2M','2.5M','3M','3.5M','4M'})


legend(strcat("Casos ativos:  ", num2str( sprintf( '%07d', max(BRASIL(:,1)) ))),strcat("Recuperados: ", num2str(sprintf( '%07d', max(BRASIL(:,2)) ))),strcat("Óbitos:           ", num2str( sprintf( '%07d', max(BRASIL(:,3))) )));
legend("location","northwest");

legend("FontSize",9);
ax = gca;
ax.FontSize = 8; 

title({'Evolução dos casos de COVID-19 no Brasil',[datestr(end_time,24)]},'FontSize',10);

hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.6 -0.52], .255,.13,]);
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

outputdir = datestr(end_time_aux,29);
if ~exist([pwd,'/',outputdir], 'dir')
  mkdir([pwd,'/',outputdir]);
end

outputdir2 = name;
if ~exist([pwd,'/',outputdir,'/',outputdir2], 'dir')
  mkdir([pwd,'/',outputdir,'/',outputdir2]);
end

if (t==1) print(figure(1),[pwd '/upload/',name,'/covid19rj_M_ST_RE_AC_VA_',name,'.png'],'-dpng','-r400'); end

if (t == 1) print(gcf,[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_RE_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); end

%dates(end,:) = [];
%BRASIL(end,:) = [];

filename = [pwd '/upload/',name,'/covid19rj_M_ST_RE_AC_VA_',name,'.gif'];


      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if t == nt 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 

      if t == 1
          imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',2);
      end

close all
end


%Gráfico de linhas
casos = table.totalCases;
mortes = table.deaths;
recuperados = table.recovered;
ativos = casos - mortes - recuperados;

all = [casos,ativos,recuperados,mortes];
y = all(find(strcmp([table.state], 'TOTAL')),:);
dates_aux = datetime(table.date(find(strcmp([table.state], 'TOTAL')),:));
end_time_aux = max(dates_aux);


BRASIL_aux= y;
clearvars BRASIL dates;
BRASIL = BRASIL_aux([1:max(size(BRASIL_aux))],:);
dates = dates_aux([1:max(size(dates_aux))],:);

end_time = max(dates);
h = figure('Position',[250,250,600,450]);
p0 = plot(dates,BRASIL(:,1),'linewidth',2,'color',[0,0,0]);
hold on
p1 = plot(dates,BRASIL(:,2),'linewidth',2,'color',[0.9290 0.6940 0.1250]);
hold on
p2 = plot(dates,BRASIL(:,3),'linewidth',2,'color',[0 0.4470 0.7410]);
hold on
p3 = plot(dates,BRASIL(:,4),'linewidth',2,'color',[0.8500 0.3250 0.0980]);

tend = datetime(2020,9,6,0,0,0);
xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,11))
datetick('x',19,'keepticks')
max_x=tend;
max_y=4000000;
ylim([0 max_y]);
set(gca, 'YTick', 0:500000:max_y)
set(gca,'YTickLabel',{'0','500k','1M','1.5M','2M','2.5M','3M','3.5M','4M'})


legend(strcat("Total de casos: ", num2str(sprintf( '%07d', max(BRASIL(:,1)) ))),strcat("Casos ativos:    ", num2str( sprintf( '%07d', max(BRASIL(:,2)) ))), strcat("Recuperados:   ", num2str(sprintf( '%07d', max(BRASIL(:,3)) ))),strcat("Óbitos:             ", num2str( sprintf( '%07d', max(BRASIL(:,4))) )));
legend("location","northwest");

legend("FontSize",9);
ax = gca;
ax.FontSize = 8; 

title({'Evolução dos casos de COVID-19 no Brasil',[datestr(end_time,24)]},'FontSize',10);

hfonte=text(max_x,max_y,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.6 -0.48], .255,.13,]);
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

print(figure(1),[pwd '/upload/',name,'/covid19rj_M_ST_RE_AC_NA_',name,'.png'],'-dpng','-r400'); 
print(gcf,[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_RE_AC_NA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 

close all

copyfile( filename, [pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_RE_AC_VA_',name,'_',datestr(end_time_aux,29),'.gif']);

