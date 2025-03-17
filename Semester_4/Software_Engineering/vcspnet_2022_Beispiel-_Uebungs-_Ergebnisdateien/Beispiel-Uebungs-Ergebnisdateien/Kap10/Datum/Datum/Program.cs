using System;

namespace Datum
{
  class Datum1
  {
    protected DateTime Wert;

    public void Ausgabe()
    {
      Console.WriteLine(Wert.ToShortDateString());
    }
  }

  class Datum2 : Datum1
  {
    public void Eingabe(DateTime i)
    {
      Wert = i;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Datum2 instanz = new Datum2();
      instanz.Eingabe(Convert.ToDateTime("01.01.13"));
      instanz.Ausgabe();
    }
  }
}
