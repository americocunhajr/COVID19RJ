clear all;
clc;
close all;

%ATUALIZAR O NOME DO ARQUIVO NOVO E DATA
all_data = readtable('HIST_PAINEL_COVIDBR_21mai2020.xlsx');
date = '2020-05-21';

data = table2array(all_data(:,11:12));
BRASIL= str2double(data);

table = readtable('arquivo_geral_old.csv');
brasil = [table.casosAcumulados, table.obitosAcumulados];
table = table2cell(table);

[n] = max(size(brasil));
D = n/27;

M=table;

for ( i=1:1:27 )
    
if (i==1) estado = 'RO'; end
if (i==2) estado = 'AC'; end
if (i==3) estado = 'AM'; end
if (i==4) estado = 'RR'; end
if (i==5) estado = 'PA'; end
if (i==6) estado = 'AP'; end
if (i==7) estado = 'TO'; end
if (i==8) estado = 'MA'; end
if (i==9) estado = 'PI'; end
if (i==10) estado = 'CE'; end
if (i==11) estado = 'RN'; end
if (i==12) estado = 'PB'; end
if (i==13) estado = 'PE'; end
if (i==14) estado = 'AL'; end
if (i==15) estado = 'SE'; end
if (i==16) estado = 'BA'; end
if (i==17) estado = 'MG'; end
if (i==18) estado = 'ES'; end
if (i==19) estado = 'RJ'; end
if (i==20) estado = 'SP'; end
if (i==21) estado = 'PR'; end
if (i==22) estado = 'SC'; end
if (i==23) estado = 'RS'; end
if (i==24) estado = 'MS'; end
if (i==25) estado = 'MT'; end
if (i==26) estado = 'GO'; end
if (i==27) estado = 'DF'; end


aux = all_data(find(strcmp([all_data.estado], estado)),:);
dados = max(BRASIL(find(strcmp([all_data.estado], estado)),:));
casos = dados(:,1);
mortes = dados(:,2);
regiao = table2array(aux(1,1));


casos_old=brasil(D*i,1);
mortes_old=brasil(D*i,2);

casos_novos = -casos_old+casos;
mortes_novas = -mortes_old+mortes;

line = [regiao, estado,date, casos_novos, casos, mortes_novas, mortes];

if(i<27)M=[M(1:(D*i+(i-1)),:);line(1,:);M((D*i+(i-1))+1:end,:)];end
if(i==27)M=[M(1:(D*i+(i-1)),:);line(1,:)];end
end


table = cell2table(M);
table.Properties.VariableNames = {'regiao','estado','data','casosNovos','casosAcumulados','obitosNovos','obitosAcumulados'}
writetable(table,'arquivo_geral.csv');

