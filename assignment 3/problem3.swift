import Foundation

func celsToFahr(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

func celsToKelv(_ celsius: Double) -> Double {
    return celsius + 273
}

func fahrToCels(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

func fahrToKelv(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9 + 273.15
}

func kelvToCels(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

func kelvToFahr(_ kelvin: Double) -> Double {
    return (kelvin - 273.15) * 9/5 + 32
}

func convertTemperature(){
    print("Enter the temperature:")
    guard let input = readLine(), let temperature = Double(input) else{
        print("Error")
        return
    } //value of temp
    
    print("The unit of Temperature:")
    guard let unit = readLine() else {
        print("ENTER C F K")
        return
    }
    
    switch unit {
        case "C":
            let fahrenheit = celsToFahr(temperature)
            let kelvin = celsToKelv(temperature)
            print("\(temperature)°C is \(fahrenheit)°F and \(kelvin)K")
            
        case "F":
            let celsius = fahrToCels(temperature)
            let kelvin = fahrToKelv(temperature)
            print("\(temperature)°F is \(celsius)°C and \(kelvin)K")
            
        case "K":
            let celsius = kelvToCels(temperature)
            let fahrenheit = kelvToFahr(temperature)
            print("\(temperature)K is \(celsius)°C and \(fahrenheit)°F")
            
        default:
            print("Error. Please enter C, F, or K.")
        }
}
convertTemperature();