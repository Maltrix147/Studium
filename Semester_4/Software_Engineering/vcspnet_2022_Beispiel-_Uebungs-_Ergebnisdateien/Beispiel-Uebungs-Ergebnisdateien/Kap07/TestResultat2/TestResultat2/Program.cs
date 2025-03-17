using System;

namespace TestResultat2
{
  class Program
  {
    static void Main(string[] args)
    {
      string txt;
      int pkt = 0;

      do
      {
        Console.Write("Bitte Punktzahl eingeben: ");
        txt = Console.ReadLine();
        pkt = Convert.ToInt32(txt);

        if (pkt == -1)
          continue;
        else
        {
          if (pkt < -1 || pkt > 10)
            Console.WriteLine("Ungültige Punktzahl!");
          else
          {
            if (pkt >= 7)
              Console.WriteLine("Der Test ist bestanden!");
            else
              Console.WriteLine("Der Test ist leider nicht bestanden!");
          }
        }
      }
      while (pkt != -1);
    }
  }
}