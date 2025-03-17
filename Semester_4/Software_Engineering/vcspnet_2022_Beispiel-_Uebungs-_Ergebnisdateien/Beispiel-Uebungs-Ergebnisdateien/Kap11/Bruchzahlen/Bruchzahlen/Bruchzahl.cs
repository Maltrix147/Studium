using System;

namespace Bruchzahlen
{
  class Bruchzahl
  {
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

      return ergebnis;
    }

    public static Bruchzahl operator *(Bruchzahl bruch1, Bruchzahl bruch2)
    {
      Bruchzahl ergebnis = new Bruchzahl();

      ergebnis.Zaehler = bruch1.Zaehler * bruch2.Zaehler;
      ergebnis.Nenner = bruch1.Nenner * bruch2.Nenner;

      return ergebnis;
    }

    public override string ToString()
    {
      return this.Zaehler.ToString() + "/" + this.Nenner.ToString();
    }
  }
}
