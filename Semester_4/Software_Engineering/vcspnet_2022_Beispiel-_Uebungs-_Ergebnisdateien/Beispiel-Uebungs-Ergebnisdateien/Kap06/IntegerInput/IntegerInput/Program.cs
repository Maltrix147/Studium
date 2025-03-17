using System;

namespace IntegerInput
{
  class Program
  {
    static void Main(string[] args)
    {
      string s;
      int i;

      // Ausgabe eines Textes ohne Zeilenumbruch (Write statt WriteLine)
      Console.Write("Geben Sie eine ganze Zahl ein: ");

      s = Console.ReadLine();
      i = Int32.Parse(s);

      Console.WriteLine("Die Zahl " + i + " wurde eingegeben");
    }
  }
}