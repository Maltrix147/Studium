using System;

namespace Teiler
{
  class Zahlen
  {
    public int GGTeiler(int z1, int z2)
    {
      Console.WriteLine("GGTeiler({0}, {1})", z1, z2);

      if (z2 == 0)
        return z1;
      else
        return GGTeiler(z2, z1 % z2);
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      int zahl1, zahl2;
      Zahlen zahlenObjekt = new Zahlen();

      Console.Write("Bitte eine ganze Zahl eingeben: ");
      zahl1 = Convert.ToInt32(Console.ReadLine());

      Console.Write("Bitte noch eine ganze Zahl eingeben: ");
      zahl2 = Convert.ToInt32(System.Console.ReadLine());

      if ((zahl1 != 0) && (zahl2 != 0))
        Console.Write(zahlenObjekt.GGTeiler(zahl1, zahl2));

      Console.WriteLine(" ist der größte gemeinsame Teiler.");
    }
  }
}