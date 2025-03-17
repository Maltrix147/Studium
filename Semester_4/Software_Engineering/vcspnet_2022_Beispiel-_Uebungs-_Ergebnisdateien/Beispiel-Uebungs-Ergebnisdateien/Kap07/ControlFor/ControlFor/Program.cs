using System;

namespace ControlFor
{
  class Program
  {
    static void Main(string[] args)
    {
      int result = 1;
      int number = 0;

      Console.Write("Geben Sie eine Zahl zwichen 1 und 15 ein: ");
      string txt = Console.ReadLine();
      number = Convert.ToInt32(txt);

      if (number >= 1 && number <= 15)
      {
        for (int i = 1; i <= number; i++)
        {
          result *= i;
        }

        Console.WriteLine("{0}! = {1}", number, result);
      }
      else
      {
        Console.WriteLine("Die Zahl liegt nicht im gültigen Bereich");
      }
    }
  }
}