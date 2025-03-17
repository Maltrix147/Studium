using System;

namespace Ueberladen
{

  class Wert
  {
    public void Ausgabe(int number)
    {
      Console.WriteLine("Die Ganzzahl lautet: " + number);
    }

    public void Ausgabe(double value)
    {
      Console.WriteLine("Die Dezimalzahl lautet: " + value);
    }

    public void Ausgabe(string txt)
    {
      Console.WriteLine("Der Text lautet: " + txt);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Wert wertObjekt = new Wert();

      wertObjekt.Ausgabe(123);
      wertObjekt.Ausgabe(123.456);
      wertObjekt.Ausgabe("Hallo Welt!");
    }
  }
}