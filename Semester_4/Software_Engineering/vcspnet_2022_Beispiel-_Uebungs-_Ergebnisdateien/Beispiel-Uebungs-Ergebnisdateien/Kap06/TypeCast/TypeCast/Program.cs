using System;

namespace TypeCast
{
  class Program
  {
    static void Main(string[] args)
    {
      int number = 4567;
      double size = 123.12;
      char ch = 'K';
      string txt;

      number = (int)size;
      size = 149;
      txt = ch.ToString();
      txt = number.ToString();

      number = Convert.ToInt32("4567");
      size = Double.Parse("4567,89");
      size = Convert.ToDouble("4567,89");
      ch = Convert.ToChar("k");
    }
  }
}