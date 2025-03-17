using System;

namespace Zahlen2
{
  class Zahl1
  {
    protected int wert;

    public Zahl1(int wert)
    {
      this.wert = wert;
      Console.WriteLine("Konstruktor der Basisklasse");
    }

    public void Ausgabe()
    {
      Console.WriteLine(this.GetType());
      Console.WriteLine(this.wert);
    }
  }
}
