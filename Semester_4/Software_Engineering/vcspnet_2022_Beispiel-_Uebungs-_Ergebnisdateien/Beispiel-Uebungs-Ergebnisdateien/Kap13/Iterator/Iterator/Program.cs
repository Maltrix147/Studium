using System;
using System.Collections;

namespace Iterator
{
  public class MonthNames : IEnumerable
  {
    private string[] months = {"Jan", "Feb", "Mar", "Apr", "Mai", "Jun", 
                               "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"};

    IEnumerator IEnumerable.GetEnumerator()
    {
      for (int i = 0; i < months.Length; i += 3)
      {
        yield return months[i];
      }
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      MonthNames quartalsAnfang = new MonthNames();

      foreach (string month in quartalsAnfang)
      {
        Console.WriteLine(month);
      }
    }
  }
}
