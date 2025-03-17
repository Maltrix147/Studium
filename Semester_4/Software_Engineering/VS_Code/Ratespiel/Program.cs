
namespace MySpace
{
    class Program
    {
        static void Main(string[] args)
        {
           Random zufall = new Random();
           int zufallszahl = zufall.Next(1, 1000); 
           Console.WriteLine($"Zufallszahl: {zufallszahl}");

           int eingabe = 0;

           while(zufallszahl != eingabe)
           {
            Console.Write("Bitte geben Sie eine Zahl zwischen 1 und 1000 ein: ");
            eingabe = int.Parse(Console.ReadLine());

            if(eingabe < zufallszahl)
            Console.WriteLine("zu klein");
            
            if(eingabe > zufallszahl)
            Console.WriteLine("zu groß");
           }
           Console.WriteLine("Richtig geraten!");
        }
    }
}    