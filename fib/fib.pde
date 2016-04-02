import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

int []Fib = new int[21];
int n = 20;

void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  out.setTempo(100);
  out.pauseNotes();
  
  Fib[0] = 0;
  Fib[1] = 1;
  for(int i = 2; i <= n; i++) {
    Fib[i] = Fib[i-1] + Fib[i-2];
  }
  for(int i = 0; i <= n; i++){
   println(Fib[i]);
   out.playNote(Fib[i]+4, Fib[n-i]/100, 220*pow(2, 1/12)*i);
   out.playNote(Fib[i]+4, Fib[n-i]/100, 220*pow(2, 1/12)*i+i);
   out.playNote(Fib[i]+i+4, Fib[n-i]/100, 220/pow(2, 1/12)/(i+1));
   out.playNote(Fib[i]+i+4, Fib[n-i]/100, 220/pow(2, 1/12)/(i+1)+i);
   out.playNote(Fib[i]*2+4, Fib[n-i]/100, 220*i);
  }
  
  out.setNoteOffset( 8.1 );
  out.resumeNotes();
}

void draw()
{
  background(0);
  stroke(255);
  
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50 );
    line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
  }
}
  
  