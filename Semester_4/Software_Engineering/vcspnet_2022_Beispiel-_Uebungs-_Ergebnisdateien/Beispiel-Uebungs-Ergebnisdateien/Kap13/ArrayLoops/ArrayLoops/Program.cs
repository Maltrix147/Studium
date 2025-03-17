using System;

namespace ArrayLoops
{
  class Program
  {
    static void Main(string[] args)
    {
      int[] squareNumbers = new int[10];

      for (int i = 0; i < squareNumbers.Length; i++)
      {
        squareNumbers[i] = i * i;
      }

      for (int i = 0; i < squareNumbers.Length; i++)
      {
        Console.WriteLine(squareNumbers[i]);
      }

      foreach (int sq in squareNumbers)
      {
        Console.WriteLine(sq);
      }
    }
  }
}