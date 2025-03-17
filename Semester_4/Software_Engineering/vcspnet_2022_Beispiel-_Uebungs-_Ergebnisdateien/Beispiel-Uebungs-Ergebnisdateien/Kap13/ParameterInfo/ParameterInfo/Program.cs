using System;

namespace ParameterInfo
{
  class Program
  {
    static void Main(string[] args)
    {
      for (int i = 0; i < args.Length; i++)
      {
        Console.WriteLine(args[i]);
      }

      foreach (string s in args)
      {
        Console.WriteLine(s);
      }
    }
  }
}