using System;

namespace AutoInit
{
  class Program
  {
    static void Main(string[] args)
    {
      Auto bmw = new Auto { Marke = "BMW" };
      Auto audi = new Auto("Audi");

      Console.WriteLine(bmw.Marke);
      Console.WriteLine(audi.Marke);
    }
  }

  public class Auto
  {
    private string marke;
    public string Marke
    {
      get { return marke; }
      set { marke = value; }
    }

    public Auto()
    { }

    public Auto(string marke)
    {
      this.marke = marke;
    }
  }
}