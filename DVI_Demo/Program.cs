using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DVI_Access_Lib;

namespace DVI_Demo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DVI_Climate climate = new DVI_Climate("http://docker.data.techcollege.dk:5051");
            DVI_Stock stock = new DVI_Stock("http://docker.data.techcollege.dk:5051");

            Console.WriteLine("********** Lager data **********");
            Console.WriteLine("Temperatur: " + climate.CurrTemp());
            Console.WriteLine("Luftfugtighed : "+ climate.CurrHum());

            Console.WriteLine("Vine vi skal have bestilt flere af :");
            foreach (Wine wine in stock.StockOverThreshold())
                Console.WriteLine(wine.WineName);
            Console.ReadLine();
        }
    }
}
