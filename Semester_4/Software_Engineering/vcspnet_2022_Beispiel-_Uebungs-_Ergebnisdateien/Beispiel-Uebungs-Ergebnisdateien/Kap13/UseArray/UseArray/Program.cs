using System;

namespace UseArray
{
  class Program
  {
    static void Main(string[] args)
    {
      int a = 2;
      int b = 6;
      int[] field = { 3, 4, 5, a + b };

      field[2] = 7;

      Console.WriteLine("Das Feld enthält {0} Elemente: ", field.Length);

      for (int i = 0; i < field.Length; i++)
      {
        Console.WriteLine("Element {0}: {1}", i, field[i]);
      }
    }
  }
}