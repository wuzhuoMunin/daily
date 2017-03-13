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
