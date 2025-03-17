using System;

namespace Media
{
  class Program
  {
    static void Main(string[] args)
    {
      IMedia medium1, medium2, medium3;

      medium1 = new Picture();
      Console.WriteLine("Medium1:");
      Console.WriteLine(medium1.DisplayMedia());
      Console.WriteLine(medium1.PlayMedia());
      Console.WriteLine(medium1.StopMedia());

      medium2 = new Video();
      Console.WriteLine("Medium2:");
      Console.WriteLine(medium2.DisplayMedia());
      Console.WriteLine(medium2.PlayMedia());
      Console.WriteLine(medium2.StopMedia());

      medium3 = new Audio();
      Console.WriteLine("Medium3:");
      Console.WriteLine(medium3.DisplayMedia());
      Console.WriteLine(medium3.PlayMedia());
      Console.WriteLine(medium3.StopMedia());
    }
  }
}