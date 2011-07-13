import java.io.IOException;
import android.util.Log;



private Server server;
private int sensorValue;

void setup()
{	
  orientation(PORTRAIT);	
  // Create TCP server
  server = null;
  try
  {
    server = new Server(4567);
    server.start();
  } 
  catch (IOException e)
  {
    println(e.toString());
  } 

  this.server.addListener(new AbstractServerListener() {

    @Override
      public void onReceive(Client client, byte[] data)
    {

      if (data.length<2) return;

      sensorValue = (data[0] & 0xff) | ((data[1] & 0xff) << 8);
    };
  }
  );
}

void draw() 
{
  background(200);
 
  if (mousePressed)
  {
     fill(0, 255, 0);
    ellipse(mouseX, height/2, 100,100);
    try
    {
      server.send(new byte[] {
       (byte) ((((float)mouseX)/((float)width))*255.0f)
       ,(byte) ((((float)mouseY)/((float)height))*255.0f)
      }
      ); 
    
    } 
    catch (IOException e)
    {
      println("microbridgeproblem sending TCP message");
    }
  }
  else
  {
    fill(255, 0, 0);
  ellipse(width/2, height/2, sensorValue, sensorValue); 
  }
}


