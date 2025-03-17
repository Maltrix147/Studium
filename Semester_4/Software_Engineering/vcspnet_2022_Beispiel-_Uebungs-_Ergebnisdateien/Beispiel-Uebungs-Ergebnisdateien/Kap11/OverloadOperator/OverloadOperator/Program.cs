using System;

namespace OverloadOperator
{
  class Zeichen
  {
    private char wert;

    public Zeichen(char c)
    {
      wert = c;
    }

    public static string operator +(Zeichen c1, Zeichen c2)
    {
      return "" + c1.wert + c2.wert;
    }

    public static string operator *(int anzahl, Zeichen c)
    {
      string s = "";
    
      for (int i = 0; i < anzahl; i++)
      {
        s += c.wert;
      }
      
      return s;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Zeichen einZeichen = new Zeichen('x');
      Zeichen nochEinZeichen = new Zeichen('o');
      
      Console.WriteLine(einZeichen + nochEinZeichen);
      Console.WriteLine(20 * einZeichen);
    }
  }
}