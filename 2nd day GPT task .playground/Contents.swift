// задача на список заказов и их статус

//статус заказа

enum OrderStatus: String {
    case inProgress = "in progress"
    case done = "done"
    case taken = "taken"
}

let status: OrderStatus = .done
//ввожу "меню"

let beef = (name: "Beef" , price: 50)
let chkn = (name: "Chiken" , price: 30)
let fish = (name: "Fish" , price: 60)
let meat = [beef,chkn,fish]

let rice = (name:"Rice" , price: 20)
let grecha = (name:"Grecha" , price: 25)
let oves = (name:"Oves", price: 15)
let garn = [rice,grecha,oves]

//создаю массив с заказами в котором будут храниться заказы переданные на приготовление

var ordersOnKitchen : [(first:String, second:String, price:Int, status:OrderStatus)] = []

//пример диалога с пользователем

print("""
      Chose type of meat:
1 - \(beef.name) = \(beef.price)
2 - \(chkn.name) = \(chkn.price)
3 - \(fish.name) = \(fish.price)
""")
    
var chooseMeat = Int.random(in: 0...2)  //я не знал что в песочнице ввод из консоли не работает поэтому долго не мог понять в чем дело и оставил рандом :3
print("Your will be eat \(meat[chooseMeat].name) with:")
    
    
    print("""
1 - \(rice.name) = \(rice.price)
2 - \(grecha.name) = \(grecha.price)
3 - \(oves.name) = \(oves.price)
""")
    
var chooseGarn = Int.random(in: 0...2)
    print("Your will be eat \(meat[chooseMeat].name) with \(garn[chooseGarn].name) and total cost of your order is \(meat[chooseMeat].price + garn[chooseGarn].price)")
 
//формирую заказ
var dynamicOrder =
(first: meat[chooseMeat].name, second: garn[chooseGarn].name, price:meat[chooseMeat].price + garn[chooseGarn].price, status:OrderStatus.inProgress)

//вношу заказ в список готовки
ordersOnKitchen.append(dynamicOrder)


//дальше создаю еще 5 заказов и помещаю их в массив

for i in 1...4 {
    chooseGarn = Int.random(in: 0...2)
    chooseMeat = Int.random(in: 0...2)
    var dynamicOrder =
    (first: meat[chooseMeat].name, second: garn[chooseGarn].name, price:meat[chooseMeat].price + garn[chooseGarn].price, status:OrderStatus.inProgress) //вот тут надопоменять строку на ссылку на перечисление
    
    ordersOnKitchen.append(dynamicOrder)
    }

 // повар отметил заказ как готовый

ordersOnKitchen[2].status = .done


var collection = ordersOnKitchen.count

//for i in 0..<collection {
//
//}
//<>
for (index, order) in ordersOnKitchen.enumerated() {
//    if ordersOnKitchen[i].status == .done {
//        ordersOnKitchen.remove(at: i)

    switch order.status {
    case .done:
        ordersOnKitchen.remove(at: index)
    case .taken:
        continue
    default:
        break
    }

    
}

for i in 0...4 {
    if i == 2 {
        continue
    }
    print("sosati \(i)")
}

ordersOnKitchen.forEach { order in
    print(order.first, order.second, order.price)
}
//<>
//for (index, order in 0...3{
//    print(ordersOnKitchen[i].first, ordersOnKitchen[i].second, ordersOnKitchen[i].price)
//
//}



var score = 95
score -= 5
print(score)


