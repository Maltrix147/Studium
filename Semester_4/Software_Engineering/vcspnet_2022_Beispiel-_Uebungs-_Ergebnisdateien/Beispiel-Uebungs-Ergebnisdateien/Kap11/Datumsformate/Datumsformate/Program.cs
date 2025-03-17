using System;

namespace Datumsformate
{
  abstract class Datum
  {
    protected DateTime datumsWert;

    abstract public void Ausgabe();
  }

  class DatumsForm1 : Datum
  {
    public override void Ausgabe()
    {
      datumsWert = DateTime.Now;
      Console.WriteLine(datumsWert.ToLongDateString());
    }
  }

  class DatumsForm2 : Datum
  {
    public override void Ausgabe()
    {
      datumsWert = DateTime.Now;
      Console.WriteLine(datumsWert.ToShortDateString());
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Datum einDatum;
      einDatum = new DatumsForm1();
      einDatum.Ausgabe();
      einDatum = new DatumsForm2();
      einDatum.Ausgabe();
    }
  }

  class Test : Datum
  {
    public override void Ausgabe()
    {
      throw new NotImplementedException();
    }
  }
}