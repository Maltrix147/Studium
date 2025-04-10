namespace Arrays
{
  class Program
  {
    static void Main(string[] args)
    {
        int i = 0;
        int[] integers= new int[10];

        while (i < 10)
        {
            integers[i]= i*i;
            i++;
        }
        i = 0;
        while (i < 10)
        {
            Console.WriteLine(integers[i]);
            i++;
        }
    }
  }
}