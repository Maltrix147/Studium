using System.Reflection.Metadata.Ecma335;

namespace For
{
  class Program
  {
    static void Main(string[] args)
    {
        Console.Write("Bitte Text eingeben");
        string s = Console.ReadLine();
        string[] words= GetWords(s);

        foreach (string word in words)
        {
            Console.WriteLine(word);
        }

    } 
    static string[] GetWords(string words)
    {
        string[] s = words.Split(' ');
        return s;
    }

  }
}