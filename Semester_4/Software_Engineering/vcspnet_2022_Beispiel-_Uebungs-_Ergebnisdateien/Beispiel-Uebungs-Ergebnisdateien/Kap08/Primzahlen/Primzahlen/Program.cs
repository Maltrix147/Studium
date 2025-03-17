using System;

namespace Primzahlen
{
  class Zahl
  {
    public bool IsPrime(int value)
    {
      if (value <= 1)
        return false;
      else
      {
        if (value > 2)
        {
          for (int i = 2; i <= (value / 2) + 1; i++)
            if (value % i == 0)
              return false;
        }
      }

      return true;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Zahl zahlObjekt = new Zahl();

      Console.WriteLine("Bitte geben Sie die unterer Grenze des Zahlenbereichs ein: ");
      int low = Convert.ToInt32(Console.ReadLine());
      Console.WriteLine("Bitte geben Sie die obere Grenze des Zahlenbereichs ein:   ");

      int high = Convert.ToInt32(Console.ReadLine());

      for (int i = low; i <= high; i++)
      {
        if (zahlObjekt.IsPrime(i))
        {
          Console.Write("{0}\t", i);
        }
      }

      Console.WriteLine();
    }
  }
}