import Foundation

func uniqueCharacter(_ text: String) -> Bool{
    var charSet = Set<Character>()
    
    for char in text {
        if charSet.contains(char){
            return false;
        }
        else{
            charSet.insert(char)
        }
    }
    return true;
}

print("Enter a string:")

if let input = readLine() {
    //call the function 
    let result = uniqueCharacter(input)
    
    if result {
        print("The string has all unique characters.")
    } else {
        print("The string has duplicate characters.")
    }
}