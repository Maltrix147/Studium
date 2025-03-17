using System;
using System.Runtime.CompilerServices;

namespace Aufruferinformationen
{
  class Program
  {
    static void Main(string[] args)
    {
      ProtokollFunktion(1000);
    }

    private static void ProtokollFunktion(int zahl, 
                                          [CallerMemberName] string methodenName = "",
                                          [CallerFilePath] string quellPfad = "",
                                          [CallerLineNumber] int zeilenNummer = 0)
    {
      Console.WriteLine("Zahl: " + zahl);
      Console.WriteLine("Methode: " + methodenName);
      Console.WriteLine("C#-Datei: " + quellPfad);
      Console.WriteLine("Zeilennummer: " + zeilenNummer);
    }
  }
}
