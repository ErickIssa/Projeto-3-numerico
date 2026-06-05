clc;
clear;

function regressaoLinear()

    x = [0 5 10 13 17 20 26];
    f = [8300 9900 10400 13200 13600 13700 14600];

    n = length(x);

    g1 = ones(1,n);
    g2 = x;

    g1g1 = 0;
    g1g2 = 0;
    g2g2 = 0;

    for k = 1:n
        g1g1 = g1g1 + g1(k)*g1(k);
        g1g2 = g1g2 + g1(k)*g2(k);
        g2g2 = g2g2 + g2(k)*g2(k);
    end

    fg1 = 0;
    fg2 = 0;

    for k = 1:n
        fg1 = fg1 + f(k)*g1(k);
        fg2 = fg2 + f(k)*g2(k);
    end

    A = [g1g1 g1g2;
         g1g2 g2g2];

    B = [fg1;
         fg2];

    coeficientes = A\B;

    a0 = coeficientes(1);
    a1 = coeficientes(2);

    fprintf('REGRESSAO LINEAR\n');
    fprintf('a0 = %.10f\n',a0);
    fprintf('a1 = %.10f\n',a1);

    x2000 = 20;
    P2000 = a0 + a1*x2000;

    fprintf('P(20) = %.10f\n',P2000);
    
    valorReal = 13700;
    erro = abs(valorReal - P2000);

    fprintf('Erro em (20) = %.10f\n', erro);
end

function regressaoQuadratica()

    x = [0 5 10 13 17 20 26];
    f = [1688 1577 1397 1439 1418 1385 1415];

    n = length(x);

    g1 = ones(1,n);
    g2 = x;
    g3 = x.^2;

    g1g1 = 0;
    g1g2 = 0;
    g1g3 = 0;
    g2g2 = 0;
    g2g3 = 0;
    g3g3 = 0;

    for k = 1:n
        g1g1 = g1g1 + g1(k)*g1(k);
        g1g2 = g1g2 + g1(k)*g2(k);
        g1g3 = g1g3 + g1(k)*g3(k);

        g2g2 = g2g2 + g2(k)*g2(k);
        g2g3 = g2g3 + g2(k)*g3(k);

        g3g3 = g3g3 + g3(k)*g3(k);
    end

    fg1 = 0;
    fg2 = 0;
    fg3 = 0;

    for k = 1:n
        fg1 = fg1 + f(k)*g1(k);
        fg2 = fg2 + f(k)*g2(k);
        fg3 = fg3 + f(k)*g3(k);
    end

    A = [g1g1 g1g2 g1g3;
         g1g2 g2g2 g2g3;
         g1g3 g2g3 g3g3];

    B = [fg1;
         fg2;
         fg3];

    coeficientes = A\B;

    a0 = coeficientes(1);
    a1 = coeficientes(2);
    a2 = coeficientes(3);

    fprintf('REGRESSAO QUADRATICA\n');
    fprintf('a0 = %.10f\n',a0);
    fprintf('a1 = %.10f\n',a1);
    fprintf('a2 = %.10f\n',a2);

    x2000 = 20;
    P2000 = a0 + a1*x2000 + a2*x2000^2;

    fprintf('P(20) = %.10f\n',P2000);
    
    valorReal = 1385;
    erro = abs(valorReal - P2000);

    fprintf('Erro em (20) = %.10f\n', erro);
    
end

#------------------------------------------------------

fprintf('\n====================================\n');

regressaoLinear();

fprintf('\n====================================\n');

regressaoQuadratica();