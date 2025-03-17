using System;

namespace ReducedNotation
{
  class Program
  {
    static void Main(string[] args)
    {
      int i = 15;
      int k = 3;
      bool b = true;
      string s = "Programm";

      i += 5;		   // ausführlich: i = i + 5;	   -> i erhält den Wert 20 
      Console.WriteLine(i);

      s += "ierung";   // ausführlich: s = s + "ierung";	
      // -> s erhält den Wert "Programmierung"
      Console.WriteLine(s);

      i += k; 	       // ausführlich: i = i + k; 	   -> i erhält den Wert 23
      Console.WriteLine(i);

      i -= 7;		       // ausführlich: i = i - 7;  -> i erhält den Wert 16
      Console.WriteLine(i);

      i /= k;		       // ausführlich: i = i / k;  -> i erhält den Wert 5
      Console.WriteLine(i);

      i *= 7;		       // ausführlich: i = i * 7; -> i erhält den Wert 35
      Console.WriteLine(i);

      i %= 8; 	       // ausführlich: i = i % 8;	  -> i erhält den Wert 3
      Console.WriteLine(i);

      b ^= true;       // ausführlich: b = b ^ false; -> b erhält den Wert true
      Console.WriteLine(b);

      b |= true;       // ausführlich: b = b | true;  -> b erhält den Wert true
      Console.WriteLine(b);

      b &= true;       // ausführlich: b = b & true;  -> b erhält den Wert true
      Console.WriteLine(b);
    }
  }
}