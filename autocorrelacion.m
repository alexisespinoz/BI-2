a=load("a"); %aqui va el archivo de la serie

function aur = autocovarianza(arr,lag)
  aur=0;
  prom=mean(arr);
  for i=1:(length(arr)-lag)
    aur += (arr(i,1)-prom)*(arr(i+lag)-prom);
  endfor
  aur=(1/(length(arr)-lag))*aur;
endfunction

function autocorrelacion(arr,maxlag)
  auto=[];
  for i=1:20
    auto(i,1) = autocovarianza(arr,i)/autocovarianza(arr,0);
  endfor
  
  figure(1)
  hold on;
  stem(auto);
  plot([0,20], [0.1,0.1]);
  plot([0,20], [-0.1,-0.1]);
  hold off;
  xlabel('Lag');
  ylabel('Autocorrelacion');
  title("Autocorrelacion de Serie");
  legend("a");
  set(gca,'XTick',[0:1:100]);
  set(gca,'YTick',[-1:0.1:1]);
  grid on
  print -dpng ac.png 
endfunction


autocorrelacion(a,20);

