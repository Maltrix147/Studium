using System;

namespace TestResultat3
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

        switch (pkt)
        {
          case 10:
            txt = "Sehr gut";
            break;
          case 9:
            txt = "Gut";
            break;
          case 8:
            txt = "Befriedigend";
            break;
          case 7:
            txt = "Ausreichend";
            break;
          case 6:
          case 5:
          case 4:
          case 3:
          case 2:
          case 1:
          case 0:
            txt = "Leider nicht genügend Punkte erreicht";
            break;
          case -1:
            continue;
          default:
            txt = "Ungültige Punktzahl";
            break;
        }

        Console.WriteLine(txt);
      }
      while (pkt != -1);
    }
  }
}