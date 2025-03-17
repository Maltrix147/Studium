using System;

namespace Auto
{
  class Fahrzeug
  {
    internal int geschwindigkeit;
  }

  class Program
  {
    static void Main(string[] args)
    {
      Fahrzeug PKW = new Fahrzeug();
      PKW.geschwindigkeit = 54;

      Fahrzeug fahrrad = new Fahrzeug();
      fahrrad.geschwindigkeit = 18;

      Console.WriteLine("Geschwindigkeit: {0} km/h", PKW.geschwindigkeit);
      Console.WriteLine("Geschwindigkeit: {0} km/h", fahrrad.geschwindigkeit);
    }
  }
}