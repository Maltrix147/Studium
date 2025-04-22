using System.Reflection.Metadata.Ecma335;

namespace For
{
    class Program
  {
    static void Main(string[] args)
    {
        int a=7;
        int b=11;

        swap(a, b);
        Console.WriteLine($"a={a}, b={b}");
    }
    static void swap(int a, int b)
    {
        int temp = a;
        a = b;
        b = temp;
        Console.WriteLine($"a={a}, b={b}");
    }
  }
}