//3. Создай функцию, которая:
//
//принимает массив чисел [Int]
//возвращает среднее значение (Double)
//
//Но есть условие:
//
//если массив пустой → вернуть 0
//
//Пример:
//
//average([1, 2, 3, 4]) // 2.5
//average([]) // 0

func avrArray(_ array: [Int]) -> Double {
    if array.isEmpty {
        return 0
    } else {
        return Double(array.reduce(0, +)) / Double(array.count)
    }
}

let arr = ([1, 2, 3, 4])
print(avrArray(arr))
