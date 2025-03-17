using System;

namespace Monate
{
  class Program
  {
    static void Main(string[] args)
    {
      string name = "";

      Console.Write("Geben Sie einen Monatsnamen ein: ");
      name = Console.ReadLine();

      switch (name)
      {
        case "Januar":
        case "Februar":
        case "März": Console.WriteLine("1. Quartal");
          break;
        case "April":
        case "Mai":
        case "Juni": Console.WriteLine("2. Quartal");
          break;
        case "Juli":
        case "August":
        case "September": Console.WriteLine("3. Quartal");
          break;
        case "Oktober":
        case "November":
        case "Dezember": Console.WriteLine("4. Quartal");
          break;
        default:
          Console.WriteLine("ungültiger Monatsname");
          break;
      }
    }
  }
}