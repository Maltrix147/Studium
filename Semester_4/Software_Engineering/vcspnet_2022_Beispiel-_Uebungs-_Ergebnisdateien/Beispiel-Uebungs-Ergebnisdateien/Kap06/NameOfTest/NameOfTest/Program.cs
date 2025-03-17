using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NameOfTest
{
    class Program
    {
        public int a = 42;

        static readonly String b = "Die Antwort ist";
        
        DateTime c = new DateTime();

      
        static void Main(string[] args)
        {
            bool d;
            Console.WriteLine(nameof(a));
            Console.WriteLine(nameof(b));
            Console.WriteLine(nameof(c));
            Console.WriteLine(nameof(d));
        }
    }
}
