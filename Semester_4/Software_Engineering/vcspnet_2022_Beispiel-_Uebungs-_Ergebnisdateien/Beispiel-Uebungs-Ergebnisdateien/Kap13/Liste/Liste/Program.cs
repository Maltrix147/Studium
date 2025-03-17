using System;
using System.Collections;

namespace Liste
{
  class Program
  {
    static void Main(string[] args)
    {
      ArrayList oneList = new ArrayList();

      for (int i = 0; i < 20; i++)
      {
        oneList.Add("Inhalt von Listenelement " + i.ToString());
      }

      Console.WriteLine("Anzahl der Elemente: {0}", oneList.Count);
      Console.WriteLine("Kapazität der Liste: {0}", oneList.Capacity);

      oneList.RemoveAt(10);
      oneList.Remove("Inhalt von Listenelement 15");

      foreach (string s in oneList)
      {
        Console.WriteLine(s);
      }

      Console.WriteLine("Anzahl der Elemente: {0}", oneList.Count);
    }
  }
}