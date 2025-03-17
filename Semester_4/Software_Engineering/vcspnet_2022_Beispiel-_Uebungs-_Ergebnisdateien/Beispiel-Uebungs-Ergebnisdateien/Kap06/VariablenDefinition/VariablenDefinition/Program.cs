using System;

namespace VariablenDefinition
{
  class Program
  {
    static void Main(string[] args)
    {
      // --richtige Definition -------
      int zahl;
      double anzahl, preis, gewicht;
      char zeichen;

      // --falsche Definition --------
      // int &menge;                   // Name beginnt nicht mit _ oder a..Z 
      // double Menge der Waren;       // Name enthält Leerzeichen
    }
  }
}