using System;

namespace AverageOfParamArray
{
  class Program
  {
    static double Average(params double[] numbers)
    {
      double sum = 0;

      foreach (double d in numbers)
      {
        sum += d;
      }

      return sum / numbers.Length;
    }

    static void Main(string[] args)
    {
      Console.WriteLine(Average(0, 1, 3, 5));
      Console.WriteLine(Average(2, 4));
      Console.WriteLine(Average(1, 1, 3, 5, 7));
    }
  }
}