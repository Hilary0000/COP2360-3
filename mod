using System;
using System.Collections.Generic;

namespace ContractorManagement
{
    // Base class
    public class Contractor
    {
        public string ContractorName { get; set; }
        public int ContractorNumber { get; set; }

        public DateTime StartDate { get; set; }

        public Contractor()
        {
        }

        public Contractor(string name, int number, DateTime startDate)
        {
            ContractorName = name;
            ContractorNumber = number;
            StartDate = startDate;
        }

        public override string ToString()
        {
            return $"Name: {ContractorName}\n" +
                   $"Contractor Number: {ContractorNumber}\n" +
                   $"Start Date: {StartDate:d}";
        }
    }

    // Derived class
    public class Subcontractor: Contractor
    {
        public int Shift { get; set; }          // 1 = Day, 2 = Night
        public double HourlyPayRate { get; set; }

        public Subcontractor()
        {
        }

        public Subcontractor(string name, int number, DateTime startDate,
                             int shift, double hourlyPayRate)
            : base(name, number, startDate)
        {
            Shift = shift;
            HourlyPayRate = hourlyPayRate;
        }

        public float CalculatePay(float hoursWorked)
        {
            double payRate = HourlyPayRate;

            if (Shift == 2)
            {
                payRate *= 1.03; // 3% night shift differential
            }

            return (float)(hoursWorked * payRate);
        }

        public string GetShiftName()
        {
            return Shift == 1 ? "Day": "Night";
        }

        public override string ToString()
        {
            return base.ToString() + "\n" +
                   $"Shift: {GetShiftName()}\n" +
                   $"Hourly Pay Rate: {HourlyPayRate:C}";
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<Subcontractor> subcontractors = new List<Subcontractor>();
            string continueChoice;

            do
            {
                Console.WriteLine("Enter subcontractor information:");

                Console.Write("Please enter subcontractor's name: ");
                string name = Console.ReadLine();

                Console.Write("Please enter subcontractor's number: ");
                int number = int.Parse(Console.ReadLine());

                Console.Write("Please enter subcontractor's Start Date (MM/DD/YYYY): ");
                DateTime startDate = DateTime.Parse(Console.ReadLine());

                Console.Write("Choose subcontractor's shift (1 = Day shift, 2 = Night shift): ");
                int shift = int.Parse(Console.ReadLine());

                Console.Write("Please enter subcontractor's Hourly Pay Rate: ");
                double hourlyRate = double.Parse(Console.ReadLine());

                Console.Write("Please enter subcontractor's Hours Worked: ");
                float hoursWorked = float.Parse(Console.ReadLine());

                Subcontractor subcontractor = new Subcontractor(
                    name, number, startDate, shift, hourlyRate);

                subcontractors.Add(subcontractor);

                Console.WriteLine("\nSubcontractor Details:");
                Console.WriteLine(subcontractor);
                Console.WriteLine($"Gross Pay: {subcontractor.CalculatePay(hoursWorked):C}");

                Console.Write("\nWould you like to enter another subcontractor? (Y/N): ");
                continueChoice = Console.ReadLine().ToUpper();
                Console.WriteLine();

            } while (continueChoice == "Y");

            Console.WriteLine("Subcontractors Summary List:");
            Console.WriteLine(new string('-', 40));

            foreach (Subcontractor subcontractor in subcontractors)
            {
                Console.WriteLine(subcontractor);
                Console.WriteLine(new string('-', 40));
            }

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
