using System;

namespace ArrayMethods
{
  class Program
  {
    static void Main(string[] args)
    {
      int i;
      int[] ar = new int[24];
      int[] ar2 = new int[30];

      for (int j = 0; j < ar.Length; j++)
      {
        ar[j] = j;
      }

      foreach (int x in ar)
      {
        Console.Write(x + " ");
      }
      Console.WriteLine();

      ar.CopyTo(ar2, 4);
      foreach (int x in ar2)
      {
        Console.Write(x + " ");
      }
      Console.WriteLine();

      i = ar.Rank;
      Console.WriteLine(i);

      i = ar.GetUpperBound(0);
      Console.WriteLine(i);

      i = ar.GetLowerBound(0);
      Console.WriteLine(i);

      i = ar.GetLength(0);
      Console.WriteLine(i);

      i = ar.Length;
      Console.WriteLine(i);

      System.Array.Clear(ar, 0, 24);
      foreach (int x in ar)
      {
        Console.Write(x + " ");
      }
      Console.WriteLine();

      for (int j = 0; j < ar.Length; j++)
      {
        ar[j] = j;
      }

      System.Array.Reverse(ar);
      foreach (int x in ar)
      {
        Console.Write(x + " ");
      }
      Console.WriteLine();

      ar.SetValue(123, 2);
      foreach (int x in ar)
      {
        Console.Write(x + " ");
      }
      Console.WriteLine();

      System.Array.Sort(ar);
      foreach (int x in ar)
      {
        Console.Write(x + " ");
      }
      Console.WriteLine();

      i = System.Array.BinarySearch(ar, 123);
      Console.WriteLine(i);
    }
  }
}