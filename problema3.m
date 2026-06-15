clc
clear

% Valores de x pedidos no enunciado
x = 0.6:0.005:0.7;

% Aproximação de -infinito
a = -10;

% Número de subintervalos
n = 1000;

% Vetores para armazenar resultados
phi = zeros(size(x));
erro = zeros(size(x));

for k = 1:length(x)

    % Limite superior da integral
    b = x(k);

    % Passo
    h = (b-a)/n;

    % Pontos da integração
    y = a:h:b;

    % Função do enunciado
    f = exp(-(b-y).^2);

    % Regra dos Trapézios Repetida
    I = h * ( ...
        0.5*f(1) + ...
        sum(f(2:end-1)) + ...
        0.5*f(end));

    % Valor de phi(x)
    phi(k) = I/sqrt(2*pi);

    % Segunda derivada da função
    f2 = (4*(b-y).^2 - 2).*exp(-(b-y).^2);

    % Máximo absoluto da segunda derivada
    M2 = max(abs(f2));

    % Estimativa teórica do erro
    erro(k) = ((b-a)/12)*(h^2)*M2;

end

% Exibição da tabela
fprintf('\n');
fprintf('------------------------------------------\n');
fprintf('   x         phi(x)          erro\n');
fprintf('------------------------------------------\n');

for k = 1:length(x)

    fprintf('%0.3f     %0.5f     %0.5f\n', ...
        x(k), phi(k), erro(k));

end

fprintf('------------------------------------------\n');
