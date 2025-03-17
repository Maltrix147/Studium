using System;

namespace Klonen
{
  class Program
  {
    static void Main(string[] args)
    {
      int[] originalArray = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
      int[] kopieArray = new int[originalArray.Length];

      Array.Copy(originalArray, kopieArray, originalArray.Length); // das Array in voller Länge kopieren

      foreach (int einWert in originalArray)
      {
        Console.Write(einWert + " ");
      }
      Console.WriteLine();

      foreach (int einWert in kopieArray)
      {
        Console.Write(einWert + " ");
      }
      Console.WriteLine();

      Array.Clear(originalArray, 0, originalArray.Length); // die Werte des Originalarrays löschen 
      Console.WriteLine();
      
      foreach (int einWert in originalArray)
      {
        Console.Write(einWert + " ");
      }
      Console.WriteLine();

      foreach (int einWert in kopieArray)
      {
        Console.Write(einWert + " ");
      }
      Console.WriteLine();
    }
  }
}