namespace Würfelspiel
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var rand = new Random();
            int zzahl = rand.Next(1,7);

            int runde = 0;
            int score1= 0;
            int score2= 0;

            while (true) 
            {
                runde ++;

                zzahl = rand.Next(1,7);
                int Wurf1 = zzahl;

                zzahl= rand.Next(1,7);
                int Wurf2 = zzahl;

                Console.WriteLine($"Spiel {runde} Spieler 1 {Wurf1} Spieler 2 {Wurf2});
                    


               
            break
        }
    }
}
