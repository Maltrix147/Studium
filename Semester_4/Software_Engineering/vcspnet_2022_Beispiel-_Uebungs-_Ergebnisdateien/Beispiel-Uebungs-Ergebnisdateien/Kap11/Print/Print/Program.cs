using System;

namespace Print
{
  class Klasse1
  {
    public virtual void Print()  // Die Methode wird als überschreibbar deklariert
    {
      Console.WriteLine("Ausgabe der Basisklasse");
    }
  }

  class Klasse2 : Klasse1
  {
    public override void Print() // Die Methode Print() wird überschrieben. 
    {
      base.Print();
      Console.WriteLine("Ausgabe der abgeleiteten klasse");
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Klasse2 obj = new Klasse2();
      obj.Print();
    }
  }
}