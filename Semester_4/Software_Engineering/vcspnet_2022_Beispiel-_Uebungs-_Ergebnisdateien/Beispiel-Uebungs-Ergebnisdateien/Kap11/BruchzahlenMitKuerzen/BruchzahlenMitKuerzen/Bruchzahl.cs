using System;

namespace BruchzahlenMitKuerzen
{
  class Bruchzahl
  {
    // ä, ö, ü nicht in Programmier-Elementen nutzen...
    private int zaehler;

    public int Zaehler
    {
      get { return zaehler; }
      set { zaehler = value; }
    }

    private int nenner;

    public int Nenner
    {
      get { return nenner; }
      set { nenner = value; }
    }

    private int GGTeiler(int z1, int z2)
    {
      if (z2 == 0)
      {
        return z1;
      }
      else
      {
        return GGTeiler(z2, z1 % z2);
      }
    }

    public void kuerzen()
    {
      int GGT;              //GGT: Größter gemeinsamer Teiler

      GGT = GGTeiler(Zaehler, Nenner);
      Zaehler /= GGT;
      Nenner /= GGT;
    }

    public Bruchzahl(int zaehler, int nenner)
    {
      this.Zaehler = zaehler;
      this.Nenner = nenner;
    }

    public Bruchzahl() : this(1, 1)
    {
    }

    public static Bruchzahl operator +(Bruchzahl bruch1, Bruchzahl bruch2)
    {
      Bruchzahl ergebnis = new Bruchzahl();

      ergebnis.Zaehler = bruch1.Zaehler * bruch2.Nenner + bruch2.Zaehler * bruch1.Nenner;
      ergebnis.Nenner = bruch1.Nenner * bruch2.Nenner;
      ergebnis.kuerzen();

      return ergebnis;
    }

    public static Bruchzahl operator *(Bruchzahl bruch1, Bruchzahl bruch2)
    {
      Bruchzahl ergebnis = new Bruchzahl();

      ergebnis.Zaehler = bruch1.Zaehler * bruch2.Zaehler;
      ergebnis.Nenner = bruch1.Nenner * bruch2.Nenner;
      ergebnis.kuerzen();

      return ergebnis;
    }

    public override string ToString()
    {
      return this.Zaehler.ToString() + "/" + this.Nenner.ToString();
    }
  }
}
