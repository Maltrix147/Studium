using System;

namespace ArrayIndexRange
{
  class Program
  {
    static void Main(string[] args)
    {
      string[] einArray = new String[10];

      try
      {
        einArray[10] = "Test";
      }
      catch (Exception e)
      {
        Console.WriteLine(e.GetType());
        Console.WriteLine(e.Message);
      }

      Console.WriteLine("Trotz Ausnahme läuft das Programm weiter.");
      Console.ReadLine();
    }
  }
}