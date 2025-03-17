using System;

namespace Erweiterungsmethoden
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Test".Reverse());
    }
  }

  public static class StringExtension
  {
    public static string Reverse(this string original)
    {
      string reverseString = null;

      for (int i = original.Length - 1; i >= 0; i--)
        reverseString = reverseString + original[i];

      return reverseString;
    }
  }
}