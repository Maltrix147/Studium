using System.ComponentModel;

namespace Stepcounter
{
    internal class StepCounter
    {
        private string datum;
        private int steps = 0;
        public StepCounter(string datum) 
        {
            this.datum = datum;
        }

        public void incrementSteps()
        {
            steps++;
        }

        public override string ToString()
        {
            string s = $"Am {this.datum} bin ich {steps} Schritte gelaufen.";
            return s;
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            StepCounter counter1 = new StepCounter("26.05.2025");
            StepCounter counter2 = new StepCounter("25.05.2025");
            for (int i = 0; i < 10; i++)
                counter1.incrementSteps();
            Console.WriteLine(counter1);
            Console.WriteLine(counter2);
        }
    }
}
