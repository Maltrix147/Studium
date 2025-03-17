using System;

namespace ControlDoWhile
{
  class Program
  {
    static void Main(string[] args)
    {
      double presentValue = 1000.0;
      double futureValue = 10000.0;
      const double INTERESTRATE = 4.5;
      int year = 0;

      do
      {
        presentValue *= 1.0 + INTERESTRATE / 100;  // Startwert um Zinsen erhöhen
        year++;                                    // Jahr um 1 erhöhen
        // Alternative: year++;
      }
      while (presentValue < futureValue);
      //solange das gewünschte Kapital noch nicht erreicht ist

      Console.WriteLine("Laufzeit in Jahren: " + year);
    }
  }
}