# New Lines

**To insert a new line in your output, you can use the \n character:**

```cpp
#include <iostream>
using namespace std;

int main() {
cout << "I Love Coding \n";
cout << "We can also use for line space" << "\n";
cout <<"To get a Blank Line we can use Two New Line Characters" << "\n\n";
cout <<"Another way to insert a new line, is with the endl manipulator" <<endl;
cout <<"Both \n and endl are used to break lines. However, \n is most used.";
return 0;
}

```

### But what is \n exactly?
**The newline character (\n)** is called an **escape sequence**, and it forces the cursor to change its position to the beginning of the next line on the screen. This results in a new line.

**Examples of other valid escape sequences are:**
- \t - Creates a horizontal tab
- \\	Inserts a backslash character (\)
- \"	Inserts a double quote character
