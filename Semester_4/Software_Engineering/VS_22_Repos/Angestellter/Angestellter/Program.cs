namespace Angestellter
{
    internal class Program
    {
        class Angestellter
        {
            private string name;
            private string beruf;
            private int gehalt;
            private int geleisteteStunden = 0;
            public Angestellter(string name, string beruf, int gehalt) 
            {
                this.name = name;
                this.beruf = beruf;
                this.gehalt = gehalt;
                this.geleisteteStunden = geleisteteStunden = 0;
            }

            public int arbeiten(int anz_hours)
            {
                this.geleisteteStunden = geleisteteStunden + anz_hours;
                return this.geleisteteStunden;
            }
            public int gehaltsinfo()
            {
                return this.gehalt;
            }
            public void gehaltserhöhung_geben(int gehalt)
            {
                this.gehalt += gehalt;
            }
            public string berufinfo()
            {
                return this.beruf;
            }
        }
        static void Main(string[] args)
        {
            Angestellter angestellter = new Angestellter("Julien", "Ingeniuer", 4000);
            int stunden = angestellter.arbeiten(8);
            int gehalt = angestellter.gehaltsinfo();
            angestellter.gehaltserhöhung_geben(600);
            string beruf = angestellter.berufinfo();

            Console.WriteLine($"Der Angestellte hat {stunden} gearbeitet.");
            Console.WriteLine($"Der Angestellte hat ein Gehalt von {gehalt}.");
            Console.WriteLine($"Der Angestellte arbeitet als {beruf} gearbeitet.");
        }
    }
}
