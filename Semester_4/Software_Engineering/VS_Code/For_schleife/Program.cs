namespace For
{
  class Program
  {
    static void Main(string[] args)
    {
        int[] integers= new int[10];

        for (int i = 0; i < integers.Length; i++)
        {
            integers[i]= i*i;
        }

        foreach (var x in integers)
        {
            Console.WriteLine(x);
        }
        /*
        for (int i = integers.Length -1; i >= 0; i--)
        {
            Console.WriteLine(integers[i]);
        }
        */
    }
  }
}
