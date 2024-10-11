import Foundation
// Problem 7

func gradeCalculator(students:[String:Int]){
    let scores = Array(students.values)
    
    let total:Double = Double(scores.reduce(0, +))
    let average = total / Double(scores.count)
    
    let highScore = scores.max()
    let lowScore = scores.min()
    
    print("Average: \(average)")
    print("Highest: \(highScore ?? 0)")
    print("Lowest: \(String(describing: lowScore))")
    
    for(name, score) in students{
        let status = score>=Int(average) ? "above" : "below"
        print("\(name): \(score) (\(status) average)")
    }
}

var studentScores: [String: Int] = [
    "Alibek": 80,
    "Nurken": 75,
    "Aigerim": 90,
    "Sabina": 87,
    "Qwewrty": 100
]

gradeCalculator(students: studentScores)