namespace IBAN
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int Bankleitzahl = 1234567;
            int Kontonummer = 1234567890;
            int Konstante = 131400;
            decimal Ges = 12345671234567890131400M;

            Console.WriteLine(generateGermanIBAN(Ges, Bankleitzahl, Kontonummer));
        }

        
        static string generateIBANChecksum(decimal x)
        {
            x = x % 97;
            x = 98 - x;
            if (x < 10)
            {
                return "0" + x.ToString();
            }
            else
            {
                return x.ToString();
            }
        }
        static string generateGermanIBAN(decimal x, decimal y, decimal z)
        {
            string IBAN = $"DE{generateIBANChecksum(x)}{y}{z}";
            return IBAN;
        }
    }
}
