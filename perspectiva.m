%% Perspectiva de una imagen
%% Entradas
%% I -imagen
%% k - constante de perspectiva (cercano a cero)
%% Salidas
%% G - imagen de salida
%% IBand - Bandera con indicador de valor (1-existe valor)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [G, IBand] = perspectiva(I, k)
    G = 0;
    IBand = 0; 
    %% calcular nuevas coordenadas
    nCoord = zeros(size(I, 1), size(I, 2)); %% x'
    for i=1:size(I, 1) %% renglones - y
        for j=1:size(I, 2) %% columnas - x
            nx = (i * j * k);      
            nCoord(i, j) = nx; %% nueva columna
        end
    end
    
    %% validar decimales y negativos en las coord
    nCoord = round(nCoord);
    minX = min(min(nCoord(:, :)));
    if (minX<=0)
        nCoord(:, :) = nCoord(:, :) + abs(minX) + 1;
    end
    maxX = max(max(nCoord(:, :)));
    
    if (maxX < 5000) %% tamaño máximo permitido
        %% asignar nuevas coordenadas
        G = zeros(size(I, 1), maxX, size(I, 3));
        IBand = zeros(size(I, 1), maxX);
        valores = zeros(1, size(I, 3)); %% valores de esos vecinos

        for i=1:size(I, 1) %% renglones - y
            for j=1:size(I, 2) %% columnas - x
                nX = nCoord(i, j);
                if (IBand(i, nX) == 1) %% ya habian valores
                    valores(1, :) = G(i, nX, :);
                    valores(2, :) = I(i, j, :); 
                    G(i, nX, :) = round(mean(valores)); 
                else
                    G(i, nX, :) = I(i, j, :);
                    IBand(i, nX) = 1; 
                end
            end
        end
    end
    G = uint8(G);
    IBand = uint8(IBand);
end

