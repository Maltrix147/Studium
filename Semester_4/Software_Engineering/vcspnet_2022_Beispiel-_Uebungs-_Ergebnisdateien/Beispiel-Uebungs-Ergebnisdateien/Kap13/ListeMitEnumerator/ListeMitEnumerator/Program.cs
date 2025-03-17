using System;
using System.Collections;

namespace ListeMitEnumerator
{
  class Program
  {
    static void Main(string[] args)
    {
      ArrayList oneArrayList = new ArrayList();

      for (int i = 0; i < 10; i++)
      {
        oneArrayList.Add("test " + i.ToString());
      }

      System.Collections.IEnumerator e = oneArrayList.GetEnumerator();

      while (e.MoveNext())
      {
        Console.WriteLine(e.Current.ToString());
      }
    }
  }
}