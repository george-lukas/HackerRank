import java.io.*;
import java.util.*;
class Node{
	int data;
	Node next;
	Node(int d){
        data=d;
        next=null;
    }
}

class Solution {
  public static Node insert(Node head, int data) {
    if(head == null) {
        //If head is not initialised, initialise it.
        head = new Node(data);
    } else {
        Node currentNode = head;
        //Iterate to end of list
        while(currentNode.next != null)
            currentNode = currentNode.next;
        //Insert data at the end by creating new node
        currentNode.next = new Node(data);
    }   
    //return new head
    return head;
}

  public static void display(Node head) {
          Node start=head;
          while(start!=null) {
              System.out.print(start.data+" ");
              start=start.next;
     }
 }
  public static void main(String args[]) {
          Scanner sc=new Scanner(System.in);
          Node head=null;
          int N=sc.nextInt();
          while(N-->0){
              int ele=sc.nextInt();
              head=insert(head,ele);
          }
          display(head);

   }
}