using System;

namespace Zahlen3
{
  class Zahl2 : Zahl1
  {
    public Zahl2(): base(5)
    {
      Console.WriteLine("Konstruktor der abgeleiteten Klasse");
    }

    public void Eingabe(int i)
    {
      this.wert = i;
    }
  }
}
