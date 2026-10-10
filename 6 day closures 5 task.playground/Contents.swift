//5. Захват значений (capturing)
//
//Напиши функцию makeCounter(), которая возвращает замыкание () -> Int. Каждый вызов замыкания увеличивает внутренний счётчик и возвращает его.
//
//swift
//let counterA = makeCounter()
//let counterB = makeCounter()
//
//print(counterA()) // ?
//print(counterA()) // ?
//print(counterB()) // ?
//print(counterA()) // ?
//
//Сначала предскажи вывод, потом проверь. Объясни, где хранится переменная счётчика после выхода из функции и почему замыкания являются ссылочным типом.

func makeCount () -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

//let counterA = makeCount()
//print(counterA()) // 1
//print(counterA()) // 2
//
//let counterB = makeCount()
//print(counterB()) // 1
//print(counterB()) // 2
//print(counterB()) // 3

// Тут я не понимаю как оно работает, по идее константам счетчика А и счетчика В соответствует одно и то же замыкание, если бы счетчик хранился в самом замыкании  то, то счетчики выдавали бы одно и тоже значние, но поскольку они "живут разной жизнью" мне приходит на ум что счетчик хранится внутри констаны counterA и counterB
//
// Если бы это было не так то в следующем коде на выводе были бы не нули
//

func makeCunt () -> () -> Int {
    var cunt = 0
    print("first:", cunt)
    return {
        cunt += 1
        print("second:",cunt)
        return  cunt
    }
}

makeCunt() //first: 0
makeCunt() //first: 0
makeCunt() //first: 0

//функция выполняется только до return
//неверное потому что "ее никто не спрашивает" и ей некуда свой полезный ретурн отдавать


// но я я не могу понять почему при первом вызове функция выполняет все, что до первого RETURN, а при последующих пропускает, ведь она должна присваивать 0 переменной cunt при каждом вызове
//
//оно как бы вот работает, но я пока хз как
//
let cuntA = makeCunt()
print(cuntA())
//first: 0
//second: 1
//1

print(cuntA())
//second: 2
//2

print(cuntA())
//second: 3
//3
