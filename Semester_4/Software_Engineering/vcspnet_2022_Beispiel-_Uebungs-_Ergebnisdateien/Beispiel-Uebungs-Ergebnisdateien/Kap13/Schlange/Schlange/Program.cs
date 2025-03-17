using System;
using System.Collections;

namespace Schlange
{
  class Program
  {
    static void Main(string[] args)
    {
      Queue simpleQueue = new Queue();

      for (int i = 0; i < 20; i++)
      {
        simpleQueue.Enqueue("Inhalt von Schlangenelement " + i.ToString());
      }

      Console.WriteLine("Anzahl der Elemente: {0}", simpleQueue.Count);
      Console.WriteLine(simpleQueue.Dequeue().ToString() + " entfernt");
      Console.WriteLine(simpleQueue.Dequeue().ToString() + " entfernt");
      Console.WriteLine("Anzahl der Elemente: {0}", simpleQueue.Count);

      foreach (string s in simpleQueue)
      {
        Console.WriteLine(s);
      }
    }
  }
}