using System;
using System.Collections;

namespace Hash
{
  class Program
  {
    static void Main(string[] args)
    {
      Hashtable ht = new Hashtable();

      ht.Add("Schlüssel_1", "Wert1");
      ht.Add("Schlüssel_2", "Wert2");
      ht.Add("Schlüssel_3", "Wert3");

      Console.WriteLine("Schlüssel_1".GetHashCode());
      Console.WriteLine("Schlüssel_2".GetHashCode());
      Console.WriteLine("Schlüssel_3".GetHashCode());
      Console.WriteLine("Einträge: {0}", ht.Count);
      Console.WriteLine(ht["Schlüssel_2"]);
    }
  }
}