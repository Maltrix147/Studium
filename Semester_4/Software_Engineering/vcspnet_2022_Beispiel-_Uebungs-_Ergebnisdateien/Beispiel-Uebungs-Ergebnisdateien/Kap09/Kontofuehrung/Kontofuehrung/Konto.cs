using System;

namespace Kontofuehrung
{
  class Konto
  {
    private double kontostand;
    public double Kontostand
    {
      get { return this.kontostand; }
      set { this.kontostand = value; }
    }

    public Konto(double stand)
    {
      this.kontostand = stand;
    }
  }
}