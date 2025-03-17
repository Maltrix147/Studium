using System;

namespace Ausnahme
{
  class Program
  {
    static void Main(string[] args)
    {
      int x = 10;
      int y = 0;

      try
      {
        x /= y;
      }
      catch (DivideByZeroException e)
      {
        Console.WriteLine(e.Message);
      }
      finally
      {
        Console.WriteLine("Der finally-Block wurde aufgerufen.");
      }
    }
  }
}