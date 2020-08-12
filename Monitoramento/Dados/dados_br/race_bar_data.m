clc;
clear all;
close all;

%Lendo o arquivo disponível no site 
fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
filename = 'cases-brazil-states.txt';
urlwrite(fullURL,[filename]);

table = readtable(['cases-brazil-states.txt']);

%Calculando casos diários
casos = table.totalCases;
mortes = table.deaths;
casos_pm = table.totalCases_per_100k_inhabitants * 10;
mortes_pm = table.deaths_per_100k_inhabitants * 10;
new_deaths = table.newDeaths;


BRASIL = [casos, mortes, casos_pm, mortes_pm, new_deaths];

%Definindo o número de dias com informações do COVID-19, que representa o tamanho das matrizes dos estados
dates = table.date(find(strcmp([table.state],'TOTAL')),:);
end_time = max(datenum(dates));


%Separando os dados em 27 sub-matrizes
BR= BRASIL(find(strcmp([table.state], 'TOTAL')),:);

for ( i=1:1:27 )
    clearvars ESTADO
    
if (i==1) estado = 'RO'; regiao = 'Norte'; pop = 1777225; end
if (i==2) estado = 'AC'; regiao = 'Norte'; pop = 881935; end
if (i==3) estado = 'AM'; regiao = 'Norte'; pop = 4144597; end
if (i==4) estado = 'RR'; regiao = 'Norte'; pop = 605761; end
if (i==5) estado = 'PA'; regiao = 'Norte'; pop = 8602865; end
if (i==6) estado = 'AP'; regiao = 'Norte'; pop = 845731; end
if (i==7) estado = 'TO'; regiao = 'Norte'; pop = 1572866; end
if (i==8) estado = 'MA'; regiao = 'Nordeste'; pop = 7075181; end
if (i==9) estado = 'PI'; regiao = 'Nordeste'; pop = 3273227; end
if (i==10) estado = 'CE'; regiao = 'Nordeste'; pop = 9132078; end
if (i==11) estado = 'RN'; regiao = 'Nordeste'; pop = 3506853; end
if (i==12) estado = 'PB'; regiao = 'Nordeste'; pop = 4018127; end
if (i==13) estado = 'PE'; regiao = 'Nordeste'; pop = 9557071; end
if (i==14) estado = 'AL'; regiao = 'Nordeste'; pop = 3337357; end
if (i==15) estado = 'SE'; regiao = 'Nordeste'; pop = 2298696; end
if (i==16) estado = 'BA'; regiao = 'Nordeste'; pop = 14873064; end
if (i==17) estado = 'MG'; regiao = 'Sudeste'; pop = 21168791; end
if (i==18) estado = 'ES'; regiao = 'Sudeste'; pop = 4018650; end
if (i==19) estado = 'RJ'; regiao = 'Sudeste'; pop = 17264943; end
if (i==20) estado = 'SP'; regiao = 'Sudeste'; pop = 45919049; end
if (i==21) estado = 'PR'; regiao = 'Sul'; pop = 11433957; end
if (i==22) estado = 'SC'; regiao = 'Sul'; pop = 7164788; end
if (i==23) estado = 'RS'; regiao = 'Sul'; pop = 11377239; end
if (i==24) estado = 'MS'; regiao = 'Centro-Oeste'; pop = 2778986; end
if (i==25) estado = 'MT'; regiao = 'Centro-Oeste'; pop = 3484466; end
if (i==26) estado = 'GO'; regiao = 'Centro-Oeste'; pop = 7018354; end
if (i==27) estado = 'DF'; regiao = 'Centro-Oeste'; pop = 3015268; end

popBR = 210147125;


ESTADO= BRASIL(find(strcmp([table.state], estado)),:);
ESTADO= [zeros((length(BR)-length(ESTADO)),5) ; ESTADO];



table_cases(i,:) = [ESTADO(:,1)'];
table_deaths(i,:) = [ESTADO(:,2)'];
table_cases_pm(i,:) = [ESTADO(:,3)'];
table_deaths_pm(i,:) = [ESTADO(:,4)'];

for (j=1:length(BR))
new_deaths_pecentage_acumulado(i,j) = ESTADO(j,2)/BR(j,2)*100;
percentage_ratio_acumulado(i,j) = (ESTADO(j,2)/BR(j,2))/(pop/popBR);
new_deaths_pecentage_diario(i,j) = ESTADO(j,5)/BR(j,5)*100;
percentage_ratio_diario(i,j) = (ESTADO(j,5)/BR(j,5))/(pop/popBR);
end




plot(dates',new_deaths_pecentage_diario(i,:))
hold on
end

writematrix(datestr(dates,24),'dates.csv');
writematrix(table_cases,'cases_race_bar.csv');
writematrix(table_deaths,'deaths_race_bar.csv');
writematrix(table_cases_pm,'cases_pm_race_bar.csv');
writematrix(table_deaths_pm,'deaths_pm_race_bar.csv');

writematrix(new_deaths_pecentage_diario,'deaths_percentage_diario.csv');
writematrix(percentage_ratio_diario,'percentage_ratio_diario.csv');

writematrix(new_deaths_pecentage_acumulado,'deaths_percentage_acumulado.csv');
writematrix(percentage_ratio_acumulado,'percentage_ratio_acumulado.csv');





