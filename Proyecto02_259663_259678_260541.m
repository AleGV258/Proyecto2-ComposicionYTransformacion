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

clear; %% Limpiar memoria
close all; %% Cerrar ventanas abiertas
clc; %% Limpiar consola

% Rutas Michell
RutaIEntrada = 'C:\Users\alegv\Documents\Escuela\Tópico I\Proyecto\Proyecto2-ComposicionYTransformacion\entradas\'; %% Ruta de entrada (lectura) de las imágenes
RutaISalida = 'C:\Users\alegv\Documents\Escuela\Tópico I\Proyecto\Proyecto2-ComposicionYTransformacion\salidas\'; %% Ruta de salida (escritura) de las imágenes
% Rutas Daniel
%RutaIEntrada = '\'; %% Ruta de entrada (lectura) de las imágenes
%RutaISalida = '\'; %% Ruta de salida (escritura) de las imágenes
% Rutas Andrés
%RutaIEntrada = '\'; %% Ruta de entrada (lectura) de las imágenes
%RutaISalida = '\'; %% Ruta de salida (escritura) de las imágenes

I1 = imread(strcat(RutaIEntrada, 'Imagen1.jpg')); %% Imagen 1
I2 = imread(strcat(RutaIEntrada, 'Imagen2.jpg')); %% Imagen 2
I3 = imread(strcat(RutaIEntrada, 'Imagen3.jpg')); %% Imagen 3
I4 = imread(strcat(RutaIEntrada, 'Imagen4.jpg')); %% Imagen 4
I5 = imread(strcat(RutaIEntrada, 'Imagen5.jpg')); %% Imagen 5

sX = 1.30; %% Factor de escalamiento de Zoom en X de la Imagen
sY = 1.10; %% Factor de escalamiento de Zoom en Y de la Imagen
angulo = 50; %% Angulo en grados de rotación de la Imagen
k = 0.0008; %% Constante de Perspectiva

%% Composición de Transformaciones

%% Secuencias de Transformaciones
[Secuencia1, IBand1_1, IBand2_1, IBand3_1] = SecuenciaTransformaciones(I1, sX, sY, angulo, k); %% Secuencia con la Primera Imagen
[Secuencia2, IBand1_2, IBand2_2, IBand3_2] = SecuenciaTransformaciones(I2, sX, sY, angulo, k); %% Secuencia con la Segunda Imagen
[Secuencia3, IBand1_3, IBand2_3, IBand3_3] = SecuenciaTransformaciones(I3, sX, sY, angulo, k); %% Secuencia con la Tercera Imagen
[Secuencia4, IBand1_4, IBand2_4, IBand3_4] = SecuenciaTransformaciones(I4, sX, sY, angulo, k); %% Secuencia con la Cuarta Imagen
[Secuencia5, IBand1_5, IBand2_5, IBand3_5] = SecuenciaTransformaciones(I5, sX, sY, angulo, k); %% Secuencia con la Quinta Imagen

%% Despliegue de las imágenes
%% Secuencias de Transformaciones
figure;
subplot(3, 5, 1); imagesc(I1), title('Imagen Original 1');
subplot(3, 5, 2); imagesc(I2), title('Imagen Original 2');
subplot(3, 5, 3); imagesc(I3), title('Imagen Original 3');
subplot(3, 5, 4); imagesc(I4), title('Imagen Original 4');
subplot(3, 5, 5); imagesc(I5), title('Imagen Original 5');
subplot(3, 5, 6); imagesc(Secuencia1), title('Imagen con Secuencia 1');
subplot(3, 5, 7); imagesc(Secuencia2), title('Imagen con Secuencia 2');
subplot(3, 5, 8); imagesc(Secuencia3), title('Imagen con Secuencia 3');
subplot(3, 5, 9); imagesc(Secuencia4), title('Imagen con Secuencia 4');
subplot(3, 5, 10); imagesc(Secuencia5), title('Imagen con Secuencia 5');
% subplot(3, 5, 11); imagesc(SecuenciaRellenado1), title('Imagen con Secuencia Rellenado 1');
% subplot(3, 5, 12); imagesc(SecuenciaRellenado2), title('Imagen con Secuencia Rellenado 2');
% subplot(3, 5, 13); imagesc(SecuenciaRellenado3), title('Imagen con Secuencia Rellenado 3');
% subplot(3, 5, 14); imagesc(SecuenciaRellenado4), title('Imagen con Secuencia Rellenado 4');
% subplot(3, 5, 15); imagesc(SecuenciaRellenado5), title('Imagen con Secuencia Rellenado 5');
colormap(gray);

%% Escritura de las imágenes en un directorio
%% Secuencias de Transformaciones
imwrite(Secuencia1, strcat(RutaISalida, 'ISecuencia1.jpg'));
imwrite(Secuencia2, strcat(RutaISalida, 'ISecuencia2.jpg'));
imwrite(Secuencia3, strcat(RutaISalida, 'ISecuencia3.jpg'));
imwrite(Secuencia4, strcat(RutaISalida, 'ISecuencia4.jpg'));
imwrite(Secuencia5, strcat(RutaISalida, 'ISecuencia5.jpg'));






