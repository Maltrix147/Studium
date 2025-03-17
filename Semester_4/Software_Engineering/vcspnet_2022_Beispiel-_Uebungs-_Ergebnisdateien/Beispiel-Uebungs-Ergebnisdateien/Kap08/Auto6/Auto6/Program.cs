using System;

namespace Auto6
{
  class Fahrzeug
  {
    internal int geschwindigkeit;

    internal void Anzeigen()
    {
      Console.WriteLine("Geschwindigkeit: " + this.geschwindigkeit);
    }

    internal void Stop()
    {
      geschwindigkeit = 0;
    }

    internal void Beschleunigen(int wert)
    {
      this.geschwindigkeit += wert;
    }

    internal void Beschleunigen(double faktor)
    {
      double value = this.geschwindigkeit * faktor;
      this.geschwindigkeit = Convert.ToInt32(value);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Fahrzeug PKW = new Fahrzeug();
      PKW.geschwindigkeit = 54;
      PKW.Anzeigen();
      PKW.Beschleunigen(17);
      PKW.Anzeigen();
      PKW.Beschleunigen(1.7);
      PKW.Anzeigen();
    }
  }
}