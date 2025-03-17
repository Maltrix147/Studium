using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AufrufKonflikt
{
    class Program
    {
        static void Main(string[] args)
        {
            new Class1().Test();    // Methode ohne Parameter wird aufgerufen. 
                                    // Die anderen beiden theoretisch passenden Methoden sind nicht auswählbar.
            new Class1().Test(1);   // Methode mit optionalem Parameter wird aufgerufen. 
                                    // Die theoretisch passende Methode mit Parameter-Array ist nicht auswählbar.

        }
    }
}
