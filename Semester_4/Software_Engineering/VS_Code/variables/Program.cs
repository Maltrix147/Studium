
namespace MySpace
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hier beginnt die Ausführung");
            Console.Write("Bitte a eingeben: ");
            int a; 
            a=int.Parse(Console.ReadLine());

            Console.Write("Bitte b eingeben: ");
            int b; 
            b=int.Parse(Console.ReadLine());
            int c=a+b; 

            Console.WriteLine ($"{a}+{b}={c}");
        }
    }
}    