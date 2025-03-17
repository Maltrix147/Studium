using System;

namespace SwapText
{
  class Txt
  {
    public void Swap(ref string s1, ref string s2)
    {
      string temp = s1;

      s1 = s2;
      s2 = temp;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      Txt txtObjekt = new Txt();

      string Text1, Text2;

      Console.WriteLine("Bitte geben Sie die Zeichenkette für 'Text1' ein: ");
      Text1 = Console.ReadLine();

      Console.WriteLine("Bitte geben Sie die Zeichenkette für 'Text2' ein: ");
      Text2 = Console.ReadLine();

      txtObjekt.Swap(ref Text1, ref Text2);

      Console.WriteLine("'Text1' nach dem Tausch: " + Text1);
      Console.WriteLine("'Text2' nach dem Tausch: " + Text2);
    }
  }
}