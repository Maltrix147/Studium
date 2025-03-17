using System;
using System.Collections.Generic;
using System.Text;

namespace Personen
{
  interface IZugriff
  {
    string Zugriff { get; set; }

    void Ausgabe();
  }

  class Person : IZugriff
  {
    private string name;

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

  class Test : Person
  {
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
      
      Person nochEinePerson = new Person();
      // nochEinePerson.Zugriff="Klaus Meier";  nicht zulässig, da explizit implementiert!!
      ((IZugriff)nochEinePerson).Zugriff = "Klaus Meier";
      nochEinePerson.Ausgabe();           //    zulässig!!
    }
  }
}