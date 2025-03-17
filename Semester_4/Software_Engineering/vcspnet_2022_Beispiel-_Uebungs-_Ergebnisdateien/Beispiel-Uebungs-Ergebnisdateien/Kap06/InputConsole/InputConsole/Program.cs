using System;

namespace InputConsole
{
  class Program
  {
    static void Main(string[] args)
    {
      int integerValue;
      double doubleValue;
      string txt;
      string s;

      Console.Write("Bitte geben Sie eine ganze Zahl ein: ");
      s = Console.ReadLine();
      integerValue = Int32.Parse(s);

      Console.Write("Bitte geben Sie eine Dezimalzahl mit zwei Nachkommastellen ein: ");
      s = Console.ReadLine();
      doubleValue = Convert.ToDouble(s);

      Console.Write("Bitte geben Sie ein Wort ein: ");
      txt = Console.ReadLine();

      Console.WriteLine();
      Console.WriteLine("Folgendes wurde eingegeben: ");
      Console.WriteLine("Ganzzahl: " + integerValue);
      Console.WriteLine("Dezimalzahl: " + doubleValue);
      Console.WriteLine("Wort: " + txt);
      Console.WriteLine();
      Console.WriteLine("Zum Beenden RETURN betätigen!");
      Console.ReadLine();
    }
  }
}