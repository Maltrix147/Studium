using System;

namespace Auto2
{
  class Fahrzeug
  {
    internal int geschwindigkeit;

    internal void Anzeigen()
    {
      Console.WriteLine("Geschwindigkeit: " + this.geschwindigkeit);
    }

   
  }

  class Program
  {
    static void Main(string[] args)
    {
      Fahrzeug PKW = new Fahrzeug();
 
      PKW.geschwindigkeit = 54;
      
      Fahrzeug fahrrad = new Fahrzeug();
      
      fahrrad.geschwindigkeit = 18;
      PKW.Anzeigen();
      fahrrad.Anzeigen();
    
      PKW.Anzeigen();
    }
  }
}