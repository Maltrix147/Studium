using System;
using System.Collections;

namespace AuflistungsInit
{
  class Program
  {
    static void Main(string[] args)
    {
      ArrayList fahrzeugTypen = new ArrayList { "PKW", "Motorrad", "Fahrrad" };

      foreach (string fahrzeug in fahrzeugTypen)
        Console.WriteLine(fahrzeug);
    }
  }
}