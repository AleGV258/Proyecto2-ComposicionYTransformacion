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

function [G, IBand1, IBand2, IBand3] = SecuenciaTransformaciones(I, sX, sY, angulo, k)
    %% Llamada de las funciones en el orden que le toco al equipo
    tic; [GZoom, IBand1] = zoomSxSy(I, sX, sY); toc; %% 1. Primero se le aplica Zoom Sx Sy
    tic; [GRotar, IBand2] = rotar(GZoom, angulo); toc; %% 2. Segundo se le aplica Rotaci�n
    tic; [GPerspectiva, IBand3] = perspectiva(GRotar, k); toc; %% 3. Tercero se le aplica Perspectiva
    
    G = uint8(GPerspectiva);
    IBand1 = uint8(IBand1);
    IBand2 = uint8(IBand2);
    IBand3 = uint8(IBand3);
end