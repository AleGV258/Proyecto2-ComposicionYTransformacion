%% Rellenar la imagen 
%% Entradas
%% I - imagen
%% Band - bandera
%% lambda - no. de pixeles alrededor del actual 
%%          se van a buscar
%% Salidas
%% G - imagen rellenada
%% BandN - bandera nueva
%% noPixeles - recuperados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ G, BandN, noPixeles ] = rellenarImg( I, Band, lambda )
    G = I; %% imagen a trabajar
    BandN = Band; %% bandera a modificar
    noPixeles = 0; %% numero de pixeles recuperados
    for i = 1:size(I, 1) %% renglones
        for j = 1:size(I, 2)%% columnas
            if (Band(i, j) == 0) %% no tiene calculo
                nVecinos = 0;  %% no. de vecinos con valor
                valores = zeros(1, size(I, 3));  %% valores de esos vecinos
                for r = (i - lambda):(i + lambda) %% region de busqueda
                    for c = (j - lambda):(j + lambda)
                        if ((r > 0) && (r <= size(I, 1)))
                            if ((c > 0) && (c <= size(I, 2)))
                                if (Band(r, c) > 0)  %% el vecino tiene valor?
                                    nVecinos = nVecinos + 1;
                                    valores(nVecinos, :) = I(r, c, :);
                                end
                            end
                        end
                    end
                end
                if (nVecinos > 0)  %% vecinos con valor
                    if (nVecinos == 1) %% unico vecinos
                        G(i, j, :) = valores;
                    else   %% dos o mas vecinos
                        G(i, j, :) = round(mean(valores));
                    end
                    BandN(i, j) = 1;
                    noPixeles = noPixeles + 1;  %% conteo de pixeles recuperados
                end
            end
        end
    end
    total = size(I,1) * size(I,2);
    fprintf('Tamaño  de  imagen: %d x %d\n', size(I, 1), size(I, 2));
    fprintf('Total  de  pixeles: %d\n', total);
    fprintf('Pixeles rellenados: %d (%5.4f%%)\n', noPixeles, (noPixeles / total) * 100);
end

