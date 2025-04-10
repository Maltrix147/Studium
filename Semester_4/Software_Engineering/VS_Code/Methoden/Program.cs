namespace For
{
  class Program
  {
    static void Main(string[] args)
    {
        int[] myField= {1,2,3,4,5,6,7,8,9};
        int summe = GetArraySum(myField);
        Console.WriteLine(summe);

    }
    static int GetArraySum(int[]m)
    {
        int sum= 0;
        foreach (int i in m)
        {
            sum += i;
        }
        return sum;
    }
  }
}
