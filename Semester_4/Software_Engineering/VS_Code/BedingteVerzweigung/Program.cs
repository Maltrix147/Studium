namespace BedingteVerzweigung
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string passwd="1234";
            string user="Manfred";

            Console.WriteLine("Bitte Benutzername eingeben: ");
            string  user_input=Console.ReadLine();
            Console.WriteLine("Bitte Passwort eingeben: ");
            string  passwd_input=Console.ReadLine();

            if ((passwd_input == passwd) && (user_input == user))
            Console.WriteLine("Anmeldung erfolgreich");
            else
            Console.WriteLine("Anmeldung fehlgeschlagen");
        }
    }
}    