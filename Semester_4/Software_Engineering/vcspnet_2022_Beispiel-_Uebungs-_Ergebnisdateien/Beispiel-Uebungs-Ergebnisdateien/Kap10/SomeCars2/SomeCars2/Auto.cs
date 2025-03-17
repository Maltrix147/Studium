using System;

namespace SomeCars2
{
  public class Auto
  {
    private string fahrzeugFarbe;
    public string Farbe
    {
      get { return fahrzeugFarbe; }
      set { fahrzeugFarbe = value; }
    }

    private int fahrzeugBaujahr;
    public int Baujahr
    {
      get { return fahrzeugBaujahr; }
      set { fahrzeugBaujahr = value; }
    }

    public Auto(string farbe, int baujahr)
    {
      this.Farbe = farbe;
      this.Baujahr = baujahr;
    }
  }
}
