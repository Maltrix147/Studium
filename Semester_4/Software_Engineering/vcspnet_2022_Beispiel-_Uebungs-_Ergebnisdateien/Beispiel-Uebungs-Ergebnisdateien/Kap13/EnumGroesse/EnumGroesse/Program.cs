using System;

namespace EnumGroesse
{
  enum Groesse
  {
    Klein = 5,
    Mittelgross = 10,
    Gross = Klein + Mittelgross
  }

  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Wert von {0}: {1}", Groesse.Gross, (int)Groesse.Gross);
      Console.WriteLine("Wert von {0} + 1: {1}", Groesse.Gross, 1 + Groesse.Gross);

      foreach (string s in Enum.GetNames(typeof(Groesse)))
      {
        Console.WriteLine(s);
      }

      foreach (int i in Enum.GetValues(typeof(Groesse)))
      {
        Console.WriteLine(i);
      }
    }
  }
}