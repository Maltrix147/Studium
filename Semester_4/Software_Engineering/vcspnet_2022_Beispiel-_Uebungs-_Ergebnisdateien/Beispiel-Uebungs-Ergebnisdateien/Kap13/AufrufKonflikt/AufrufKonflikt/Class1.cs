using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AufrufKonflikt
{
    class Class1
    {
        /// <summary>
        /// Ohne Parameter
        /// </summary>
        internal void Test()
        {
            Console.WriteLine("Methode 1");
        }
        /// <summary>
        /// Paramter-Array
        /// </summary>
        /// <param name="i"></param>
        internal void Test(params int[] i)  
        {
            Console.WriteLine("Methode 2");
        }
        /// <summary>
        /// Optionale Parameter
        /// </summary>
        /// <param name="i"></param>
        internal void Test(int i=0)
        {
            Console.WriteLine("Methode 3");
        }
    }
}
