using System;

namespace Discount3
{
  class Program
  {
    static void Main(string[] args)
    {
      double invoiceAmount = 0.0;		// Rechnungsbetrag
      string txt;

      Console.Write("Bitte geben Sie den Rechnungsbetrag ein: ");
      txt = Console.ReadLine();
      invoiceAmount = Convert.ToDouble(txt);

      if (invoiceAmount > 1000)
      {
        invoiceAmount -= invoiceAmount * 0.04;
        Console.WriteLine("Sie erhalten 4 % Rabatt");
      }
      else
      {
        if (invoiceAmount > 500)
        {
          invoiceAmount -= invoiceAmount * 0.02;

          Console.WriteLine("Sie erhalten 2 % Rabatt");
        }
        else
          Console.WriteLine("Bei Werten über 500 erhalten Sie Rabatt!");
      }

      Console.WriteLine("Gesamtbetrag: " + invoiceAmount);
    }
  }
}