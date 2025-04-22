namespace Rekursion
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine($"Die Fakultät von 5 ist {fakultaetNR(5)}");
        }
        static int fakultaetNR(int n)
        {
            if (n < 0)
            {
                System.Console.WriteLine("Negative Zahlen sind nicht erlaubt!");
                return -1;
            }
            if (n == 0 || n == 1)
            {
                return 1;
            }
            return  n * fakultaetNR(n - 1);
        }
        /*static int fakultaetNR(int n)
        {
            if (n < 0)
            {
                Console.WriteLine("Negative Zahlen sind nicht erlaubt!");
                return -1;
            }
            if (n == 0 || n == 1)
            {
                return 1;
            }
            int fak = 1;
            for (int i = 1; i <= n; ++i)
            {
                fak *= i;
            }
            return fak;
        }*/
    
    }
}