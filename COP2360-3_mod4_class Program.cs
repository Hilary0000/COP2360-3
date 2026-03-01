class Program 
{
    static void Main(string[] args)
    {
        Console.WriteLine("Enter first number:");
        string input1 = Console.ReadLine();
        Console.WriteLine("Enter second number:");
        string input2 = Console.ReadLine();
        
        try
        {
            int number1 = Convert.ToInt32(input1);
            int number2 = Convert.ToInt32(input2);

            int result = Divide(number1, number2);
            Console.WriteLine($"The result of dividing {number1} and {number2} is: {result}");
        }       
        catch (FormatException)
        {
            Console.WriteLine("Error: Please enter valid integers.");
            Console.WriteLine("Please restart the program and try again.");
        }
        catch (DivideByZeroException)
        {
            Console.WriteLine("Error: Cannot divide by zero.");
            Console.WriteLine("Please restart the program and try again.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An unexpected error occurred: {ex.Message}");
            Console.WriteLine("Please restart the program and try again.");
        }
        Console.WriteLine("Program has ended. Press any key to exit.");
        Console.ReadKey();
    }
    static int Divide(int num1, int num2)
    {
        return num1 / num2;
    }
}
    