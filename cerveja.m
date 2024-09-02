% Valores de entrada
CO2 = input('Digite o valor de CO2 (mg/L) [0.4 - 0.75]: ');
Cor = input('Digite o valor de Cor (variando de Palha a Amarelo-Ouro a Ambar) [0 - 8]: ');
Densidade = input('Digite o valor de Densidade (mg/ml) [1.01 - 1.03]: ');
pH = input('Digite o valor de pH [3.4 - 5.2]: ');
Teor = input('Digite o valor de Teor Alcoólico (%) [3 - 7]: ');

% Carregar o sistema fuzzy
fis = readfis("qualidade_cerveja.fis");

% Avaliar o sistema fuzzy
output = evalfis(fis, [CO2 Cor Densidade pH Teor]);

% Exibir a saída
disp(output);

% Nomes das variáveis
nomes = {'CO2', 'Cor', 'Densidade', 'pH', 'Teor', 'Qualidade'};

% Definir a cor da última barra (Qualidade) como azul
cores = repmat([1, 0.5, 0], length(nomes)-1, 1); % Laranja RGB
cores(end, :) = [0, 0, 1]; % Azul para 'Qualidade'

% Valores das variáveis
valores = [CO2, Cor, Densidade, pH, Teor, output];

figure

% Criar gráfico de barras
bar(valores, 'FaceColor', 'flat');
colormap(cores)

% Ajustar o intervalo do eixo y
ylim([0 10]);

% Adicionar rótulos
xlabel('Variáveis');
ylabel('Valores');
title('Valores das Variáveis de Entrada e Saída');
set(gca, 'XTickLabel', nomes);

% Adicionar texto acima das barras
text(1:length(nomes), valores, num2str(valores', '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');

% Adicionar legenda
legend("Valores", 'Location', 'NorthEast');

% Exibir o gráfico
grid on;