//2. Замыкание как параметр функции
//
//Напиши функцию applyTwice, которая применяет переданное замыкание к числу дважды.
//
//
//func applyTwice(_ value: Int, _ transform: (Int) -> Int) -> Int {
//    // ...
//}
//
//applyTwice(3) { $0 * 2 }  // 12
//applyTwice(10) { $0 - 1 } // 8

func applyTwice(_ x: Int,_ closure: (Int) -> Int) -> Int {
    closure(closure(x))
}

let result = applyTwice(3) {$0 * 2}
print(result)



func action(_ x: Int,_ y: Int, _ closure: (Int) -> Int) -> Int {
    closure(closure(x))+y
}

let fuck = action(3, 4) {$0 + 3}
print(fuck)

func action1(
    x: Int,
    y: Int,
    closure1: (Int) -> Int,
    closure2: (Int) -> Int,
)-> Int {
    closure1(closure1(x))+closure2(closure2(y))
}

print(action1(
    x: 1,
    y: 4,
    closure1: {x in return x + 3},
    closure2: {y in return y + 2},
    )
)

//Попробуешь? Пускай будет функция func apply(n: Int, action: (Int) -> Int) -> Int

func apply(
    n: Int,
    x: Int,
    action: (Int) -> Int,
) -> Int {
    var y: Int = x
    for _ in 0..<n {
        y = action(y)
    }
    return y
}

print(apply(
    n: 7,
    x: 3,
    action: {x in x + 2},
    )
)

