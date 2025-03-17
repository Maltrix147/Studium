using System;
using System.IO;

namespace Textdateien
{
  class Program
  {
    static void Main(string[] args)
    {
      string dateiname = @"c:\temp\test1.txt";

      StreamWriter sw;
      sw = new StreamWriter(dateiname, false);

      for (int i = 1; i < 10; i++)
      {
        sw.WriteLine("Dies ist die {0}. Zeile.", i.ToString());
      }

      sw.Flush();
      sw.Close();

      StreamReader sr;
      sr = new StreamReader(dateiname);
      string txt = sr.ReadToEnd();
      Console.WriteLine(txt);

      //Alternative:
      txt = File.ReadAllText(dateiname);
      Console.WriteLine(txt);
    }
  }
}