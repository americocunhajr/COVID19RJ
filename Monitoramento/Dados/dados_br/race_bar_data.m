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

BRASIL = [casos, mortes, casos_pm, mortes_pm];

%Definindo o número de dias com informações do COVID-19, que representa o tamanho das matrizes dos estados
dates = table.date(find(strcmp([table.state],'TOTAL')),:);
end_time = max(datenum(dates));


%Separando os dados em 27 sub-matrizes
BR= BRASIL(find(strcmp([table.state], 'TOTAL')),:);

for ( i=1:1:27 )
    clearvars ESTADO
    
if (i==1) estado = 'RO'; regiao = 'Norte'; end
if (i==2) estado = 'AC'; regiao = 'Norte'; end
if (i==3) estado = 'AM'; regiao = 'Norte'; end
if (i==4) estado = 'RR'; regiao = 'Norte'; end
if (i==5) estado = 'PA'; regiao = 'Norte'; end
if (i==6) estado = 'AP'; regiao = 'Norte'; end
if (i==7) estado = 'TO'; regiao = 'Norte'; end
if (i==8) estado = 'MA'; regiao = 'Nordeste'; end
if (i==9) estado = 'PI'; regiao = 'Nordeste'; end
if (i==10) estado = 'CE'; regiao = 'Nordeste'; end
if (i==11) estado = 'RN'; regiao = 'Nordeste'; end
if (i==12) estado = 'PB'; regiao = 'Nordeste'; end
if (i==13) estado = 'PE'; regiao = 'Nordeste'; end
if (i==14) estado = 'AL'; regiao = 'Nordeste'; end
if (i==15) estado = 'SE'; regiao = 'Nordeste'; end
if (i==16) estado = 'BA'; regiao = 'Nordeste'; end
if (i==17) estado = 'MG'; regiao = 'Sudeste'; end
if (i==18) estado = 'ES'; regiao = 'Sudeste'; end
if (i==19) estado = 'RJ'; regiao = 'Sudeste'; end
if (i==20) estado = 'SP'; regiao = 'Sudeste'; end
if (i==21) estado = 'PR'; regiao = 'Sul'; end
if (i==22) estado = 'SC'; regiao = 'Sul'; end
if (i==23) estado = 'RS'; regiao = 'Sul'; end
if (i==24) estado = 'MS'; regiao = 'Centro-Oeste'; end
if (i==25) estado = 'MT'; regiao = 'Centro-Oeste'; end
if (i==26) estado = 'GO'; regiao = 'Centro-Oeste'; end
if (i==27) estado = 'DF'; regiao = 'Centro-Oeste'; end


ESTADO= BRASIL(find(strcmp([table.state], estado)),:);
ESTADO= [zeros((length(BR)-length(ESTADO)),4) ; ESTADO];

table_cases(i,:) = [ESTADO(:,1)'];
table_deaths(i,:) = [ESTADO(:,2)'];
table_cases_pm(i,:) = [ESTADO(:,3)'];
table_deaths_pm(i,:) = [ESTADO(:,4)'];

% table.Properties.VariableNames = {'estado','regiao','data','casosNovos','casosAcumulados','obitosNovos','obitosAcumulados'}


end

writematrix(datestr(dates,24),'dates.csv');
writematrix(table_cases,'cases_race_bar.csv');
writematrix(table_deaths,'deaths_race_bar.csv');
writematrix(table_cases_pm,'cases_pm_race_bar.csv');
writematrix(table_deaths_pm,'deaths_pm_race_bar.csv');



