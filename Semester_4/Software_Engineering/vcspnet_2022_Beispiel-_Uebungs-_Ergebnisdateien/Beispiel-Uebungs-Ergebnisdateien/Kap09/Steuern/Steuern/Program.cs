using System;

namespace Steuern
{
  class Steuern
  {
    private static double Mehrwertsteuer;

    public static double MWST
    {
      get { return Steuern.Mehrwertsteuer; }
      set { Steuern.Mehrwertsteuer = value; }
    }

    public static double InclMWST(double betrag)
    {
      betrag += betrag * MWST;
      return betrag;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Steuern.MWST = 0.19;
      Console.WriteLine(Steuern.MWST);
      double betrag = 276.0;
      double gesamt;

      gesamt = Steuern.InclMWST(betrag);
      
      Console.WriteLine("Netto: {0:0.00} Brutto: {1:0.00}", betrag, gesamt);
    }
  }
}