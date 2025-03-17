using System;

namespace ImplTypVar
{
  class Program
  {
    static void Main(string[] args)
    {
      var nummer = 123;
	  
      // vom Compiler ermittelten Typ ausgeben
      Console.WriteLine(nummer.GetType().ToString());

      for (var i = 0; i < 5; i++)
        Console.WriteLine(i);
    }
  }
}