serie=dlmread('C:\Users\pulen\Desktop\Tarea_BI_2\Data1.txt')

%Normalizar Serie
minimo = min(serie);
maximo = max(serie);
for i = 1:length(serie)
  serie(i) = (serie(i) - minimo)/(maximo-minimo);
endfor

%ACF
%Autocovariancia
function auc=autocovarianza (serie,lag)
  auc=0;
  promedio=mean(serie);
  for i=1:(length(serie)-lag)
    auc += (serie(i,1)-promedio)*(serie(i+lag)-promedio);
  endfor
  auc =(1/(length(serie)-lag))*auc;
endfunction

%Autorelación
function autocorrelacion(serie,maxlag)
  autoc = []
  for i= 1:20
    autoc(i,1) = autocovarianza(serie,i)/autocovarianza(serie,0)
  endfor

  %Grafica ACF
  figure(1)
  hold on;
  stem(auto);
  plot([0,20], [0.1,0.1]);
  plot([0,20], [-0.1,-0.1]);
  hold off;
  xlabel('Lag');
  ylabel('Autocorrelacion');
  title('Autocorrelacion de la Serie');
  legend("serie");
  set(gca,'XTick',[0:1:100]);
  set(gca,'YTick',[-1:0.1:1]);
  grid on
  print -dpng ac.png
 endfunction
 
autocorrelacion(serie,20)

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