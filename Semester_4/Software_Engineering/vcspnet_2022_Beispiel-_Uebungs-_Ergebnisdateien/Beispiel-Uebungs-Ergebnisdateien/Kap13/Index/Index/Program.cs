using System;

namespace Index
{
  class Zeichenketten
  {
    private string[] meldungen = new string[5];

    public string this[int index]
    {
      get
      {
        if ((index >= meldungen.GetLowerBound(0)) && (index <= meldungen.GetUpperBound(0)))
        {
          return meldungen[index];
        }
        else
        {
          Console.WriteLine("ungültiger Index!");
         
          return null;
        }
      }
      set
      {
        if ((index >= meldungen.GetLowerBound(0)) && (index <= meldungen.GetUpperBound(0)))
        {
          meldungen[index] = value;
        }
        else
        {
          Console.WriteLine("ungültiger Index!"); 
        }
      }
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Zeichenketten textZeilen = new Zeichenketten();

      textZeilen[1] = "Hallo";
      textZeilen[3] = "Welt";

      for (int i = 0; i < 5; i++)
      {
        Console.WriteLine("textZeilen[{0}]: {1}", i, textZeilen[i]);
      }
    }
  }
}