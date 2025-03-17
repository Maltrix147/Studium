using System;

namespace OverloadMember
{
  class Klasse1
  {
    internal int Plus(int i, int j)
    {
      return i + j;
    }
  }

  class Klasse2 : Klasse1
  {
    internal int Plus(char s, char t)
    {
      return Convert.ToByte(s) + Convert.ToByte(t);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Klasse2 einObjekt = new Klasse2();
 
      Console.WriteLine(einObjekt.Plus(40, 60));
      Console.WriteLine(einObjekt.Plus('a', 'c'));
    }
  }
}