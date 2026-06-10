clc
clear

tol = 1e-6;
maxIter = 100;

T = [10;
     10;
     10];

for k = 1:maxIter

    tum = T(1);
    tdois = T(2);
    ttres = T(3);

    
    F = [
    tum^3 - 9*tum - 4 - 6*tdois;
    log10(tdois)*(tdois - tum) - 3*(ttres - tdois) + 1;
    2*sin((3*pi/2)*(ttres - tdois)) - tum + ttres
    ];

    
    J = [
    3*tum^2 - 9, -6, 0;
    -log10(tdois), ((tdois - tum)/(tdois*log(10))) + log10(tdois) + 3, -3;
    -1, -3*pi*cos((3*pi/2)*(ttres - tdois)), 3*pi*cos((3*pi/2)*(ttres - tdois)) + 1
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

