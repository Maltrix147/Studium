using System;

namespace Kontofuehrung
{
  class Program
  {
    public static double Eingabe()
    {
      Console.Write("Betrag: ");
      return Convert.ToDouble(Console.ReadLine());
    }

    static void Main(string[] args)
    {
      Konto einKonto;
      string aktion;

      einKonto = new Konto(5000.00);

      Console.WriteLine("Kontostand: {0}", einKonto.Kontostand);

      do
      {
        Console.WriteLine("Einzahlen (1), Auszahlen (2), Beenden (0):");
        aktion = Console.ReadLine();

        switch (aktion)
        {
          case "0":
            break;
          case "1":
            einKonto.Kontostand += Eingabe();
            break;
          case "2":
            einKonto.Kontostand -= Eingabe();
            break;
          default:
            Console.WriteLine("keine gültige Eingabe!");
            break;
        }

        Console.WriteLine("Kontostand: {0}", einKonto.Kontostand);
      }
      while (aktion != "0");
    }
  }
}