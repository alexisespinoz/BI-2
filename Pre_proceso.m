serie=dlmread('C:\Users\pulen\Desktop\Tarea_BI_2\Data.txt')

%Normalizar Serie
minimo = min(serie);
maximo = max(serie);
for i = 1:length(serie)
  serie(i) = (serie(i) - minimo)/(maximo-minimo);
endfor

%Seperar test y train
porcentaje_test=20
porcentaje_train=80

datos_test=int32(length(serie)*(porcentaje_test/100))
test= zeros(datos_test,1)

datos_train=int32(length(serie)*(porcentaje_train/100))
train = zeros(datos_train,1)

for i = 1:datos_train
  train(i) = serie(i)
endfor

for i = 1:datos_test
  test(i) = serie(datos_train+i)
endfor