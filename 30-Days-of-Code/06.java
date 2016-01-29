import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class JavaLoops {
    static void printResults(int a, int b, int n)
    {
        int answer = 0;
        int tempAnswer = 0;
        for(int i = 0; i<n;i++){
            tempAnswer = 0;
            for(int j = 0;j<=i;j++){ 
                tempAnswer = tempAnswer +(int)(Math.pow(2.0,j)*b);
            }
            tempAnswer+=a;
            System.out.print(tempAnswer + " ");
        }
        System.out.print("\n");
        
    }
    public static void main(String[] args) {
       
        Scanner sc = new Scanner(System.in);
        int numCases = sc.nextInt();
        for(int i = 0;i<numCases;i++){
            int a = sc.nextInt();
            int b = sc.nextInt();
            int n = sc.nextInt();
            printResults(a,b,n);
            
        }
    }
}