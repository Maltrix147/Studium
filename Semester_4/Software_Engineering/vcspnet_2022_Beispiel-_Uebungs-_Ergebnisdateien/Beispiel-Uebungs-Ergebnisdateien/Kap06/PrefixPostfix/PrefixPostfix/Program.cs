using System;

namespace PrefixPostfix
{
  class Program
  {
    static void Main(string[] args)
    {
      int i = 5;
      int j = 5;

      i++;					            // entspricht ++i	i erhält den Wert 6
      Console.WriteLine(i);

      j--;            					// entspricht --j	j erhält den Wert 4
      Console.WriteLine(j);
      
      int result1 = 2 * ++i;	  		// result1 erhält den Wert 14
      Console.WriteLine(result1);
      
      int result2 = 2 * j++;	 		 // result2 erhält den Wert 8
      Console.WriteLine(result2);
    }
  }
}
