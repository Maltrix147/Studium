using System;

namespace Datumsformate2
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

  class DatumsForm3 : Datum
  {
    public override void Ausgabe()
    {
      datumsWert = DateTime.Now;
      Console.WriteLine(datumsWert.ToOADate());
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
      
      einDatum = new DatumsForm3();
      einDatum.Ausgabe();
    }
  }
}