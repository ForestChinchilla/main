//5. Создай функцию, которая принимает:
//
//массив чисел [Int]
//число-порог (Int)
//
//И возвращает новый массив, содержащий только числа больше порога.
//
//Пример:
//
//filterGreaterThan([1, 5, 8, 2, 10], threshold: 5)
//// [8, 10]

func arrFilter(_ array: [Int], _ filterValue: Int) -> [Int] {
    var filtredAr: [Int] = []
    for value in array {
        if value > filterValue {
            filtredAr.append(value)
        }
    }
    return filtredAr
}

let ar1 = [1,2,3,4,5,6,7,8,9,10]
let ar2 = arrFilter(ar1,5)
print (ar2)
