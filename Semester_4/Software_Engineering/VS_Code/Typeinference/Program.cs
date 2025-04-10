namespace Typeinference
{
  class Program
  {
    static void Main(string[] args)
    {
      int myInt = 5;
      var myFloat = 5.5f;
      var mydouble = 5.6;
      var myInt2 = 2;
      Console.WriteLine(myInt.GetType());
      Console.WriteLine(myFloat.GetType());
      Console.WriteLine(mydouble.GetType());
      Console.WriteLine(myInt2.GetType());
    }
  }
}