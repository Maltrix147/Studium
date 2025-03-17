using System;

namespace BruchzahlenMitKuerzen
{
  class Program
  {
    static void Main(string[] args)
    {
      Bruchzahl bruchzahl1 = new Bruchzahl(5, 6);
      Bruchzahl bruchzahl2 = new Bruchzahl(3, 4);
      Bruchzahl ergebnis;

      ergebnis = bruchzahl1 + bruchzahl2;
      Console.WriteLine("{0} + {1} = {2}",
          bruchzahl1.ToString(), bruchzahl2.ToString(), ergebnis.ToString());

      ergebnis = bruchzahl1 * bruchzahl2;
      Console.WriteLine("{0} * {1} = {2}",
          bruchzahl1.ToString(), bruchzahl2.ToString(), ergebnis.ToString());
    }
  }
}