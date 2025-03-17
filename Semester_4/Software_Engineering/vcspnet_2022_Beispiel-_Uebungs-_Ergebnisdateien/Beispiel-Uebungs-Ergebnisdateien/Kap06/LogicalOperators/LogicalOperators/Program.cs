using System;

namespace LogicalOperators
{
  class Program
  {
    static void Main(string[] args)
    {
      int k = 0;
      int i = 1;
      bool b = false;

      b = (k > i) & (k >= 0);	    // b erhält den Wert false, da k nicht größer als i
      Console.WriteLine(b);

      b = (k > i) | (i > k);	    // b erhält den Wert true, da i größer als k
      Console.WriteLine(b);

      b = !b;				        // b erhält den Wert false, da b zuvor true war
      Console.WriteLine(b);

      b = (k > i) && (k >= 0);	  // da k > i nicht zutrifft, kann auch der gesamte
                                  // Ausdruck nicht wahr sein. Der zweite Ausdruck
                                  // k >= 0 wird daher nicht mehr ausgewertet. 
      Console.WriteLine(b);

      b = (i > k) || (k > i);	  // k > i wird nicht ausgewertet, da bereits i > k 
                                  // den Wert true liefert
      Console.WriteLine(b);
    }
  }
}