/**

<strong>Pelota Feliz</strong>
<br />
Herbert Spencer - 2008
<br />
Esta pelota sigue al c�rculo y cuando llega se pone feliz
*/


float pelotaX, pelotaY; // las coordenadas de la pelota
float difX, difY; // la diferencia con el c�rculo
float ROCE = 0.051; // lo que le cuesta avanzar
boolean feliz = false; // no es feliz, por ahora

void setup(){
  size(300, 300);
  // supongamos que la pelota est� en la mitad
  // n�tese que puedo inicializar los valores del mouse tambi�n
  pelotaX = mouseX = width/2;
  pelotaY = mouseY = height/2;
  
  noCursor(); // sin cursor
  smooth(); 
}

void draw(){
  
  background(#ddddcc);

  // calcule la diferencia entre el mouse y la pelota en 2 dimensiones
  difX = mouseX - pelotaX;
  difY = mouseY - pelotaY;
  
  // defina la posici�n de la pelota a�adi�ndole roce
  pelotaX += difX * ROCE;
  pelotaY += difY * ROCE;
  
  // dibuje la pelota (funci�n propia)
  pelota(pelotaX, pelotaY);
  
  // haga el c�rculo donde est� el mouse (invisible)
  stroke(0);
  noFill();
  ellipse(mouseX, mouseY, 20, 20);
}

void pelota(float x, float y){
  
  noStroke(); //sin contorno
  
  // calcule la distancia lineal entre la pelota y el mouse
  float d = dist(pelotaX, pelotaY, mouseX, mouseY);

  // si esa distancia es menor que 1, la pelota es feliz 
  if(d < 1){
  feliz = true;
  }
  
  // y si es feliz, haga que se ponga roja y salte de felicidad
  if(feliz){
    float nuevaY = y + sin(millis()/30) * 8;
    fill(#CC0000);
    ellipse(x, nuevaY, 5 + d/5, 5 + d/5);
  }else{
    // si no es feliz, entonces que siga tratando de seguir a la pelota
  fill(0);
  ellipse(x, y, 5 + d/5, 5 + d/5);
  }
}

void mouseMoved(){
  feliz = false;
}
