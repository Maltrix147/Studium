using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoSimulation
{
    internal class Auto : Button
    {
        private int speed;
        public int Geschwindigkeit
        {
            get { return speed; }
            set
            {
                if (value > 100)
                    value = 100;
                if (value < 0)
                    value = 0;

                this.speed = value;
            }
        }

        public void Fahren(Panel weg)
        {
            while ((this.Left < weg.Width - this.Width) && (this.speed > 0))
            {
                this.Left++;
                Application.DoEvents();
                System.Threading.Thread.Sleep(100 - this.speed);
            }
        }
    }
}
