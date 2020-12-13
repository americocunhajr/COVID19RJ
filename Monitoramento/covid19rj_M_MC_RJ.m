clear all
close all
clc


malu = [1	1	1
0.964	0.992	1
0.928	0.984	1
0.892	0.976	1
0.856	0.968	1
0.82	0.96	1
0.784	0.952	1
0.748	0.944	1
0.712	0.936	1
0.676	0.928	1
0.64	0.92	1
0.604	0.912	1
0.568	0.904	1
0.532	0.896	1
0.496	0.888	1
0.46	0.88	1
0.424	0.872	1
0.388	0.864	1
0.352	0.856	1
0.316	0.848	1
0.28	0.84	1
0.244	0.832	1
0.208	0.824	1
0.172	0.816	1
0.136	0.808	1
0.1	0.8	1
0.108	0.804	0.99
0.116	0.808	0.98
0.124	0.812	0.97
0.132	0.816	0.96
0.14	0.82	0.95
0.148	0.824	0.94
0.156	0.828	0.93
0.164	0.832	0.92
0.172	0.836	0.91
0.18	0.84	0.9
0.188	0.844	0.89
0.196	0.848	0.88
0.204	0.852	0.87
0.212	0.856	0.86
0.22	0.86	0.85
0.228	0.864	0.84
0.236	0.868	0.83
0.244	0.872	0.82
0.252	0.876	0.81
0.26	0.88	0.8
0.268	0.884	0.79
0.276	0.888	0.78
0.284	0.892	0.77
0.292	0.896	0.76
0.3	0.9	0.75
0.308	0.904	0.74
0.316	0.908	0.73
0.324	0.912	0.72
0.332	0.916	0.71
0.34	0.92	0.7
0.348	0.924	0.69
0.356	0.928	0.68
0.364	0.932	0.67
0.372	0.936	0.66
0.38	0.94	0.65
0.388	0.944	0.64
0.396	0.948	0.63
0.404	0.952	0.62
0.412	0.956	0.61
0.42	0.96	0.6
0.428	0.964	0.59
0.436	0.968	0.58
0.444	0.972	0.57
0.452	0.976	0.56
0.46	0.98	0.55
0.468	0.984	0.54
0.476	0.988	0.53
0.484	0.992	0.52
0.492	0.996	0.51
0.5	1	0.5
0.51	1	0.49
0.52	1	0.48
0.53	1	0.47
0.54	1	0.46
0.55	1	0.45
0.56	1	0.44
0.57	1	0.43
0.58	1	0.42
0.59	1	0.41
0.6	1	0.4
0.61	1	0.39
0.62	1	0.38
0.63	1	0.37
0.64	1	0.36
0.65	1	0.35
0.66	1	0.34
0.67	1	0.33
0.68	1	0.32
0.69	1	0.31
0.7	1	0.3
0.71	1	0.29
0.72	1	0.28
0.73	1	0.27
0.74	1	0.26
0.75	1	0.25
0.76	1	0.24
0.77	1	0.23
0.78	1	0.22
0.79	1	0.21
0.8	1	0.2
0.81	1	0.19
0.82	1	0.18
0.83	1	0.17
0.84	1	0.16
0.85	1	0.15
0.86	1	0.14
0.87	1	0.13
0.88	1	0.12
0.89	1	0.11
0.9	1	0.1
0.910000000000001	1	0.09
0.92	1	0.08
0.930000000000001	1	0.07
0.940000000000001	1	0.06
0.950000000000001	1	0.05
0.960000000000001	1	0.04
0.970000000000001	1	0.03
0.980000000000001	1	0.02
0.990000000000001	1	0.01
1	1	0
1	0.99	0
1	0.98	0
1	0.97	0
1	0.96	0
1	0.95	0
1	0.94	0
1	0.93	0
1	0.92	0
1	0.91	0
1	0.9	0
1	0.89	0
1	0.88	0
1	0.87	0
1	0.86	0
1	0.85	0
1	0.84	0
1	0.83	0
1	0.82	0
1	0.81	0
1	0.8	0
1	0.79	0
1	0.78	0
1	0.77	0
1	0.76	0
1	0.75	0
1	0.74	0
1	0.73	0
1	0.72	0
1	0.71	0
1	0.7	0
1	0.69	0
1	0.68	0
1	0.67	0
1	0.66	0
1	0.65	0
1	0.64	0
1	0.63	0
1	0.62	0
1	0.61	0
1	0.6	0
1	0.59	0
1	0.58	0
1	0.57	0
1	0.56	0
1	0.55	0
1	0.54	0
1	0.53	0
1	0.52	0
1	0.51	0
1	0.5	0
1	0.49	0
1	0.48	0
1	0.47	0
1	0.46	0
1	0.45	0
1	0.44	0
1	0.43	0
1	0.42	0
1	0.41	0
1	0.4	0
1	0.39	0
1	0.38	0
1	0.37	0
1	0.36	0
1	0.35	0
1	0.34	0
1	0.33	0
1	0.32	0
1	0.31	0
1	0.3	0
1	0.29	0
1	0.28	0
1	0.27	0
1	0.26	0
1	0.25	0
1	0.24	0
1	0.23	0
1	0.22	0
1	0.21	0
1	0.2	0
1	0.19	0
1	0.18	0
1	0.17	0
1	0.16	0
1	0.15	0
1	0.14	0
1	0.13	0
1	0.12	0
1	0.11	0
1	0.1	0
1	0.09	0
1	0.08	0
1	0.07	0
1	0.06	0
1	0.05	0
1	0.04	0
1	0.03	0
1	0.02	0
1	0.009999999999999	0
1	0	0
0.99	0	0
0.979999999999999	0	0
0.969999999999999	0	0
0.959999999999998	0	0
0.949999999999997	0	0
0.939999999999997	0	0
0.929999999999996	0	0
0.919999999999995	0	0
0.909999999999994	0	0
0.899999999999994	0	0
0.889999999999993	0	0
0.879999999999992	0	0
0.869999999999992	0	0
0.859999999999991	0	0
0.84999999999999	0	0
0.839999999999989	0	0
0.829999999999989	0	0
0.819999999999988	0	0
0.809999999999987	0	0
0.799999999999987	0	0
0.789999999999986	0	0
0.779999999999985	0	0
0.769999999999985	0	0
0.759999999999984	0	0
0.749999999999983	0	0
0.739999999999982	0	0
0.729999999999982	0	0
0.719999999999981	0	0
0.70999999999998	0	0
0.69999999999998	0	0
0.689999999999979	0	0
0.679999999999978	0	0
0.669999999999978	0	0
0.659999999999977	0	0
0.649999999999976	0	0
0.639999999999975	0	0
0.629999999999975	0	0
0.619999999999974	0	0
0.609999999999973	0	0
0.599999999999973	0	0
0.589999999999972	0	0
0.579999999999971	0	0
0.569999999999971	0	0
0.55999999999997	0	0
0.549999999999969	0	0
0.539999999999969	0	0
0.529999999999968	0	0
0.519999999999967	0	0
0.509999999999967	0	0
0.499999999999966	0	0

];

%Fontes de dados
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities-time.csv'];
% filename = 'cases-brazil-cities-time.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

arquivogeral = readtable([pwd, '/Dados/cases-brazil-cities-time.csv']);

% Definições para os graficos 
Estados = {
"Angra dos Reis/RJ";
"Barra Mansa/RJ";
"Belford Roxo/RJ";
"Cabo Frio/RJ";
"Cachoeiras de Macacu/RJ";
"Campos dos Goytacazes/RJ";
"Duque de Caxias/RJ";
"Iguaba Grande/RJ";
"Itaboraí/RJ";
"Itaguaí/RJ";
"Macaé/RJ";
"Magé/RJ";
"Maricá/RJ";
"Mesquita/RJ";
"Nilópolis/RJ";
"Niterói/RJ";
"Nova Friburgo/RJ";
"Nova Iguaçu/RJ";
"Paracambi/RJ";
"Petrópolis/RJ";
"Queimados/RJ";
"Resende/RJ";
"Rio das Ostras/RJ";
"Rio de Janeiro/RJ";
"São Gonçalo/RJ";
"São João de Meriti/RJ";
"Saquarema/RJ";
"Tanguá/RJ";
"Teresópolis/RJ";
"Volta Redonda/RJ";
};

titulos = {"Novos Casos";"Novos Óbitos";"Casos Acumulados";"Óbitos Acumulados"};
name = 'RJ';


% Encontrando data inicial
min_casos_acum_consider = 1;
max_size = 1;
for i=1:length(Estados)
    I_estado=find(arquivogeral.city == string(Estados(i,:)));
    tabela = arquivogeral(I_estado,:);
    I = find(tabela.totalCases>= min_casos_acum_consider);
    max_size = max([max(size(I));max_size])
end

% Extraindo dados
img_casos_diarios = zeros(length(Estados),max_size);
img_casos_acumulados = zeros(length(Estados),max_size);
img_obitos_diarios = zeros(length(Estados),max_size);
img_obitos_acumulados = zeros(length(Estados),max_size);


%Gerando matrizes para os 4: caso e obitos x diario e acumulados
for i=1:length(Estados)
    I_estado=find(arquivogeral.city == string(Estados(i,:)));
    tabela_aux = arquivogeral(I_estado,:);
    tabela = tabela_aux;
    img_casos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.newCases;
    img_obitos_diarios(i,max_size-height(tabela_aux)+1:end) = tabela.newDeaths;
    img_casos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.totalCases;
    img_obitos_acumulados(i,max_size-height(tabela_aux)+1:end) = tabela.deaths;
end

%Acumulando por semana
new_cases = img_casos_diarios';
new_deaths = img_obitos_diarios';
for (i=7:1:size(img_casos_diarios,2) ) 
new_cases7(i,:) = new_cases(i,:) + new_cases(i-1,:) + new_cases(i-2,:) + new_cases(i-3,:) + new_cases(i-4,:) + new_cases(i-5,:) + new_cases(i-6,:);
new_deaths7(i,:) = new_deaths(i,:) + new_deaths(i-1,:) + new_deaths(i-2,:) + new_deaths(i-3,:) + new_deaths(i-4,:) + new_deaths(i-5,:) + new_deaths(i-6,:);
end
img_casos_diarios = new_cases7';
img_obitos_diarios = new_deaths7';


% Apresentacao
for t=1:4    
    switch t
        case 1
            img = img_casos_diarios;
        case 2
            img = img_obitos_diarios;
        case 3
            img = img_casos_acumulados;
        case 4
            img = img_obitos_acumulados;
    end

%Normalizando os dados
    img_max = zeros(size(img,1),1);
    for i =1:size(img,1)
        img_max(i) = max(max(img(i,:)));
        img(i,:) = img(i,:)/img_max(i);
    end

%Criando a barra com a escala
    img_Max = max(max(img_max));
    width_bar = size(img,1);
    bar_img = zeros(width_bar);
    for i =1:size(img,1)
     bar_img(i,1:max(1,round((img_max(i)/img_Max)*width_bar))) = ones(1,max(1,round((img_max(i)/img_Max)*width_bar)));
    end

    % Juntando o mapa e a escala
    space_imag = 1500;
    img_lins = 4140;
    img_cols = 14*img_lins/9;
    imagem = resizem(img,[img_lins,img_cols]);
    img_lista = resizem(bar_img, round([img_lins, img_lins/6]));
    img_composta = [imagem, zeros(size(imagem,1),space_imag), img_lista];
    img_composta = (255)*img_composta;
    img_composta(8:7,12:11) = (255)+1;

    % Apresentacao da imagem

    figure;

    imshow(uint8(img_composta),'Colormap',malu);

%Config.
    ax1 = gca;
    ax1.FontSize = 10;

Estados = {
"Angra dos Reis";
"Barra Mansa";
"Belford Roxo";
"Cabo Frio";
"Cachoeiras de Macacu";
"Campos dos Goytacazes";
"Duque de Caxias";
"Iguaba Grande";
"Itaboraí";
"Itaguaí";
"Macaé";
"Magé";
"Maricá";
"Mesquita";
"Nilópolis";
"Niterói";
"Nova Friburgo";
"Nova Iguaçu";
"Paracambi";
"Petrópolis";
"Queimados";
"Resende";
"Rio das Ostras";
"Rio de Janeiro (capital)";
"São Gonçalo";
"São João de Meriti";
"Saquarema";
"Tanguá";
"Teresópolis";
"Volta Redonda";
};

% Insercao de textos
position = [round([0:size(imagem,1)/(size(img,1)):size(imagem,1)-(size(imagem,1)/(size(img,1)))] +(size(imagem,1)/(2*size(img,1))))];
    for (i=1:1:max(size(Estados)));
        %text (-2,position(i),Estados(i));
        text (size(imagem,2)+50,position(i),Estados(i));
    end

text((size(imagem,2) + space_imag),-55,'  Máx. valor');

hfonte=text((size(imagem,2) + space_imag+size(img_lista,2)),0,'Fonte: https://covid19br.wcota.me/');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


    axis on;
    set(gca,'TickDir','in');
    set(gca,'ytick',[]);
    set(gca,'YTickLabel',[]);
    %yticks([round([0:size(imagem,1)/(size(img,1)):size(imagem,1)-(size(imagem,1)/(size(img,1)))] +(size(imagem,1)/(2*size(img,1))))]);
    %yticklabels(Estados);
    x_indices = round([1:((size(img,2))-1)/5:size(img,2)]);
    xticks([round(x_indices*(img_cols/(size(img,2)))), (size(imagem,2) + space_imag) + round([1:(size(img_lista,2)-1)/2:size(img_lista,2)])]);

    end_date = max(arquivogeral.date);
    dates = datestr(datenum(end_date)-(max_size-x_indices),20);
 
    set(gca,'XTickLabel',{dates,0,num2str(round(max(img_max)/2)),num2str(max(img_max))})

xtickangle(45);
    
    colorbar('Ticks',[0,51,102,153,204,255],...
         'TickLabels',{'0','0.2','0.4','0.6','0.8','1'})



if (t == 2) title({'Novas mortes por semana',['Municípios do RJ em ',datestr(tabela.date(length(tabela.date)),24)]},'FontSize',12); end
if (t == 1) title({'Novos casos por semana',['Municípios do RJ em ',datestr(tabela.date(length(tabela.date)),24)]},'FontSize',12); end
if (t == 4) title({'Mortes acumuladas',['Municípios do RJ em ',datestr(tabela.date(length(tabela.date)),24)]},'FontSize',12); end
if (t == 3) title({'Casos acumulados',['Municípios do RJ em ',datestr(tabela.date(length(tabela.date)),24)]},'FontSize',12); end


hold on

% pra botar o logo no inferior direito
ax2 = axes;
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.69 -0.655], .165,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (ax2,map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')
  %%Hide the top axes
  ax2.Visible = 'off';
  ax2.XTick = [];
  ax2.YTick = [];  
    
end_time = max(arquivogeral.date);

outputdir = datestr(end_time,29);
if ~exist([pwd,'/',outputdir], 'dir')
  mkdir([pwd,'/',outputdir]);
end

outputdir2 = name;
if ~exist([pwd,'/',outputdir,'/',outputdir2], 'dir')
  mkdir([pwd,'/',outputdir,'/',outputdir2]);
end
 
if (t == 1) print(gcf,[pwd '/upload/',name,'/covid19rj_M_MC_NC_PS_VA_',name,'.png'],'-dpng','-r300'); end
if (t == 2) print(gcf,[pwd '/upload/',name,'/covid19rj_M_MC_NM_PS_VA_',name,'.png'],'-dpng','-r300'); end
if (t == 3) print(gcf,[pwd '/upload/',name,'/covid19rj_M_MC_NC_AC_VA_',name,'.png'],'-dpng','-r300'); end
if (t == 4) print(gcf,[pwd '/upload/',name,'/covid19rj_M_MC_NM_AC_VA_',name,'.png'],'-dpng','-r300'); end

if (t == 1) print(gcf,[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_MC_NC_PS_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); end
if (t == 2) print(gcf,[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_MC_NM_PS_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); end
if (t == 3) print(gcf,[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_MC_NC_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); end
if (t == 4) print(gcf,[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_MC_NM_AC_VA_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r300'); end

end

close all



