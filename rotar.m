%% Rotar una imagen
%% Entradas
%% I - imagen
%% angulo - angulo de rotacion
%% Salidas
%% G - imagen de salida
%% IBand - Bandera con indicador de valor (1-existe valor)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [G, IBand] = rotar(I, angulo)
    G = 0;
    IBand = 0; 
    
    % calcular nuevas coordenadas
    coseno = cosd(angulo);
    seno = sind(angulo);
    nCoord = zeros(size(I, 1), size(I, 2), 2); %% x', y'
    for i=1:size(I, 1) %% renglones - y
        for j=1:size(I, 2) %% columnas - x
            nx = (j * coseno) - (i * seno);
            ny = (j * seno) + (i * coseno);
            nCoord(i, j, 1) = nx;  %% x'
            nCoord(i, j, 2) = ny;  %% y'
        end
    end
    
    % validar decimales y negativos en las coord
    nCoord = round(nCoord);
    minX = min(min(nCoord(:, :, 1))); %% x'
    minY = min(min(nCoord(:, :, 2))); %% y'
    if(minX <= 0) % negativos
        nCoord(:, :, 1) = nCoord(:, :, 1) + abs(minX) + 1;
    end
    if(minY <= 0) % negativos
        nCoord(:, :, 2) = nCoord(:, :, 2) + abs(minY) + 1;
    end
    maxX = max(max(nCoord(:, :, 1))); %% x' - columnas
    maxY = max(max(nCoord(:, :, 2))); %% y' - filas
 
    valores = zeros(1, size(I, 3));  %% valores de esos vecinos
    
    % asignar nuevas coordenadas
    G = zeros(maxY, maxX, size(I, 3));
    IBand = zeros(maxY, maxX);
    for i=1:size(I, 1) %% renglones - y
        for j=1:size(I, 2) %% columnas - x
            nX = nCoord(i, j, 1); %% x'
            nY = nCoord(i, j, 2); %% y'
            
                valores(1, :) = G(nY, nX, :); %% valor anterior en la coord. nueva
                valores(2, :) = I(i, j, :);  %% valor actual que se quiere escribir           
                G(nY, nX, :) = round(mean(valores));      
                
                G(nY, nX, :) = I(i, j, :);
                IBand(nY, nX) = 1;
        end
    end
    G = uint8(G);
    IBand = uint8(IBand);
end

