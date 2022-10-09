%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Proyecto 2. Geometría de la Imagen                                               %%
%%  Materia: Tópico 1 (Procesamiento Secuencial de Imágenes usando Matlab)           %%
%%  Maestra: Sandra Luz Canchola Magdaleno                                           %%
%%                                                                                   %%
%%  Grupo: 30 - Semestre: 7mo                                                        %%
%%  Integrantes:                                                                     %%
%%   - García Vargas Michell Alejandro - 259663                                      %%
%%   - Jiménez Elizalde Andrés - 259678                                              %%
%%   - León Paulin Daniel - 260541                                                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ISinRellenarZoom, IRellenadaZoom, ISinRellenarRotar, IRellenadaRotar, ISinRellenarPerspectiva, IRellenadaPerspectiva] = ComposicionTransformaciones(I, sX, sY, angulo, k)
    %% Función que unifica las tres transformaciones y devuelve las imágenes
    IBandZoom = 0;
    IBandRotar = 0;
    IBandPerspectiva = 0;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Zoom
    nr = round(size(I, 1) * sY);
    nc = round(size(I, 2) * sX);
    if(max(nr, nc) < 5000)  %% tamaño máximo permitido
        ISinRellenarZoom = zeros(nr, nc, size(I, 3));
        IBandZoom = zeros(nr, nc);
        
        nX = round((1:size(I, 2)) * sX);
        nY = round((1:size(I, 1)) * sY);
        
        indCeros = (nX < 1);
        nX(indCeros) = 1;
        
        indCeros = (nY < 1);
        nY(indCeros) = 1;

        for i=1:size(I, 1) %% renglones
            for j=1:size(I, 2) %% columnas
                ISinRellenarZoom(nY(i), nX(j), :) = I(i, j, :);
                IBandZoom(nY(i), nX(j)) = 1; %% ya tiene valor
            end
        end
    end
    IBandZoom = uint8(IBandZoom);
    
    IRellenadaZoom = rellenarImg(ISinRellenarZoom, IBandZoom, 1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rotar
    %calcular nuevas coordenadas
    coseno = cosd(angulo);
    seno = sind(angulo);
    nCoord = zeros(size(IRellenadaZoom, 1), size(IRellenadaZoom, 2), 2); %% x', y'
    for i=1:size(IRellenadaZoom, 1) %% renglones - y
        for j=1:size(IRellenadaZoom, 2) %% columnas - x
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
 
    valores = zeros(1, size(IRellenadaZoom, 3));  %% valores de esos vecinos
    
    % asignar nuevas coordenadas
    ISinRellenarRotar = zeros(maxY, maxX, size(IRellenadaZoom, 3));
    IBandRotar = zeros(maxY, maxX);
    for i=1:size(IRellenadaZoom, 1) %% renglones - y
        for j=1:size(IRellenadaZoom, 2) %% columnas - x
            nX = nCoord(i, j, 1); %% x'
            nY = nCoord(i, j, 2); %% y'
            
                valores(1, :) = ISinRellenarRotar(nY, nX, :); %% valor anterior en la coord. nueva
                valores(2, :) = IRellenadaZoom(i, j, :);  %% valor actual que se quiere escribir           
                ISinRellenarRotar(nY, nX, :) = round(mean(valores));      
                
                ISinRellenarRotar(nY, nX, :) = IRellenadaZoom(i, j, :);
                IBandRotar(nY, nX) = 1;
        end
    end
    IBandRotar = uint8(IBandRotar);
    
    IRellenadaRotar = rellenarImg(ISinRellenarRotar, IBandRotar, 1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Perspectiva
    %% calcular nuevas coordenadas
    nCoord = zeros(size(IRellenadaRotar, 1), size(IRellenadaRotar, 2)); %% x'
    for i=1:size(IRellenadaRotar, 1) %% renglones - y
        for j=1:size(IRellenadaRotar, 2) %% columnas - x
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
        ISinRellenarPerspectiva = zeros(size(IRellenadaRotar, 1), maxX, size(IRellenadaRotar, 3));
        IBandPerspectiva = zeros(size(IRellenadaRotar, 1), maxX);
        valores = zeros(1, size(IRellenadaRotar, 3)); %% valores de esos vecinos

        for i=1:size(IRellenadaRotar, 1) %% renglones - y
            for j=1:size(IRellenadaRotar, 2) %% columnas - x
                nX = nCoord(i, j);
                if (IBandPerspectiva(i, nX) == 1) %% ya habian valores
                    valores(1, :) = ISinRellenarPerspectiva(i, nX, :);
                    valores(2, :) = IRellenadaRotar(i, j, :); 
                    ISinRellenarPerspectiva(i, nX, :) = round(mean(valores)); 
                else
                    ISinRellenarPerspectiva(i, nX, :) = IRellenadaRotar(i, j, :);
                    IBandPerspectiva(i, nX) = 1; 
                end
            end
        end
    end
    IBandPerspectiva = uint8(IBandPerspectiva);
    
    IRellenadaPerspectiva = rellenarImg(ISinRellenarPerspectiva, IBandPerspectiva, 1);
    
    ISinRellenarZoom = uint8(ISinRellenarZoom);
    IRellenadaZoom = uint8(IRellenadaZoom);
    ISinRellenarRotar = uint8(ISinRellenarRotar);
    IRellenadaRotar = uint8(IRellenadaRotar);
    ISinRellenarPerspectiva = uint8(ISinRellenarPerspectiva);
    IRellenadaPerspectiva = uint8(IRellenadaPerspectiva);
end