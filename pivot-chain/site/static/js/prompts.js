var languageTemplates  = {
  python: `# take in the number
n = input()

# calculate answer


# print answer
print(n)
`,

  c: `// take in the number
#include <stdio.h>

int main() {
    int n;
    
    // take input
    scanf("%d", &n);

    // calculate answer
    
    
    // print answer
    printf("%d", n);

    return 0;
}
`,

  cpp: `// take in the number
#include <iostream>
using namespace std;

int main() {
    int n;

    // take input
    cin >> n;

    // calculate answer
    
    
    // print answer
    cout << n;

    return 0;
}
`,

  rust: `// take in the number
use std::io;

fn main() {
    let mut n = String::new();

    // take input
    io::stdin().read_line(&mut n).expect("Failed to read line");
    
    // calculate answer
    
    
    // print answer
    println!("{}", n.trim());
}
`
};
