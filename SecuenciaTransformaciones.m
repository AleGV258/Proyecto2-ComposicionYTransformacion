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

function [ISinRellenarZoom, IRellenadaZoom, ISinRellenarRotar, IRellenadaRotar, ISinRellenarPerspectiva, IRellenadaPerspectiva] = SecuenciaTransformaciones(I, sX, sY, angulo, k)
    %% Llamada de las funciones en el orden que le toco al equipo
    %% Primero Zoom
    tic;
    [ISinRellenarZoom, IBand1] = zoomSxSy(I, sX, sY); %% 1. Primero se le aplica Zoom Sx Sy
    fprintf('Imagen con Zoom sin Rellenar - ');
    toc; tic;
    [IRellenadaZoom, BandN1, noPixelesZoom] = rellenarImg(ISinRellenarZoom, IBand1, 1);
    fprintf('Imagen con Zoom Rellenada - ');
    toc; fprintf('\n');
    
    %% Segundo Rotar
    tic;
    [ISinRellenarRotar, IBand2] = rotar(IRellenadaZoom, angulo); %% 2. Segundo se le aplica Rotación
    fprintf('Imagen con Rotar sin Rellenar - ');
    toc; tic;
    [IRellenadaRotar, BandN2, noPixelesRotar] = rellenarImg(ISinRellenarRotar, IBand2, 1);
    fprintf('Imagen con Rotar Rellenada - ');
    toc; fprintf('\n');
    
    %% Tercero Perspectiva
    tic;
    [ISinRellenarPerspectiva, IBand3] = perspectiva(IRellenadaRotar, k); %% 3. Tercero se le aplica Perspectiva
    fprintf('Imagen con Perspectiva sin Rellenar - ');
    toc; tic;
    [IRellenadaPerspectiva, BandN3, noPixelesPerspectiva] = rellenarImg(ISinRellenarPerspectiva, IBand3, 1);
    fprintf('Imagen con Rotar Rellenada - ');
    toc; fprintf('\n\n');
    
    ISinRellenarZoom = uint8(ISinRellenarZoom);
    IRellenadaZoom = uint8(IRellenadaZoom);
    ISinRellenarRotar = uint8(ISinRellenarRotar);
    IRellenadaRotar = uint8(IRellenadaRotar);
    ISinRellenarPerspectiva = uint8(ISinRellenarPerspectiva);
    IRellenadaPerspectiva = uint8(IRellenadaPerspectiva);
end


