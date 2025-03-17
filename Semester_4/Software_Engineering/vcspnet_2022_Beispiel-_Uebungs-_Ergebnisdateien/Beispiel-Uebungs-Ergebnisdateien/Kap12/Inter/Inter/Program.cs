using System;

namespace Inter
{
  interface ITest
  {
    void Ausgabe();
  }

  class Test : ITest
  {
    void ITest.Ausgabe()
    {
      Console.WriteLine("Die Methode \"Ausgabe()\" wurde aufgerufen.");
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      ITest instanz1, instanz2;
      Test instanz3 = new Test();

      instanz1 = instanz3;
      if (instanz1 is ITest)
        Console.WriteLine("Mit der Schnittstelle ITest kompatible Instanz");

      instanz2 = instanz3 as ITest;
      if (instanz2 != null)
        instanz2.Ausgabe();
      ((ITest)instanz3).Ausgabe();
    }
  }
}