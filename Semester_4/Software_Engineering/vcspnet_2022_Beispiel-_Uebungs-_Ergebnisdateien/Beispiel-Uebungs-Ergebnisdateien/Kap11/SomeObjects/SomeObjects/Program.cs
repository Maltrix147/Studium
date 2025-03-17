using System;

namespace SomeObjects
{
  class Program
  {
    static void Main(string[] args)
    {
      object obj;
 
      obj = "eine Zeichenkette";

      Console.WriteLine(obj.GetType().Name);

      obj = 5;
      
      Console.WriteLine(obj.GetType().Name);
      Console.WriteLine(typeof(object));

      if (obj is int)
        Console.WriteLine("Integer");
    }
  }
}