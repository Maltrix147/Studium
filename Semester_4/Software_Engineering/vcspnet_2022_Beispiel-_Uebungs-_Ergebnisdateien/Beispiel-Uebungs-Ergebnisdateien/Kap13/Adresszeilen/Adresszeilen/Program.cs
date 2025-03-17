using System;

namespace Adresszeilen
{
  class Program
  {
    static void Main(string[] args)
    {
      string txt = "Name,Vorname,1234 Ort,Straße 5,1234/56789";
      string[] adr = txt.Split(new char[] { ',', ' ', '/' });

      foreach (string zeile in adr)
      {
        Console.WriteLine(zeile);
      }
    }
  }
}