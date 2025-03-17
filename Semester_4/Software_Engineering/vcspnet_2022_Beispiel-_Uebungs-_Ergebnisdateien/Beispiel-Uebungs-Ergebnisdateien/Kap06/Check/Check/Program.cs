using System;

namespace Check
{
  class Program
  {
    static void Main(string[] args)
    {
      sbyte a = 127, b = 12, c;
	  
      c = unchecked((sbyte)(a + b));
	  
      Console.WriteLine(c);
    }
  }
}