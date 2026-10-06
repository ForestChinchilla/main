//1. Синтаксис замыкания
//
//Создай константу multiply типа (Int, Int) -> Int, которая перемножает два числа. Запиши её тремя способами: полной формой (с типами и return), сокращённой (без типов) и самой короткой (через $0, $1).
//
//swift
//let multiply: (Int, Int) -> Int = // ...
//print(multiply(3, 4)) // 12

let multiply = { (x: Int, y: Int) -> Int in
        return x * y
}

print(multiply(2,3))
    
let shortMultiply: (Int, Int) -> Int = { x, y in
    x * y
}

print(shortMultiply(3,4))

let shortestMultyply: (Int, Int) -> Int = {
    $0 * $1
}

print(shortestMultyply(4,5))
