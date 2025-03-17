using System;
using System.Collections.Generic;
using System.Text;

namespace Konvert
{
  class Klasse1
  {
    public void Test()
    {
      Console.WriteLine("Die Methode \"Test\" von Klasse1 wurde ausgeführt.");
    }
  }

  class Klasse2 : Klasse1
  {
    new public void Test()
    {
      Console.WriteLine("Die Methode \"Test\" von Klasse2 wurde ausgeführt.");
    }
  }

  class Klasse3
  {
    public void Test()
    {
      Console.WriteLine("Die Methode \"Test\" von Klasse3 wurde ausgeführt.");
    }
  }

  class Program
  {
    static void pruefen(object sender)
    {
      if (sender is Klasse1)
      {
        Console.WriteLine("Das ist eine Instanz der Klasse1 \"Klasse1\"" +
            "oder einer davon abgeleiteten Klasse");
      }
      else
      {
        Console.WriteLine("Das ist keine Instanz der Klasse1 \"Klasse1\"" +
            "oder einer davon abgeleiteten Klasse");
      }
    }

    static void Main(string[] args)
    {
      Klasse1 instanz1 = new Klasse1();
      Klasse2 instanz2 = new Klasse2();
      Klasse3 instanz3 = new Klasse3();

      instanz1.Test();
      pruefen(instanz1);
      
      instanz2.Test();
      pruefen(instanz2);
      
      instanz3.Test();
      pruefen(instanz3);
      (instanz2 as Klasse1).Test();
    }
  }
}