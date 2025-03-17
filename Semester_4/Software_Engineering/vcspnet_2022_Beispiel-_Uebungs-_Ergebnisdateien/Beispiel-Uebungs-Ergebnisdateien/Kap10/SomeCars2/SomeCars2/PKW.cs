using System;

namespace SomeCars2
{
  public class PKW : Auto
  {
    private int sitze;
    public int Sitzplaetze
    {
      get { return sitze; }
      set { sitze = value; }
    }

    public PKW(string farbe, int baujahr, int sitzplaetze) : base(farbe, baujahr)
    {
      this.Sitzplaetze = sitzplaetze;
    }
  }
}
