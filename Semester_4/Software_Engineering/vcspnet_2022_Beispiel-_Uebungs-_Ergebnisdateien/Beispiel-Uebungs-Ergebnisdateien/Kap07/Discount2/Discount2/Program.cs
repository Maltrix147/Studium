using System;

namespace Discount2
{
  class Program
  {
    static void Main(string[] args)
    {
      double invoiceAmount = 0.0;	        // Rechnungsbetrag
      const double DISCOUNTRATE = 0.04; 	// Rabatt 4%, als Konstante
      double discountAmount = 0.0;    	    // Rabattbetrag
      string txt;

      Console.Write("Bitte geben Sie den Rechnungsbetrag ein: ");
      txt = Console.ReadLine();
      invoiceAmount = Convert.ToDouble(txt);

      if (invoiceAmount > 1000)
      {
        discountAmount = invoiceAmount * DISCOUNTRATE;
        invoiceAmount -= discountAmount;

        Console.WriteLine("Sie erhalten einen Rabatt von: " + discountAmount);
      }
      else
      {
        Console.WriteLine("Bei Werten über 1000 erhalten Sie Rabatt!");
      }

      Console.WriteLine("Gesamtbetrag: " + invoiceAmount);
    }
  }
}