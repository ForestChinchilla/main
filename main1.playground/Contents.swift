func ageTest (person p: (name: String, age:Int)) {
    if p.age >= 18 {
        return print("Hey, \(p.name) let's do this")
    }
    else{
        return print("Oh no, \(p.name) is only \(p.age), you are too young for this shit")
    }
}

let vasya = (name: "Vasilly", age:30)

ageTest(person: vasya)

let petinka = (name: "Peter", age:17)

ageTest(person: petinka)
