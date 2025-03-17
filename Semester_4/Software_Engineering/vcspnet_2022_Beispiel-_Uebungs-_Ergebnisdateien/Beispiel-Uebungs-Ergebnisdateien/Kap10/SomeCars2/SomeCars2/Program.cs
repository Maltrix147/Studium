using System;

namespace SomeCars2
{
  class Program
  {
    static void Main(string[] args)
    {
      Auto Auto1 = new Auto("Rot", 1988);
      PKW PKW1 = new PKW("Gelb", 2002, 9);

      Console.WriteLine("Auto1: {0}, Bj. {1}", Auto1.Farbe, Auto1.Baujahr);
      Console.WriteLine("PKW1: {0} Plätze, {1}, Bj. {2}", PKW1.Sitzplaetze, PKW1.Farbe, PKW1.Baujahr);

      Auto1.Farbe = "Gruen";
      PKW1.Farbe = "Blau";
      PKW1.Sitzplaetze = 7;

      Console.WriteLine();
      Console.WriteLine("Auto1: {0}, Bj. {1}", Auto1.Farbe, Auto1.Baujahr);
      Console.WriteLine("PKW1: {0} Plätze, {1}, Bj. {2}", PKW1.Sitzplaetze, PKW1.Farbe, PKW1.Baujahr);
    }
  }
}