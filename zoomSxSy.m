%% Escalamiento Sx Sy
%% Entradas
%% I - imagen de entrada
%% sX, sY - factor de escalamiento
%% Salidas
%% G - imagen de salida
%% IBand - Bandera con indicador de valor (1-existe valor)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [G, IBand] = zoomSxSy(I, sX, sY)
    nr = round(size(I, 1) * sY);
    nc = round(size(I, 2) * sX);
    G = 0;
    IBand = 0;
    if(max(nr, nc) < 5000)  %% tamaño máximo permitido
        G = zeros(nr, nc, size(I, 3));
        IBand = zeros(nr, nc);
        
        nX = round((1:size(I, 2)) * sX);
        nY = round((1:size(I, 1)) * sY);
        
        indCeros = (nX < 1);
        nX(indCeros) = 1;
        
        indCeros = (nY < 1);
        nY(indCeros) = 1;

        for i=1:size(I, 1) %% renglones
            for j=1:size(I, 2) %% columnas
                G(nY(i), nX(j), :) = I(i, j, :);
                IBand(nY(i), nX(j)) = 1; %% ya tiene valor
            end
        end
    end
    G = uint8(G);
    IBand = uint8(IBand);
end

