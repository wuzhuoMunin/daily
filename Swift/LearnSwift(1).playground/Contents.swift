//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

let implicitInteger = 70

let emptyArray = [String]()

var list = ["1","2"]
list [1] = "4"
list.append("55")

let numberArray = [20,50,70,80]
var count = 0
for score in numberArray{
    if score > 30 {
        count += 1;
    }else{
        count -= 1;
    }
}
print(count)

var optionString: String? = "Hello"
print(optionString == nil)

var optionalName: String? = nil
var  greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "j"
}
print(greeting)

var stringVlaue:String?
let hashValue = stringVlaue?.hashValue

let nickName: String? = nil
let fullName: String = "John Applessed"
let informalGreeting = "Hi \(nickName ?? fullName)"

let vegetable = "peppersss"
switch vegetable{
    case "celery":
    print("Add some raisns and make ants on a log.")
    case "cucumber","watercress":
    print("That would make a good tea sandwich.")
    case let x where x.hasPrefix("pepper"):
    print("Is it a spicy \(x)?")
    default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2,3,5,6,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]
var largest = 0
var kindStr = "ss"
for (kind, numbers) in interestingNumbers{
    for number in numbers{
        if number > largest {
            largest = number
            kindStr = kind
        }
    }
}
//print(largest)
print("\(kindStr) \(largest)")

var n = 2
while n < 200{
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = 2 * m
} while m < 100
print(m)

var total = 0
for  i in 0..<4 {
    total += i
}
print(total)

func greet (person: String, day: String) -> String{
    return "Hello \(person), today is \(day)."
}
print(greet(person:"Bob", day:"Tuesday"))

func greettext (person: String,eat: String) -> String{
    return "Hello \(person), today is \(eat)"
}
print(greettext(person: "aaa", eat: "bbb"))

func greettest(_ person:String, eat:String) -> String{
    return "Hello \(person) ,today eat \(eat)"
}
print(greettest("ss", eat: "baba"))


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores{
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics.sum)
print(statistics.0)


func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42,555,33,2)
sumOf(numbers: 22)

func average(numbers: Int...) -> Int{
    var sum = 0;
    var count = 0;
    for number in numbers{
        sum += number
        count += 1
    }
    return sum/count
}
average(numbers: 20,40,60,100)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int){
    func addOne(number: Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment (7)


func hasAnyMatches(list:[Int],codition:(Int) -> Bool) -> Bool {
    for item in list{
        if codition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool{
    return number < 10
}
var numbers = [20,19,7,12]
hasAnyMatches(list: numbers, codition: lessThanTen)

numbers.map({
    (number:Int) -> Int in
    let resule = 3 * number;
    return resule
})

let mappedNumbers = numbers.map({
    number in
    3 * number
})
print(mappedNumbers)

var myBlock:(String)->() = {
    name in
    print(name)
}
func myfunction(name:String,condition:(String)->()){
    condition(name)
}
myfunction(name: "jason", condition: myBlock)