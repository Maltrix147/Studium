using System;

namespace Bankkonto
{
  class Program
  {
    static double Eingabe()
    {
      Console.Write("Betrag: ");

      return Convert.ToDouble(Console.ReadLine());
    }

    static void Main(string[] args)
    {
      IKonto einKonto;
      int aktion;
      einKonto = new Konto(5000);

      Console.WriteLine("Kontostand: {0}", einKonto.Kontostand);

      do
      {
        Console.WriteLine("Einzahlen (1), Auszahlen (2), Beenden (0): ");
        aktion = Convert.ToInt32(Console.ReadLine());

        switch (aktion)
        {
          case 0: break;
          case 1: einKonto.Kontostand += Eingabe();
            break;
          case 2: einKonto.Kontostand -= Eingabe();
            break;
          default:
            Console.WriteLine("Keine gültige Eingabe!");
            break;
        }

        Console.WriteLine("Kontostand: {0}", einKonto.Kontostand);

      } 
      while (aktion != 0);
    }
  }
}
