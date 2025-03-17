using System;

namespace ExplicitConvert
{
  class Klasse1
  {
    internal double Wert;
    internal string text;

    public static explicit operator Klasse1(double d)  // Konvertierungsoperator
    {
      Klasse1 c = new Klasse1();         // Instanz c wird erzeugt

      c.Wert = d;                        // Zuweisung als Zahl
      c.text = d.ToString();             // Zuweisung als String      
 
      return c;                          // Instanz c wird zurückgegeben
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      double zahl = 34.2342;

      Klasse1 instanz = (Klasse1)zahl;       // Aufruf des Konvertierungoperators
      Console.WriteLine("Wert: " + instanz.Wert + "\nText: " + instanz.text);
    }
  }
}