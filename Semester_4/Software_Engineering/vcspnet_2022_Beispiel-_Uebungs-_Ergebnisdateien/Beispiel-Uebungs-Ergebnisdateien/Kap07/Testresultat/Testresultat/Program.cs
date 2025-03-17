using System;

namespace Testresultat
{
  class Program
  {
    static void Main(string[] args)
    {
      string txt;
      int pkt;

      Console.Write("Bitte Punktzahl eingeben: ");
      txt = Console.ReadLine();
      pkt = Convert.ToInt32(txt);

      if (pkt >= 7)
        Console.WriteLine("Der Test ist bestanden!");
      else
        Console.WriteLine("Der Test ist leider nicht bestanden!");
    }
  }
}