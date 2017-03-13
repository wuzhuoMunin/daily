//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Shape{
    var numberOfSides = 0;
    func simpleDescription() -> String {
        return "A shape with\(numberOfSides)sides"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapDescription = shape.simpleDescription()

class NamedShape{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides. \n \(name)"
    }
}

var namedShape = NamedShape(name:"munin")
namedShape.numberOfSides = 7
namedShape.simpleDescription()

class Square: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength:5.2, name:"my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape{
    var radius : Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return  radius * 2 * 3.14
    }
    override func simpleDescription() -> String {
        return "A quare with sides of length \(radius)"
    }
}

let newTest = Circle(radius:2, name:"new test cricle")
newTest.area()
newTest.simpleDescription()

class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 3
    }
    
    var perimter: Double{
        get{
            return 3 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A quare with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength:3.1, name: "a triangle")
print(triangle.perimter)
triangle.perimter = 9.9
print(triangle.sideLength)


class TriangleAndSquare{
    var triangle: EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double,name: String) {
        square = Square(sideLength:size,name:name)
        triangle = EquilateralTriangle(sideLength:size,name:name)
    }
}

var triangleAndSquare = TriangleAndSquare(size:10, name:"another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength:50,name:"larger square")
print(triangleAndSquare.triangle.sideLength)

enum Rank:Int{
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String{
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
let a = Rank(rawValue:2)

func bigger(firstNumber: Rank,secondNumber: Rank) -> Rank {
    if firstNumber.rawValue < secondNumber.rawValue {
        return secondNumber
    }else{
        return firstNumber
    }
}

bigger(firstNumber: Rank.Six, secondNumber: Rank.Four)


enum Suit{
    case Sqades,Hearts,Diamonds,Clubs
    func simpleDescription() -> String {
        switch self{
        case .Sqades:
            return "sqades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "dismonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .Hearts:
            return "red"
        case .Diamonds:
            return "red"
        case .Sqades:
            return "black"
        case .Clubs:
            return "black"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse{
    case Result(String,String)
    case Failure(String)
    case TimeOut(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
//let failure = ServerResponse.Failure("Out of cheese.")
//let timeOut = ServerResponse.TimeOut("Time Out.")

switch success{
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Failure(message):
    print("Failure... \(message)")
case let .TimeOut(outTime):
    print("time out \(outTime)")
}

struct Card{
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) if \(suit.simpleDescription())"
    }
    func allCardsInArray() -> Array<String>{
        var array:[String] = []
        for i in 1...13{
            array += ["\(Rank(rawValue:i)) \(Suit.Hearts)"]
            array += ["\(Rank(rawValue:i)) \(Suit.Diamonds)"]
            array += ["\(Rank(rawValue:i)) \(Suit.Clubs)"]
            array += ["\(Rank(rawValue:i)) \(Suit.Sqades)"]
        }
        return array;
    }
}

let threeOfSpades = Card(rank:.Three,suit:.Sqades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
let cards = threeOfSpades.allCardsInArray()


protocol ExampleProtocol{
    var simpleDescription:String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol{
    var simpleDescription: String = "A very simple calss."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}

var testa = SimpleClass()
testa.adjust()
let aDescription = testa.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}

var testb = SimpleStructure()
testb.adjust()
testb.simpleDescription

extension Int: ExampleProtocol{
    var simpleDescription: String{
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)