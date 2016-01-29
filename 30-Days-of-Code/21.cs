using System;

public class Solution {

private static void printArray<T>(T[] array){
    
    Console.WriteLine(String.Join(Environment.NewLine, array));
}
	static void Main(string[] args) {
        int[] vInt = new int[] {1, 2, 3};
        string[] vString = new string[] {"Hello", "World"};
        
        printArray<int>(vInt);
        printArray<string>(vString);
    }
}