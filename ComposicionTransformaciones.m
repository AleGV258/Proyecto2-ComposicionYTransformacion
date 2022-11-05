%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Proyecto 2. Geometr�a de la Imagen                                               %%
%%  Materia: T�pico 1 (Procesamiento Secuencial de Im�genes usando Matlab)           %%
%%  Maestra: Sandra Luz Canchola Magdaleno                                           %%
%%                                                                                   %%
%%  Grupo: 30 - Semestre: 7mo                                                        %%
%%  Integrantes:                                                                     %%
%%   - Garc�a Vargas Michell Alejandro - 259663                                      %%
%%   - Jim�nez Elizalde Andr�s - 259678                                              %%
%%   - Le�n Paulin Daniel - 260541                                                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [IComposicion, IComposicionRellenada] = ComposicionTransformaciones(I, sX, sY, angulo, k)
    %% funci�n que unifica las tres transformaciones y devuelve las im�genes
    tic;
    IBand = 0;
    coseno = cosd(angulo);
    seno = sind(angulo);
    nCoord = zeros(size(I, 1), size(I, 2), 2); %% x', y'
    for i=1:size(I, 1) %% renglones - y
        for j=1:size(I, 2) %% columnas - x
            ny = (j * sX * seno) + (i * sY * coseno); %% nueva formula que integra Zoom, Rotar y Perspectiva en el eje y
            nx = ((j * sX * coseno) - (i * sY * seno)) * ny * k; %% nueva formula que integra Zoom, Rotar y Perspectiva en el eje x
            nCoord(i, j, 1) = nx;  %% x'
            nCoord(i, j, 2) = ny;  %% y'
        end
    end
    
    %% validar decimales y negativos en las coord
    nCoord = round(nCoord);
    minX = min(min(nCoord(:, :, 1))); %% x'
    minY = min(min(nCoord(:, :, 2))); %% y'
    if(minX <= 0) %% negativos
        nCoord(:, :, 1) = nCoord(:, :, 1) + abs(minX) + 1;
    end
    if(minY <= 0) %% negativos
        nCoord(:, :, 2) = nCoord(:, :, 2) + abs(minY) + 1;
    end
    maxX = max(max(nCoord(:, :, 1))); %% x' - columnas
    maxY = max(max(nCoord(:, :, 2))); %% y' - filas
 
    valores = zeros(1, size(I, 3));  %% valores de esos vecinos
    
    %% asignar nuevas coordenadas
    IComposicion = zeros(maxY, maxX, size(I, 3));
    IBand = zeros(maxY, maxX);
    for i=1:size(I, 1) %% renglones - y
        for j=1:size(I, 2) %% columnas - x
            nX = nCoord(i, j, 1); %% x'
            nY = nCoord(i, j, 2); %% y'
            
            valores(1, :) = IComposicion(nY, nX, :); %% valor anterior en la coord. nueva
            valores(2, :) = I(i, j, :);  %% valor actual que se quiere escribir           
            IComposicion(nY, nX, :) = round(mean(valores));      

            IComposicion(nY, nX, :) = I(i, j, :);
            IBand(nY, nX) = 1;
        end
    end

    IComposicion = uint8(IComposicion);
    fprintf('Imagen sin Rellenar - ');
    toc; tic;
    IComposicionRellenada = rellenarImg(IComposicion, IBand, 1);
    IComposicionRellenada = uint8(IComposicionRellenada);
    fprintf('Imagen Rellenada - ');
    toc; fprintf('\n');
end


