using System;

namespace Operators
{
  class Program
  {
    static void Main(string[] args)
    {
      int i;
      double x;

      i = 3 + 4 * 5;
      Console.WriteLine("3 + 4 * 5 = " + i.ToString());
 
      i = (3 + 4) * 5;
      Console.WriteLine("(3 + 4) * 5 = " + i.ToString());
      
      i = 13 / 5;
      Console.WriteLine("13 / 5 = " + i.ToString());
      
      x = 13 / 5;
      Console.WriteLine("13 / 5 = " + x.ToString());
      
      x = 13.0 / 5.0;
      Console.WriteLine("13.0 / 5.0 = " + x.ToString());
      
      i = 13 % 5;
      Console.WriteLine("13 % 5 = " + i.ToString());
      
      x = 13.0 % 5.0;
      Console.WriteLine("13.0 % 5.0 = " + x.ToString());
    }
  }
}