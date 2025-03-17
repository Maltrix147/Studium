using System;

namespace JoinStrings
{
  class Program
  {
    static void Main(string[] args)
    {
      string s1, s2;
 
      s1 = "Hal" + "lo";  //s1 erhält den Text "Hallo"
      Console.WriteLine(s1);
      
      s2 = 123 + " km";   //s2 erhält den Text "123 km"
      Console.WriteLine(s2);
    }
  }
}