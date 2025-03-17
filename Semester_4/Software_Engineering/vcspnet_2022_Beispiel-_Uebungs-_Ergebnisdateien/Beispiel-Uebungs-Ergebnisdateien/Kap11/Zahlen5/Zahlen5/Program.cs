using System;

namespace Zahlen5
{
  class Zahl1
  {
    protected int wert;

    internal virtual void Ausgabe()
    {
      Console.WriteLine(wert);
    }
  }

  class Zahl2 : Zahl1
  {
    new protected string wert;

    public Zahl2(int i, string s)
    {
      base.wert = i;
      wert = s;
    }

    internal override void Ausgabe()
    {
      base.Ausgabe();

      Console.WriteLine(wert);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Zahl1 eineZahl;

      eineZahl = new Zahl1();
      eineZahl.Ausgabe();

      eineZahl = new Zahl2(10, "Zehn");
      eineZahl.Ausgabe();
    }
  }
}