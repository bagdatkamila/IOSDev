import Foundation

func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false;
    } //for the case of 0,1 
    let upperBound = Int(Double(num).squareRoot())
        if upperBound < 2 {
            return true
        } //for the case of 1 
        for i in 2...upperBound {
            if num % i == 0 {
                return false
            } //if it ts divisble by i it is not prime
        }
    return true;
}

for j in 1...100 {
    print("\(j) is prime: \(isPrime(j))");
}