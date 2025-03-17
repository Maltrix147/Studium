using System;

namespace Personen2
{
  interface IZugriff
  {
    string Zugriff { get; set; }

    void Ausgabe();
  }

  class Person : IZugriff
  {
    protected string name;

    string IZugriff.Zugriff
    {
      get
      {
        return name;
      }
      set
      {
        name = value;
      }
    }

    public void Ausgabe()
    {
      Console.WriteLine(this.name);
    }
  }

  class Test : Person, IZugriff
  {
    string IZugriff.Zugriff
    {
      get
      {
        return name;
      }
      set
      {
        name = value.ToUpper();
      }
    }

    new public void Ausgabe()
    {
      Console.WriteLine("Test: " + this.name);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      IZugriff einePerson = new Person();

      einePerson.Zugriff = "Hans Mustermann";
      einePerson.Ausgabe();
      
      einePerson = new Test();
      einePerson.Zugriff = "Willi Muster";
      einePerson.Ausgabe();
    }
  }
}
