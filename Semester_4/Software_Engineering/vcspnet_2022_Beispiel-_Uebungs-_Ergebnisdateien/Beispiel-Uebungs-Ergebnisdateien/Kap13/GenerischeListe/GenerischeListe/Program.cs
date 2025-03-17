using System;
using System.Collections;
using System.Collections.Generic;
namespace GenerischeListe
{
    class Program
    {
        static void Main(string[] args)
        {
            // int als Typ des Arguments
            List<int> list = new List<int>();

            for (int x = 0; x < 10; x++)
            {
                list.Add(x);
            }

            foreach (int i in list)
            {
                System.Console.Write(i + " ");
            }
            System.Console.WriteLine("\nFertig");
        }
    }
}

