using System;

namespace Fahrzeuge
{
  class Fahrzeug
  {
    private int Leistung;

    public int Leistung1
    {
      get { return Leistung; }
      set { Leistung = value; }
    }

    private int aktuelleGeschwindigkeit;

    public int Geschwindigkeit
    {
      get
      {
        return this.aktuelleGeschwindigkeit;
      }
      set
      {
        if (value > 200)
          value = 200;

        this.aktuelleGeschwindigkeit = value;
      }
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Fahrzeug PKW = new Fahrzeug();
      
      PKW.Geschwindigkeit = 54;
      Console.WriteLine("Geschwindigkeit: {0} km/h", PKW.Geschwindigkeit);
      
      PKW.Geschwindigkeit = 238;
      Console.WriteLine("Geschwindigkeit: {0} km/h", PKW.Geschwindigkeit);
    }
  }
}