using System;

namespace VerzweigtesArray
{
  class Program
  {
    static void Main(string[] args)
    {
      int[][] field = new int[2][];

      field[0] = new int[] { 23, 74, 56, 14 };
      field[1] = new int[] { 17, 38, 21 };

      foreach (int[] inneresArray in field)
      {
        foreach (int element in inneresArray)
          Console.Write(element + "\t"); // \t erzeugt einen Tabulatorsprung

        Console.WriteLine();
      }
    }
  }
}