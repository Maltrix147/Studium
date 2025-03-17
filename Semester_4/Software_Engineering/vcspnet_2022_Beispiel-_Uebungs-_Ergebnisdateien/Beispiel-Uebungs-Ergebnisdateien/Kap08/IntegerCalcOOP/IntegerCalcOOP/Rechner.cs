using System;

namespace IntegerCalcOOP
{
  class Rechner
  {
    public int Value1;
    public int Value2;

    public int Plus()
    {
      return Value1 + Value2;
    }

    public int Minus()
    {
      return Value1 - Value2;
    }

    public int Mult()
    {
      return Value1 * Value2;
    }

    public int Div()
    {
      return Value1 / Value2;
    }

    public int Modulo()
    {
      return Value1 % Value2;
    }
  }
}
