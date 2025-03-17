using System;

namespace Zahlen4
{
  class Zahl1
  {
    protected int wert;
  }

  class Zahl2 : Zahl1
  {
    new protected string wert;

    public Zahl2(int i, string s)
    {
      base.wert = i;
      wert = s;
    }

    public void Ausgabe()
    {
      Console.WriteLine(wert);
      Console.WriteLine(base.wert);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Zahl2 eineZahl = new Zahl2(10, "Zehn");
      eineZahl.Ausgabe();
    }
  }
}