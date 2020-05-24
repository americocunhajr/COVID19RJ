clear all;
clc;
close all;


name = 'BR';

all_data = readtable([pwd,'/Dados/dados_br/HIST_PAINEL_COVIDBR_23mai2020.xlsx']);

table = all_data(find(strcmp([all_data.coduf], '76')),:);


y = [table.emAcompanhamentoNovos,table.Recuperadosnovos,table.obitosAcumulado];
dates_aux = datetime([table.data]);
end_time_aux = max(dates_aux);




BRASIL_aux= str2double(y);

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


tend = datetime(2020,5,31,0,0,0);
xlim([tstart tend]);
set(gca, 'XTick', linspace(tstart,tend,7))
datetick('x',19,'keepticks')

ylim([0 400000]);
set(gca,'YTickLabel',{'0','50k','100k','150k','200k','250k','300k','350k','400k'})


legend(strcat("Casos ativos:  ", num2str( sprintf( '%06d', max(BRASIL(:,1)) ))),strcat("Recuperados: ", num2str(sprintf( '%06d', max(BRASIL(:,2)) ))),strcat("Óbitos:           ", num2str( sprintf( '%06d', max(BRASIL(:,3))) )));
legend("location","northwest");

legend("FontSize",9);
ax = gca;
ax.FontSize = 8; 

title({'Evolução dos casos de COVID-19 no Brasil',[datestr(end_time,24)]},'FontSize',10);


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

if (t==1) print(figure(1),[pwd '/upload/',name,'/covid19rj_M_ST_RE_AC_VA_',name,'.png'],'-dpng','-r300'); end

if (t == 1) print(gcf,[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_RE_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); end

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

copyfile( filename, [pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_RE_AC_VA_',name,'_',datestr(end_time_aux,29),'.gif']);

