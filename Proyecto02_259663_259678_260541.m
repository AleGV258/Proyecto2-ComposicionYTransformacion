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
%RutaIEntrada = 'C:\Users\alegv\Documents\Escuela\Tópico I\Proyecto\Proyecto2-ComposicionYTransformacion\entradas\'; %% Ruta de entrada (lectura) de las imágenes
%RutaISalida = 'C:\Users\alegv\Documents\Escuela\Tópico I\Proyecto\Proyecto2-ComposicionYTransformacion\salidas\'; %% Ruta de salida (escritura) de las imágenes
% Rutas Daniel
RutaIEntrada = 'C:\Users\danie\Desktop\Topico 1\Proyecto2\Proyecto2-ComposicionYTransformacion\entradas\'; %% Ruta de entrada (lectura) de las imágenes
RutaISalida = 'C:\Users\danie\Desktop\Topico 1\Proyecto2\Proyecto2-ComposicionYTransformacion\salidas\'; %% Ruta de salida (escritura) de las imágenes
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
k = -0.0008; %% Constante de Perspectiva

%%%%%%% NOTA: siento que con perspectiva negativa se ve bien, pero se
%%%%%%% invierte la imagen, entonces decidan ustedes si se queda negativo o
%%%%%%% positivo...


%% Secuencias de Transformaciones
[Sec1ZoomNoRellenada, Sec1ZoomRellenada, Sec1RotarNoRellenada, Sec1RotarRellenada, Sec1PerspectivaNoRellenada, Sec1PerspectivaRellenada] = SecuenciaTransformaciones(I1, sX, sY, angulo, k); %% Secuencia con la Primera Imagen
[Sec2ZoomNoRellenada, Sec2ZoomRellenada, Sec2RotarNoRellenada, Sec2RotarRellenada, Sec2PerspectivaNoRellenada, Sec2PerspectivaRellenada] = SecuenciaTransformaciones(I2, sX, sY, angulo, k); %% Secuencia con la Segunda Imagen
[Sec3ZoomNoRellenada, Sec3ZoomRellenada, Sec3RotarNoRellenada, Sec3RotarRellenada, Sec3PerspectivaNoRellenada, Sec3PerspectivaRellenada] = SecuenciaTransformaciones(I3, sX, sY, angulo, k); %% Secuencia con la Tercera Imagen
[Sec4ZoomNoRellenada, Sec4ZoomRellenada, Sec4RotarNoRellenada, Sec4RotarRellenada, Sec4PerspectivaNoRellenada, Sec4PerspectivaRellenada] = SecuenciaTransformaciones(I4, sX, sY, angulo, k); %% Secuencia con la Cuarta Imagen
[Sec5ZoomNoRellenada, Sec5ZoomRellenada, Sec5RotarNoRellenada, Sec5RotarRellenada, Sec5PerspectivaNoRellenada, Sec5PerspectivaRellenada] = SecuenciaTransformaciones(I5, sX, sY, angulo, k); %% Secuencia con la Quinta Imagen
%% Composición de Transformaciones
% [Comp1ZoomNoRellenada, Comp1ZoomRellenada, Comp1RotarNoRellenada, Comp1RotarRellenada, Comp1PerspectivaNoRellenada, Comp1PerspectivaRellenada] = ComposicionTransformaciones(I1, sX, sY, angulo, k); %% Composicion con la Primera Imagen
% [Comp2ZoomNoRellenada, Comp2ZoomRellenada, Comp2RotarNoRellenada, Comp2RotarRellenada, Comp2PerspectivaNoRellenada, Comp2PerspectivaRellenada] = ComposicionTransformaciones(I2, sX, sY, angulo, k); %% Composicion con la Segunda Imagen
% [Comp3ZoomNoRellenada, Comp3ZoomRellenada, Comp3RotarNoRellenada, Comp3RotarRellenada, Comp3PerspectivaNoRellenada, Comp3PerspectivaRellenada] = ComposicionTransformaciones(I3, sX, sY, angulo, k); %% Composicion con la Tercera Imagen
% [Comp4ZoomNoRellenada, Comp4ZoomRellenada, Comp4RotarNoRellenada, Comp4RotarRellenada, Comp4PerspectivaNoRellenada, Comp4PerspectivaRellenada] = ComposicionTransformaciones(I4, sX, sY, angulo, k); %% Composicion con la Cuarta Imagen
% [Comp5ZoomNoRellenada, Comp5ZoomRellenada, Comp5RotarNoRellenada, Comp5RotarRellenada, Comp5PerspectivaNoRellenada, Comp5PerspectivaRellenada] = ComposicionTransformaciones(I5, sX, sY, angulo, k); %% Composicion con la Quinta Imagen


%% Despliegue de las imágenes
%% Secuencias de Transformaciones
%% Imagen Secuencia 1
figure;
subplot(3, 3, 1); imagesc(I1), title('Imagen Original 1');
subplot(3, 3, 2); imagesc(Sec1ZoomNoRellenada), title('Imagen Secuencia 1 con Zoom No Rellenada');
subplot(3, 3, 3); imagesc(Sec1ZoomRellenada), title('Imagen Secuencia 1 con Zoom Rellenada');
subplot(3, 3, 5); imagesc(Sec1RotarNoRellenada), title('Imagen Secuencia 1 con Rotar No Rellenada');
subplot(3, 3, 6); imagesc(Sec1RotarRellenada), title('Imagen Secuencia 1 con Rotar Rellenada');
subplot(3, 3, 8); imagesc(Sec1PerspectivaNoRellenada), title('Imagen Secuencia 1 con Perspectiva No Rellenada');
subplot(3, 3, 9); imagesc(Sec1PerspectivaRellenada), title('Imagen Secuencia 1 con Perspectiva Rellenada');
colormap(gray);
%% Imagen Secuencia 2
figure;
subplot(3, 3, 1); imagesc(I2), title('Imagen Original 2');
subplot(3, 3, 2); imagesc(Sec2ZoomNoRellenada), title('Imagen Secuencia 2 con Zoom No Rellenada');
subplot(3, 3, 3); imagesc(Sec2ZoomRellenada), title('Imagen Secuencia 2 con Zoom Rellenada');
subplot(3, 3, 5); imagesc(Sec2RotarNoRellenada), title('Imagen Secuencia 2 con Rotar No Rellenada');
subplot(3, 3, 6); imagesc(Sec2RotarRellenada), title('Imagen Secuencia 2 con Rotar Rellenada');
subplot(3, 3, 8); imagesc(Sec2PerspectivaNoRellenada), title('Imagen Secuencia 2 con Perspectiva No Rellenada');
subplot(3, 3, 9); imagesc(Sec2PerspectivaRellenada), title('Imagen Secuencia 2 con Perspectiva Rellenada');
colormap(gray);
%% Imagen Secuencia 3
figure;
subplot(3, 3, 1); imagesc(I3), title('Imagen Original 3');
subplot(3, 3, 2); imagesc(Sec3ZoomNoRellenada), title('Imagen Secuencia 3 con Zoom No Rellenada');
subplot(3, 3, 3); imagesc(Sec3ZoomRellenada), title('Imagen Secuencia 3 con Zoom Rellenada');
subplot(3, 3, 5); imagesc(Sec3RotarNoRellenada), title('Imagen Secuencia 3 con Rotar No Rellenada');
subplot(3, 3, 6); imagesc(Sec3RotarRellenada), title('Imagen Secuencia 3 con Rotar Rellenada');
subplot(3, 3, 8); imagesc(Sec3PerspectivaNoRellenada), title('Imagen Secuencia 3 con Perspectiva No Rellenada');
subplot(3, 3, 9); imagesc(Sec3PerspectivaRellenada), title('Imagen Secuencia 3 con Perspectiva Rellenada');
colormap(gray);
%% Imagen Secuencia 4
figure;
subplot(3, 3, 1); imagesc(I4), title('Imagen Original 4');
subplot(3, 3, 2); imagesc(Sec4ZoomNoRellenada), title('Imagen Secuencia 4 con Zoom No Rellenada');
subplot(3, 3, 3); imagesc(Sec4ZoomRellenada), title('Imagen Secuencia 4 con Zoom Rellenada');
subplot(3, 3, 5); imagesc(Sec4RotarNoRellenada), title('Imagen Secuencia 4 con Rotar No Rellenada');
subplot(3, 3, 6); imagesc(Sec4RotarRellenada), title('Imagen Secuencia 4 con Rotar Rellenada');
subplot(3, 3, 8); imagesc(Sec4PerspectivaNoRellenada), title('Imagen Secuencia 4 con Perspectiva No Rellenada');
subplot(3, 3, 9); imagesc(Sec4PerspectivaRellenada), title('Imagen Secuencia 4 con Perspectiva Rellenada');
colormap(gray);
%% Imagen Secuencia 5
figure;
subplot(3, 3, 1); imagesc(I5), title('Imagen Original 5');
subplot(3, 3, 2); imagesc(Sec5ZoomNoRellenada), title('Imagen Secuencia 5 con Zoom No Rellenada');
subplot(3, 3, 3); imagesc(Sec5ZoomRellenada), title('Imagen Secuencia 5 con Zoom Rellenada');
subplot(3, 3, 5); imagesc(Sec5RotarNoRellenada), title('Imagen Secuencia 5 con Rotar No Rellenada');
subplot(3, 3, 6); imagesc(Sec5RotarRellenada), title('Imagen Secuencia 5 con Rotar Rellenada');
subplot(3, 3, 8); imagesc(Sec5PerspectivaNoRellenada), title('Imagen Secuencia 5 con Perspectiva No Rellenada');
subplot(3, 3, 9); imagesc(Sec5PerspectivaRellenada), title('Imagen Secuencia 5 con Perspectiva Rellenada');
colormap(gray);
%% Composiciones de Transformaciones
%% Imagen Composición 1
% figure;
% subplot(3, 3, 1); imagesc(I1), title('Imagen Original 1');
% subplot(3, 3, 2); imagesc(Comp1ZoomNoRellenada), title('Imagen Composicion 1 con Zoom No Rellenada');
% subplot(3, 3, 3); imagesc(Comp1ZoomRellenada), title('Imagen Composicion 1 con Zoom Rellenada');
% subplot(3, 3, 5); imagesc(Comp1RotarNoRellenada), title('Imagen Composicion 1 con Rotar No Rellenada');
% subplot(3, 3, 6); imagesc(Comp1RotarRellenada), title('Imagen Composicion 1 con Rotar Rellenada');
% subplot(3, 3, 8); imagesc(Comp1PerspectivaNoRellenada), title('Imagen Composicion 1 con Perspectiva No Rellenada');
% subplot(3, 3, 9); imagesc(Comp1PerspectivaRellenada), title('Imagen Composicion 1 con Perspectiva Rellenada');
% colormap(gray);
%% Imagen Composición 2
% figure;
% subplot(3, 3, 1); imagesc(I2), title('Imagen Original 2');
% subplot(3, 3, 2); imagesc(Comp2ZoomNoRellenada), title('Imagen Composicion 2 con Zoom No Rellenada');
% subplot(3, 3, 3); imagesc(Comp2ZoomRellenada), title('Imagen Composicion 2 con Zoom Rellenada');
% subplot(3, 3, 5); imagesc(Comp2RotarNoRellenada), title('Imagen Composicion 2 con Rotar No Rellenada');
% subplot(3, 3, 6); imagesc(Comp2RotarRellenada), title('Imagen Composicion 2 con Rotar Rellenada');
% subplot(3, 3, 8); imagesc(Comp2PerspectivaNoRellenada), title('Imagen Composicion 2 con Perspectiva No Rellenada');
% subplot(3, 3, 9); imagesc(Comp2PerspectivaRellenada), title('Imagen Composicion 2 con Perspectiva Rellenada');
% colormap(gray);
%% Imagen Composición 3
% figure;
% subplot(3, 3, 1); imagesc(I3), title('Imagen Original 3');
% subplot(3, 3, 2); imagesc(Comp3ZoomNoRellenada), title('Imagen Composicion 3 con Zoom No Rellenada');
% subplot(3, 3, 3); imagesc(Comp3ZoomRellenada), title('Imagen Composicion 3 con Zoom Rellenada');
% subplot(3, 3, 5); imagesc(Comp3RotarNoRellenada), title('Imagen Composicion 3 con Rotar No Rellenada');
% subplot(3, 3, 6); imagesc(Comp3RotarRellenada), title('Imagen Composicion 3 con Rotar Rellenada');
% subplot(3, 3, 8); imagesc(Comp3PerspectivaNoRellenada), title('Imagen Composicion 3 con Perspectiva No Rellenada');
% subplot(3, 3, 9); imagesc(Comp3PerspectivaRellenada), title('Imagen Composicion 3 con Perspectiva Rellenada');
% colormap(gray);
%% Imagen Composición 4
% figure;
% subplot(3, 3, 1); imagesc(I4), title('Imagen Original 4');
% subplot(3, 3, 2); imagesc(Comp4ZoomNoRellenada), title('Imagen Composicion 4 con Zoom No Rellenada');
% subplot(3, 3, 3); imagesc(Comp4ZoomRellenada), title('Imagen Composicion 4 con Zoom Rellenada');
% subplot(3, 3, 5); imagesc(Comp4RotarNoRellenada), title('Imagen Composicion 4 con Rotar No Rellenada');
% subplot(3, 3, 6); imagesc(Comp4RotarRellenada), title('Imagen Composicion 4 con Rotar Rellenada');
% subplot(3, 3, 8); imagesc(Comp4PerspectivaNoRellenada), title('Imagen Composicion 4 con Perspectiva No Rellenada');
% subplot(3, 3, 9); imagesc(Comp4PerspectivaRellenada), title('Imagen Composicion 4 con Perspectiva Rellenada');
% colormap(gray);
%% Imagen Composición 5
% figure;
% subplot(3, 3, 1); imagesc(I5), title('Imagen Original 5');
% subplot(3, 3, 2); imagesc(Comp5ZoomNoRellenada), title('Imagen Composicion 5 con Zoom No Rellenada');
% subplot(3, 3, 3); imagesc(Comp5ZoomRellenada), title('Imagen Composicion 5 con Zoom Rellenada');
% subplot(3, 3, 5); imagesc(Comp5RotarNoRellenada), title('Imagen Composicion 5 con Rotar No Rellenada');
% subplot(3, 3, 6); imagesc(Comp5RotarRellenada), title('Imagen Composicion 5 con Rotar Rellenada');
% subplot(3, 3, 8); imagesc(Comp5PerspectivaNoRellenada), title('Imagen Composicion 5 con Perspectiva No Rellenada');
% subplot(3, 3, 9); imagesc(Comp5PerspectivaRellenada), title('Imagen Composicion 5 con Perspectiva Rellenada');
% colormap(gray);


%% Escritura de las imágenes en un directorio
%% Secuencias de Transformaciones
%% Secuencia Imagen 1
imwrite(Sec1ZoomNoRellenada, strcat(RutaISalida, 'Secuencia1_ZoomNoRellenada.jpg')); %% Almacenar Imagen Secuencia 1 con Zoom No Rellenada
imwrite(Sec1RotarNoRellenada, strcat(RutaISalida, 'Secuencia1_RotarNoRellenada.jpg')); %% Almacenar Imagen Secuencia 1 con Rotar No Rellenada
imwrite(Sec1PerspectivaNoRellenada, strcat(RutaISalida, 'Secuencia1_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Secuencia 1 con Perspectiva No Rellenada
imwrite(Sec1ZoomRellenada, strcat(RutaISalida, 'Secuencia1_ZoomRellenada.jpg')); %% Almacenar Imagen Secuencia 1 con Zoom Rellenada
imwrite(Sec1RotarRellenada, strcat(RutaISalida, 'Secuencia1_RotarRellenada.jpg')); %% Almacenar Imagen Secuencia 1 con Rotar Rellenada
imwrite(Sec1PerspectivaRellenada, strcat(RutaISalida, 'Secuencia1_PerspectivaRellenada.jpg')); %% Almacenar Imagen Secuencia 1 con Perspectiva Rellenada
%% Secuencia Imagen 2
imwrite(Sec2ZoomNoRellenada, strcat(RutaISalida, 'Secuencia2_ZoomNoRellenada.jpg')); %% Almacenar Imagen Secuencia 2 con Zoom No Rellenada
imwrite(Sec2RotarNoRellenada, strcat(RutaISalida, 'Secuencia2_RotarNoRellenada.jpg')); %% Almacenar Imagen Secuencia 2 con Rotar No Rellenada
imwrite(Sec2PerspectivaNoRellenada, strcat(RutaISalida, 'Secuencia2_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Secuencia 2 con Perspectiva No Rellenada
imwrite(Sec2ZoomRellenada, strcat(RutaISalida, 'Secuencia2_ZoomRellenada.jpg')); %% Almacenar Imagen Secuencia 2 con Zoom Rellenada
imwrite(Sec2RotarRellenada, strcat(RutaISalida, 'Secuencia2_RotarRellenada.jpg')); %% Almacenar Imagen Secuencia 2 con Rotar Rellenada
imwrite(Sec2PerspectivaRellenada, strcat(RutaISalida, 'Secuencia2_PerspectivaRellenada.jpg')); %% Almacenar Imagen Secuencia 2 con Perspectiva Rellenada
%% Secuencia Imagen 3
imwrite(Sec3ZoomNoRellenada, strcat(RutaISalida, 'Secuencia3_ZoomNoRellenada.jpg')); %% Almacenar Imagen Secuencia 3 con Zoom No Rellenada
imwrite(Sec3RotarNoRellenada, strcat(RutaISalida, 'Secuencia3_RotarNoRellenada.jpg')); %% Almacenar Imagen Secuencia 3 con Rotar No Rellenada
imwrite(Sec3PerspectivaNoRellenada, strcat(RutaISalida, 'Secuencia3_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Secuencia 3 con Perspectiva No Rellenada
imwrite(Sec3ZoomRellenada, strcat(RutaISalida, 'Secuencia3_ZoomRellenada.jpg')); %% Almacenar Imagen Secuencia 3 con Zoom Rellenada
imwrite(Sec3RotarRellenada, strcat(RutaISalida, 'Secuencia3_RotarRellenada.jpg')); %% Almacenar Imagen Secuencia 3 con Rotar Rellenada
imwrite(Sec3PerspectivaRellenada, strcat(RutaISalida, 'Secuencia3_PerspectivaRellenada.jpg')); %% Almacenar Imagen Secuencia 3 con Perspectiva Rellenada
%% Secuencia Imagen 4
imwrite(Sec4ZoomNoRellenada, strcat(RutaISalida, 'Secuencia4_ZoomNoRellenada.jpg')); %% Almacenar Imagen Secuencia 4 con Zoom No Rellenada
imwrite(Sec4RotarNoRellenada, strcat(RutaISalida, 'Secuencia4_RotarNoRellenada.jpg')); %% Almacenar Imagen Secuencia 4 con Rotar No Rellenada
imwrite(Sec4PerspectivaNoRellenada, strcat(RutaISalida, 'Secuencia4_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Secuencia 4 con Perspectiva No Rellenada
imwrite(Sec4ZoomRellenada, strcat(RutaISalida, 'Secuencia4_ZoomRellenada.jpg')); %% Almacenar Imagen Secuencia 4 con Zoom Rellenada
imwrite(Sec4RotarRellenada, strcat(RutaISalida, 'Secuencia4_RotarRellenada.jpg')); %% Almacenar Imagen Secuencia 4 con Rotar Rellenada
imwrite(Sec4PerspectivaRellenada, strcat(RutaISalida, 'Secuencia4_PerspectivaRellenada.jpg')); %% Almacenar Imagen Secuencia 4 con Perspectiva Rellenada
%% Secuencia Imagen 5
imwrite(Sec5ZoomNoRellenada, strcat(RutaISalida, 'Secuencia5_ZoomNoRellenada.jpg')); %% Almacenar Imagen Secuencia 5 con Zoom No Rellenada
imwrite(Sec5RotarNoRellenada, strcat(RutaISalida, 'Secuencia5_RotarNoRellenada.jpg')); %% Almacenar Imagen Secuencia 5 con Rotar No Rellenada
imwrite(Sec5PerspectivaNoRellenada, strcat(RutaISalida, 'Secuencia5_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Secuencia 5 con Perspectiva No Rellenada
imwrite(Sec5ZoomRellenada, strcat(RutaISalida, 'Secuencia5_ZoomRellenada.jpg')); %% Almacenar Imagen Secuencia 5 con Zoom Rellenada
imwrite(Sec5RotarRellenada, strcat(RutaISalida, 'Secuencia5_RotarRellenada.jpg')); %% Almacenar Imagen Secuencia 5 con Rotar Rellenada
imwrite(Sec5PerspectivaRellenada, strcat(RutaISalida, 'Secuencia5_PerspectivaRellenada.jpg')); %% Almacenar Imagen Secuencia 5 con Perspectiva Rellenada
%% Composición de Transformaciones
%% Composición Imagen 1
% imwrite(Comp1ZoomNoRellenada, strcat(RutaISalida, 'Composicion1_ZoomNoRellenada.jpg')); %% Almacenar Imagen Composición 1 con Zoom No Rellenada
% imwrite(Comp1RotarNoRellenada, strcat(RutaISalida, 'Composicion1_RotarNoRellenada.jpg')); %% Almacenar Imagen Composición 1 con Rotar No Rellenada
% imwrite(Comp1PerspectivaNoRellenada, strcat(RutaISalida, 'Composicion1_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Composición 1 con Perspectiva No Rellenada
% imwrite(Comp1ZoomRellenada, strcat(RutaISalida, 'Composicion1_ZoomRellenada.jpg')); %% Almacenar Imagen Composición 1 con Zoom Rellenada
% imwrite(Comp1RotarRellenada, strcat(RutaISalida, 'Composicion1_RotarRellenada.jpg')); %% Almacenar Imagen Composición 1 con Rotar Rellenada
% imwrite(Comp1PerspectivaRellenada, strcat(RutaISalida, 'Composicion1_PerspectivaRellenada.jpg')); %% Almacenar Imagen Composición 1 con Perspectiva Rellenada
%% Composición Imagen 2
% imwrite(Comp2ZoomNoRellenada, strcat(RutaISalida, 'Composicion2_ZoomNoRellenada.jpg')); %% Almacenar Imagen Composición 2 con Zoom No Rellenada
% imwrite(Comp2RotarNoRellenada, strcat(RutaISalida, 'Composicion2_RotarNoRellenada.jpg')); %% Almacenar Imagen Composición 2 con Rotar No Rellenada
% imwrite(Comp2PerspectivaNoRellenada, strcat(RutaISalida, 'Composicion2_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Composición 2 con Perspectiva No Rellenada
% imwrite(Comp2ZoomRellenada, strcat(RutaISalida, 'Composicion2_ZoomRellenada.jpg')); %% Almacenar Imagen Composición 2 con Zoom Rellenada
% imwrite(Comp2RotarRellenada, strcat(RutaISalida, 'Composicion2_RotarRellenada.jpg')); %% Almacenar Imagen Composición 2 con Rotar Rellenada
% imwrite(Comp2PerspectivaRellenada, strcat(RutaISalida, 'Composicion2_PerspectivaRellenada.jpg')); %% Almacenar Imagen Composición 2 con Perspectiva Rellenada
%% Composición Imagen 3
% imwrite(Comp3ZoomNoRellenada, strcat(RutaISalida, 'Composicion3_ZoomNoRellenada.jpg')); %% Almacenar Imagen Composición 3 con Zoom No Rellenada
% imwrite(Comp3RotarNoRellenada, strcat(RutaISalida, 'Composicion3_RotarNoRellenada.jpg')); %% Almacenar Imagen Composición 3 con Rotar No Rellenada
% imwrite(Comp3PerspectivaNoRellenada, strcat(RutaISalida, 'Composicion3_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Composición 3 con Perspectiva No Rellenada
% imwrite(Comp3ZoomRellenada, strcat(RutaISalida, 'Composicion3_ZoomRellenada.jpg')); %% Almacenar Imagen Composición 3 con Zoom Rellenada
% imwrite(Comp3RotarRellenada, strcat(RutaISalida, 'Composicion3_RotarRellenada.jpg')); %% Almacenar Imagen Composición 3 con Rotar Rellenada
% imwrite(Comp3PerspectivaRellenada, strcat(RutaISalida, 'Composicion3_PerspectivaRellenada.jpg')); %% Almacenar Imagen Composición 3 con Perspectiva Rellenada
%% Composición Imagen 4
% imwrite(Comp4ZoomNoRellenada, strcat(RutaISalida, 'Composicion4_ZoomNoRellenada.jpg')); %% Almacenar Imagen Composición 4 con Zoom No Rellenada
% imwrite(Comp4RotarNoRellenada, strcat(RutaISalida, 'Composicion4_RotarNoRellenada.jpg')); %% Almacenar Imagen Composición 4 con Rotar No Rellenada
% imwrite(Comp4PerspectivaNoRellenada, strcat(RutaISalida, 'Composicion4_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Composición 4 con Perspectiva No Rellenada
% imwrite(Comp4ZoomRellenada, strcat(RutaISalida, 'Composicion4_ZoomRellenada.jpg')); %% Almacenar Imagen Composición 4 con Zoom Rellenada
% imwrite(Comp4RotarRellenada, strcat(RutaISalida, 'Composicion4_RotarRellenada.jpg')); %% Almacenar Imagen Composición 4 con Rotar Rellenada
% imwrite(Comp4PerspectivaRellenada, strcat(RutaISalida, 'Composicion4_PerspectivaRellenada.jpg')); %% Almacenar Imagen Composición 4 con Perspectiva Rellenada
%% Composición Imagen 5
% imwrite(Comp5ZoomNoRellenada, strcat(RutaISalida, 'Composicion5_ZoomNoRellenada.jpg')); %% Almacenar Imagen Composición 5 con Zoom No Rellenada
% imwrite(Comp5RotarNoRellenada, strcat(RutaISalida, 'Composicion5_RotarNoRellenada.jpg')); %% Almacenar Imagen Composición 5 con Rotar No Rellenada
% imwrite(Comp5PerspectivaNoRellenada, strcat(RutaISalida, 'Composicion5_PerspectivaNoRellenada.jpg')); %% Almacenar Imagen Composición 5 con Perspectiva No Rellenada
% imwrite(Comp5ZoomRellenada, strcat(RutaISalida, 'Composicion5_ZoomRellenada.jpg')); %% Almacenar Imagen Composición 5 con Zoom Rellenada
% imwrite(Comp5RotarRellenada, strcat(RutaISalida, 'Composicion5_RotarRellenada.jpg')); %% Almacenar Imagen Composición 5 con Rotar Rellenada
% imwrite(Comp5PerspectivaRellenada, strcat(RutaISalida, 'Composicion5_PerspectivaRellenada.jpg')); %% Almacenar Imagen Composición 5 con Perspectiva Rellenada




