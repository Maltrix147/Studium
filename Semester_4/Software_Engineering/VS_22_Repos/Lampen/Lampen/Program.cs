namespace Lampen
{
    class Lamp
    {
        public int watt;

        public Lamp(int watt)
        {
            this.watt = watt;
        }

        public int getWatt()
        {
            return this.watt;
        }

        public int annualPowerConsumption(int hoursperday)
        {
            int consumption = (this.watt * hoursperday * 365) / 1000;
            return consumption;
        }

    }
    class Bulb : Lamp
    {
        public Bulb(int watt) : base(watt)
        {
        }

        public override string ToString()
        {
                string ausgabe = $"A bulb consumes {annualPowerConsumption(10)}kWh per year";
                return ausgabe;
        }
    }

    class LEDBulb : Lamp
    {
        public LEDBulb(int watt) : base(watt) { }
        public override string ToString()
        {
            string ausgabe = $"A bulb consumes {annualPowerConsumption(10)}kWh per year";
            return ausgabe;
        }
    }


    internal class Program
    {
        static void Main(string[] args)
        {
            Bulb bulb = new Bulb(60);
            LEDBulb bulb2 = new LEDBulb(9);

            Console.WriteLine(bulb);
            Console.WriteLine(bulb2);
        }
    }
}
