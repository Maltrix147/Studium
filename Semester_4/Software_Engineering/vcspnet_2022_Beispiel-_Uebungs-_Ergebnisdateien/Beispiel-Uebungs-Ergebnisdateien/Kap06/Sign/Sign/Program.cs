using System;

namespace Sign
{
  class Program
  {
    static void Main(string[] args)
    {
      int i = 3;
      int result = 0;

      result = -i;          // result erhält den Wert -3
      Console.WriteLine(result);

      result = -(i - 5); 	// result erhält den Wert 2
      Console.WriteLine(result);

      result = -(-3);   	// result erhält den Wert 3	
      Console.WriteLine(result);
    }
  }
}