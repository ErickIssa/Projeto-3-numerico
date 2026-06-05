clc;
clear;

modo = input('Digite 1 para usar valores do Execício Prático ou 2  para informar os dados: ');

if modo == 2

    quantidadePontos = input('Quantidade de pontos: ');

    valoresX = zeros(1, quantidadePontos);
    valoresY = zeros(1, quantidadePontos);

    for indice = 1:quantidadePontos
        valoresX(indice) = input(['x(', num2str(indice), ') = ']);
        valoresY(indice) = input(['y(', num2str(indice), ') = ']);
    end

    pontoInterpolacao = input('Valor a interpolar: ');

else

    quantidadePontos = 8;

    valoresX = [50.0 80.0 98.0 99.8 100.2 102.2 120.0 150.0];
    valoresY = [1.48 1.95 3.0 4.0 10.00 11.00 11.96 12.30];

    pontoInterpolacao = 100;

end

#------------------------------------------------------------

valorInterpolado = 0;

for indicePontoAtual = 1:quantidadePontos

    numerador = 1;
    denominador = 1;

    for indiceOutroPonto = 1:quantidadePontos

        if indicePontoAtual ~= indiceOutroPonto
            numerador = numerador * (pontoInterpolacao - valoresX(indiceOutroPonto));
            denominador = denominador * (valoresX(indicePontoAtual) - valoresX(indiceOutroPonto));
        end
    end

    valorInterpolado = valorInterpolado + valoresY(indicePontoAtual) * (numerador / denominador);

end

fprintf('\nValor interpolado = %.6f\n', valorInterpolado);