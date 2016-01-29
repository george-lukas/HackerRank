class Palindrome:
    def pushCharacter(self, char):
        self.W = self.W + char if hasattr(self, 'W') else char
    def enqueueCharacter(self, char):
        pass
    def popCharacter(self):
        return chr(16) if self.W == self.W[::-1] else chr(24)
    def dequeueCharacter(self):
        return chr(16)

# read the string s
W=input()
#Create the Palindrome class object
p=Palindrome()   

l=len(W)
# push all the characters of string s to stack
for i in range(l):
    p.pushCharacter(W[i])
#enqueue all the characters of string s to queue
for i in range(l):
    p.enqueueCharacter(W[i])
f=True
'''
pop the top character from stack
dequeue the first character from queue
compare both the characters
''' 
for i in range(l):
    if p.popCharacter()!=p.dequeueCharacter():
        f=False
        break
#finally print whether string s is palindrome or not.
if f:
    print ("The word, "+W+", is a palindrome.")
else:
    print ("The word, "+W+", is not a palindrome.")