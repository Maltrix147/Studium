using System;

namespace Discount
{
  class Program
  {
    static void Main(string[] args)
    {
      double invoiceAmount = 0.0; // Rechnungsbetrag
      string txt;

      Console.Write("Bitte geben Sie den Rechnungsbetrag ein: ");
      txt = Console.ReadLine();
      invoiceAmount = Convert.ToDouble(txt);

      if (invoiceAmount > 1000)
      {
        invoiceAmount -= invoiceAmount * 0.04;
        Console.WriteLine("Es wird ein Rabatt gewährt.");
      }

      Console.WriteLine("Gesamtbetrag: " + invoiceAmount);

    }
  }
}