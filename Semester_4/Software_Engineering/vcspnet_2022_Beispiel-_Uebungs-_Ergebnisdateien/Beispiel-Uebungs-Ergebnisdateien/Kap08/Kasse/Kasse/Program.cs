using System;

namespace Kasse
{
  class Rechnung
  {
    public double Bruttobetrag;

    public void Brutto(double betrag, double MWST)
    {
      this.Bruttobetrag = betrag * (1.0 + MWST);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Rechnung rechnung1 = new Rechnung();

      rechnung1.Brutto(134, 0.19);

      Console.WriteLine(rechnung1.Bruttobetrag);
    }
  }
}