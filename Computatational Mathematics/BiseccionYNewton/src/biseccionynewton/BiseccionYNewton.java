/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biseccionynewton;

/**
 *
 * @author marianamartinez
 */

import java.math.*;

public class BiseccionYNewton {

    /**
     * @param args the command line arguments
     */
    
    public static double función(double x)
    {
        double y;
        y=x-Math.exp(-x);
        return y;  
    }
    
    public static double derivada(double x)
    {
        double y;
        y=1+Math.exp(-x);
        return y;  
    }
    
    public static double errorRelativo(double experimento, double aprox)
    {
        return Math.abs(experimento-aprox)/Math.abs(experimento);
    }
    
    public static void metodoNewton()
    {
        int i;
        double p=0.5;
        double aprox=0.567143290409784;
        System.out.println("Iteración 0:    "+ p);
        System.out.println("Error de la iteración 0:    "+ errorRelativo(p, aprox));
        
        
        for (i=1; i<41; i++)
        {
            p=p-(función(p)/derivada(p));
            System.out.println("Iteración "+ i+ ":    "+p);
            System.out.println("Error de la iteración "+ i+ ":    "+ errorRelativo(p, aprox));
        }
    }
    
    public static void metodoBiseccion()
    {
        int i;
        double a, b, c, aprox;
        a=0;
        b=1;
        aprox=0.567143290409784;

        for (i=0; i<41; i++)
        {
            c=(a+b)/2;
            if (función(c)==0)
            {
                System.out.println("La solucion se encontró en la "
                        + "iteración: "+i+"   "+c);
            }
            if (función(c)<0 && función(b)>0)
            {
                a=c;
                System.out.println("Iteración "+ i+ "    "+c);
                System.out.println("Error de la iteración "+
                        i+ ":    "+ errorRelativo(c, aprox));
            }
            if (función(a)<0 && función(c)>0)
            {
                b=c;
                System.out.println("Iteración "+ i+ "    "+c);
                System.out.println("Error de la iteración "+
                        i+ ":    "+ errorRelativo(c, aprox));
            }
        }
    }
    
    
    public static void main(String[] args) {
        // TODO code application logic here
        
        metodoBiseccion();
        
        
    }
    
}
