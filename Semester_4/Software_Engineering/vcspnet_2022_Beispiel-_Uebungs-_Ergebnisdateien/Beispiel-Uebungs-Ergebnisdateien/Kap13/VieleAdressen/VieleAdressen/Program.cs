using System;
using System.Collections.Generic;
using System.Text;

namespace VieleAdressen
{
  struct Adresse
  {
    private int nummer, alter;
    private string name, strasse, plz, ort;
    public void Eingabe(int nummer, string name, string strasse, string plz, string ort, int alter)
    {
      this.nummer = nummer;
      this.name = name;
      this.strasse = strasse;
      this.plz = plz;
      this.ort = ort;
      this.alter = alter;
    }

    public void Ausgabe()
    {
      Console.WriteLine("Laufende Nummer: " + nummer);
      Console.WriteLine("Name: " + name);
      Console.WriteLine("Strasse: " + strasse);
      Console.WriteLine("PLZ: " + plz);
      Console.WriteLine("Ort: " + ort);
      Console.WriteLine("Alter: " + alter);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      const int anzahlAdr = 3;
      Adresse[] adressen = new Adresse[anzahlAdr];
      int neuesAlter;
      string neuerName, neueStrasse, neuePlz, neuerOrt;
      int nr = 0;

      while (nr < anzahlAdr)
      {
        nr += 1;
        Console.WriteLine("Datensatz {0}", nr);
        Console.WriteLine("Bitte geben Sie Ihren Namen ein:");
        neuerName = Console.ReadLine();
        Console.WriteLine("Bitte geben Sie Ihre Strasse ein:");
        neueStrasse = Console.ReadLine();
        Console.WriteLine("Bitte geben Sie Ihre Postleitzahl ein:");
        neuePlz = Console.ReadLine();
        Console.WriteLine("Bitte geben Sie Ihren Wohnort ein:");
        neuerOrt = Console.ReadLine();
        Console.WriteLine("Bitte geben Sie Ihr Alter ein:");
        neuesAlter = Convert.ToInt32(Console.ReadLine());
        adressen[nr - 1].Eingabe(nr, neuerName, neueStrasse, neuePlz, neuerOrt, neuesAlter);
      }

      foreach (Adresse adr in adressen)
      {
        adr.Ausgabe();
      }
    }
  }
}