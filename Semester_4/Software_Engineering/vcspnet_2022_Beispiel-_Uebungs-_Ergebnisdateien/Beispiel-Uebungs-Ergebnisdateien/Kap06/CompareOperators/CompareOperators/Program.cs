using System;

namespace CompareOperators
{
  class Program
  {
    static void Main(string[] args)
    {
      int i = 10;
      int j = 15;
      bool b;
	  
      b = i > j; 			// b erhält den Wert false
      Console.WriteLine(b);
	  
      b = i != j;			// b erhält den Wert true
      Console.WriteLine(b);
	  
      b = i == j; 		    // b erhält den Wert false
      Console.WriteLine(b);
    }
  }
}