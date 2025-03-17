using System;

namespace IntegerCalcExcept
{
  class Rechner
  {
    private int value1;
    public int Zahl1
    {
      get { return this.value1; }
      set { this.value1 = value; }
    }

    private int value2;
    public int Zahl2
    {
      get { return this.value2; }
      set { this.value2 = value; }
    }

    public int Plus()
    {
      return Zahl1 + Zahl2;
    }

    public int Minus()
    {
      return Zahl1 - Zahl2;
    }

    public int Mult()
    {
      return Zahl1 * Zahl2;
    }

    public int Div()
    {
      return Zahl1 / Zahl2;
    }

    public int Modulo()
    {
      return Zahl1 % Zahl2;
    }
  }
}