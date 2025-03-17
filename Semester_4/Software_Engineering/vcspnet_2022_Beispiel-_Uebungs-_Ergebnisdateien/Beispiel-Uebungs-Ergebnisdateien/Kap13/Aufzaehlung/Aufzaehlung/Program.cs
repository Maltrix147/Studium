using System;

namespace Aufzaehlung
{
  enum Farben
  {
    Rot,

    Gelb,

    Grün,

    Blau
  }

  class Program
  {
    static void Main(string[] args)
    {
      foreach (string s in Enum.GetNames(typeof(Farben)))
      {
        Console.WriteLine(s);
      }
    }
  }
}