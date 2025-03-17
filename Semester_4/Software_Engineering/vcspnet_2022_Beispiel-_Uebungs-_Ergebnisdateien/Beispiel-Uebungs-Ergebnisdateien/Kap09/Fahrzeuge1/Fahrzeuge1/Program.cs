using System;

namespace Fahrzeuge1
{
  class Fahrzeug
  {
    private int geschwindigkeit;

    public int Geschwindigkeit
    {
      get
      {
        return this.geschwindigkeit;
      }
      set
      {
        if (value > 200)
        {
          value = 200;
        }
        this.geschwindigkeit = value;
      }
    }

    public Fahrzeug(int wert)
    {
      this.Geschwindigkeit = wert;
    }

    public Fahrzeug()
    {
      this.Geschwindigkeit = 50;
    }

    //public Fahrzeug()
    //    : this(50)
    //{
    //}

    ~Fahrzeug()
    {
      Console.WriteLine("Das Objekt wird zerstört");
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Fahrzeug PKW1 = new Fahrzeug();
      Fahrzeug PKW2 = new Fahrzeug(38);

      Console.WriteLine("Geschwindigkeit 1: {0} km/h", PKW1.Geschwindigkeit);
      Console.WriteLine("Geschwindigkeit 2: {0} km/h", PKW2.Geschwindigkeit);
    }
  }
}