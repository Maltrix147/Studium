using System;

namespace Bruchzahlen
{
  class Program
  {
    static void Main(string[] args)
    {
      Bruchzahl bruchzahl1 = new Bruchzahl(2, 5);
      Bruchzahl bruchzahl2 = new Bruchzahl(2, 3);
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