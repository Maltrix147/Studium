using System;

namespace SomeCars
{
  class Auto
  {
    string fahrzeugFarbe;

    public string Farbe
    {
      get { return fahrzeugFarbe; }
      set { fahrzeugFarbe = value; }
    }
    int fahrzeugBaujahr;

    public int Baujahr
    {
      get { return fahrzeugBaujahr; }
      set { fahrzeugBaujahr = value; }
    }

    public Auto(string farbe, int baujahr)
    {
      this.Farbe = farbe;
      this.Baujahr = baujahr;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Auto Auto1 = new Auto("Rot", 1978);
      Auto Auto2 = new Auto("Gelb", 2011);

      Console.WriteLine("Auto1: {0}\t{1}", Auto1.Farbe, Auto1.Baujahr);
      Console.WriteLine("Auto2: {0}\t{1}", Auto2.Farbe, Auto2.Baujahr);

      Auto1.Farbe = "Gruen";
      Auto2.Farbe = "Blau";

      Console.WriteLine("\nAuto1: {0}\t{1}", Auto1.Farbe, Auto1.Baujahr);
      Console.WriteLine("Auto2: {0}\t{1}", Auto2.Farbe, Auto2.Baujahr);
    }
  }
}