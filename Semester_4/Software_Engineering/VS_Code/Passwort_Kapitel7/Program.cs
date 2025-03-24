using System;
using System.ComponentModel;

namespace Discount
{
  class Program
  {
    static void Main(string[] args)
    {
        string geheim ="MeinGeheimesPasswort";
        string passwort;
        int zähler = 0;
        
        do 
        {
            
            while (zähler<3)
            {

            Console.WriteLine("Bitte Passwort eingeben");
            passwort=Console.ReadLine();
            if (passwort != geheim)
            {
                Console.WriteLine("Passwort falsch");
            }
            
            else 
            {
                Console.WriteLine("Passwort korrekt");
            }
            zähler++;
            }
            Console.WriteLine("zu viele Versuche"); 
            break;

        }
        while (passwort!=geheim);
        Console.WriteLine("Schleife beendet");
    }
  }
}