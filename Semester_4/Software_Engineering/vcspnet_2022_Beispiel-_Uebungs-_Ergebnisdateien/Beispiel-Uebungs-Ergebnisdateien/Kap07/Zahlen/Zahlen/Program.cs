using System;

namespace Zahlen
{
  class Program
  {
    static void Main(string[] args)
    {
      int zahl = 0;
      string txt;

      Console.Write("Geben Sie eine Zahl zwischen 1 und 3 ein: ");
      txt = Console.ReadLine();
      zahl = Convert.ToInt32(txt);

      switch (zahl)
      {
        case 1: Console.WriteLine("Eins");
          break;
        case 2: Console.WriteLine("Zwei");
          break;
        case 3: Console.WriteLine("Drei");
          break;
        default:
          Console.WriteLine("ungültige Zahl");
          break;
      }

      Console.WriteLine("Eingegeben wurde: " + zahl);
    }
  }
}