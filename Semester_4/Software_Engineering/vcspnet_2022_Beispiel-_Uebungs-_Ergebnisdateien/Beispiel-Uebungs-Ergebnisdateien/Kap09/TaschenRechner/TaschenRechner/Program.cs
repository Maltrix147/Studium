using System;

namespace TaschenRechner
{
  class Program
  {
    static void Main(string[] args)
    {
      Rechner rech = new Rechner();
      Console.WriteLine(rech.Add(10, 11));
    }
  }

  public partial class Rechner
  {
    public int Add(int zahl1, int zahl2)
    {
      int summe = 0;
      InternalAdd(zahl1, zahl2, ref summe);

      return summe;
    }

    partial void InternalAdd(int zahl1, int zahl2, ref int summe);
  }

  public partial class Rechner
  {
    partial void InternalAdd(int zahl1, int zahl2, ref int summe)
    {
      summe = zahl1 + zahl2;
    }
  }
}