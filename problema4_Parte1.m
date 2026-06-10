clc
clear

tol = 1e-6;
maxIter = 100;

T = [1;
     1;
     2];

for k = 1:maxIter

    tum = T(1);
    tdois = T(2);
    ttres = T(3);

    
    F = [
    tum^3 - 9*tum + 3;
    log10(tdois)*tdois - 3;
    2*sin(3*pi*ttres/2) + ttres - 1
    ];

    
    J = [
    3*(tum^2)-9 0 0;
    0 log10(tdois)+1/log(10) 0;
    0 0 3*pi*cos(3*pi*ttres/2)+1
    ];
    
    delta = J \ (-F);

    T = T + delta;

    erro = norm(delta);

    fprintf('Iteracao %d\n',k);
    disp(T)

    if erro < tol
        break
    end

end

fprintf('Solucao encontrada:\n');
disp(T)

