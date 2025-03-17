using System;

namespace Auto3
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
      wert = wert + this.geschwindigkeit;
      this.geschwindigkeit = wert;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Fahrzeug PKW = new Fahrzeug();

      PKW.geschwindigkeit = 54;
      PKW.Anzeigen();
      int zahl = 17;
      Console.WriteLine("Zahl: " + zahl);

      PKW.Beschleunigen(zahl);
      PKW.Anzeigen();
      Console.WriteLine("Zahl: " + zahl);

      PKW.Beschleunigen(5);
      PKW.Anzeigen();
    }
  }
}