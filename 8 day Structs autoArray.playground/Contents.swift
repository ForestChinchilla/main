//Я создаю структуру "машины" с одной константой для всех объетов этой структуры которая описывает о чем речь вообще, с параметрами которые могут отличаться у объектов, так же в структуре есть метод вывода информации о запрошенном объекте
//
let autoBrands = ["BMW","Autovaz","Jeep","ChinaShitCar","Nissan"]

enum engineType: String {
case gasoline = "gasoline"
case diesel = "diesel"
case electra = "electro"
}

struct Car {
    let type = "Car is a 4 wheels vehicle"
    var brand: String
    var model: String
    var year: Int
    var engineValue: Int
    var power: Int
    var fuelType: String
    var note: String
    
    func carInfo () -> Void {
        print("\(model) is a car of \(brand) autoconcern, manufacturing in \(year) year, have \(engineValue)cc \(fuelType) engine with \(power) horse power, it's a \(note) ")
    }
}

//создаю объекты этой структуры
//
let semerka = Car(brand: autoBrands[1], model: "2107", year: 2004, engineValue: 1400, power: 80, fuelType: engineType.gasoline.rawValue, note:"fucking classic")

let bmw1 = Car(brand: autoBrands[0], model: "1er", year: 2019, engineValue: 1500, power: 115, fuelType: engineType.diesel.rawValue, note: "good german car with a diesel engine")

let jeepZJ = Car(brand: autoBrands[2], model: "GrandCherokee ZJ", year: 1996, engineValue: 4000, power: 186, fuelType: engineType.gasoline.rawValue, note: "big hole for gasoline")

let zeekr = Car(brand: autoBrands[3], model: "zx9", year: 2025, engineValue: 0, power: 10, fuelType: engineType.electra.rawValue, note: "car made from sticks and shit, but very fast")

let juke = Car(brand: autoBrands[4], model: "Juke", year: 2014, engineValue: 1600, power: 190, fuelType: engineType.gasoline.rawValue, note: "good car, but CVT is a piece of dark shit")

//проверяю работу метода
//
semerka.carInfo()

//обьединяю оъекты в массив
//
var cars = [semerka, bmw1, jeepZJ, zeekr, juke]

//создаю функцию которая извне залезает в массив и находит объект структуры с максимальным праметром

//да, я забыл как найти максимальное значение в массиве, а интернета нет, поэтому по простому, ссорян)
//
@MainActor func newestCar (_ car:[Car]) -> Car {
    var newest = cars[0]
    for i in 0...cars.count-1 {
        if cars[i].year > newest.year { newest = cars[i]}
    }
        return newest
}

//проверяю функцию
//
print(newestCar(cars).model," is a newest car in our array")


//интернет появился и я вспомнил .max ))
//
@MainActor func powerestCar (_ car:[Car]) -> Void {
    var powerest = cars.max{ $0.power < $1.power }
    print(powerest!.model," is a powerest car") //вот только без ! код не работал, Xcode предложил его добавить и я не устоял, я почитаю про него еще раз
}

powerestCar(cars)
