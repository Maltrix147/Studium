using System;
using System.Collections;

namespace Stapel
{
  class Program
  {
    static void Main(string[] args)
    {
      Stack simpleStack = new Stack();

      for (int i = 0; i < 20; i++)
      {
        simpleStack.Push("Inhalt von Stapelelement " + i.ToString());
      }

      Console.WriteLine("Anzahl der Elemente: {0}", simpleStack.Count);
      Console.WriteLine(simpleStack.Pop().ToString() + " entfernt");
      Console.WriteLine(simpleStack.Pop().ToString() + " entfernt");
      Console.WriteLine("Anzahl der Elemente: {0}", simpleStack.Count);

      foreach (string s in simpleStack)
      {
        Console.WriteLine(s);
      }
    }
  }
}