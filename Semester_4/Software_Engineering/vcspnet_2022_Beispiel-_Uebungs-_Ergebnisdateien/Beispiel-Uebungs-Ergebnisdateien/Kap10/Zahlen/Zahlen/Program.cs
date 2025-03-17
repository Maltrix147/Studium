using System;

namespace Zahlen
{
  class Program
  {
    static void Main(string[] args)
    {
      Zahl2 eineZahl = new Zahl2();

      eineZahl.Eingabe(10);
      eineZahl.Ausgabe();
    }
  }
}