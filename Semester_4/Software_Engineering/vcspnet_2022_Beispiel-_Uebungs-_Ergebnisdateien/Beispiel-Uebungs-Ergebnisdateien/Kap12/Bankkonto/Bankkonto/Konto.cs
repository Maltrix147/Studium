using System;

namespace Bankkonto
{
  class Konto : IKonto
  {
    private double stand;

    double IKonto.Kontostand
    {
      get
      {
        return stand;
      }
      set
      {
        stand = value;
      }
    }

    public Konto(double kontostand)
    {
      (this as IKonto).Kontostand = kontostand;
      // oder
      // stand = kontostand;
    }
  }
}
