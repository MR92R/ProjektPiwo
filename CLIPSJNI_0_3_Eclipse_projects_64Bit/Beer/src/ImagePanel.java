import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.JPanel;

public class ImagePanel extends JPanel{

    private BufferedImage image;

    public ImagePanel(String path) {
       try {                
          image = ImageIO.read(new File(path));
       } catch (IOException ex) {
          System.out.print("Brak zdjęcia ");
       }
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(image, 0, 0,getWidth(),getHeight(), this);        
    }
    public void setImage(String path) {
    	 try {                
             image = ImageIO.read(new File(path));
          } catch (IOException ex) {
             System.out.print("Brak zdjęcia ");
          }
    	
    }

}