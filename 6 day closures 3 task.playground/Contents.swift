//3. Trailing closure и функции высшего порядка
//
//Дан массив:
//
//swift
//let names = ["anna", "Bob", "kate", "Alexander", "tim", "Olga"]
//
//Используя filter, map, sorted и reduce, получи одну строку: имена длиннее 3 символов, с заглавной первой буквой, отсортированные по алфавиту и соединённые через ", ".
//Ожидаемый результат: "Alexander, Anna, Kate, Olga".
//
//Затем реши то же самое через compactMap/joined(separator:) и подумай, какой вариант читается лучше.

var names = ["anna", "Bob", "Kate", "Alexander", "tim", "Olga","Evpatiy","Loh","veseniya","Aleksa","Spiridon","Said","akhmed","Lol","Kek","Cheburek"]

// большая запись, неудобно, сложно
//
func filtration (array:[String]) -> [String] {
    var filtredArray : [String] = []
    for index in 0...(array.count-1) {
        if array[index].count > 3 {
            filtredArray.append(array[index])
        }
    };   return filtredArray
}
//фильтр по длинне и прочее так опписывать не стал

//красивая короткая запись, я всю голову сломал пока это написал, а если честнее, то по сути нашел и адаптировал, не было в обучении .allSatisfy и прочего
//
let filterRegister = names.filter { !$0.allSatisfy { $0.isLowercase } }

//фильтрация коротких
//
let filterCount = names.filter { $0.count > 3 }
    
// сортировка
//
let filterSorted = names.sorted()

// обьединение
//
let filterReduced = names.reduce("") {result, name in
    result.isEmpty ? name : result + " " + name
}


//РЕШЕНИЕ ЗАДАЧИ:
//
//cоздаю кложуры
//
let cFilterRegister : ([String]) -> [String] = { array in
    array.filter { !$0.allSatisfy { $0.isLowercase }}
}


let cFilterCount : ([String]) -> [String] = { array in
    array.filter { $0.count > 3}
}


let cFilterSorted : ([String]) -> [String] = { array in
    array.sorted()
}

let cFilterReduced : ([String]) -> String = { array in
    array.reduce("") {result, name in
        result.isEmpty ? name : result + " " + name
    }
}

//создаю альфа кложуру
//

let bigFilter : ([String]) -> String = { array in
    let firstStep = cFilterRegister(array)
    let secondStep = cFilterCount(firstStep)
    let thirdStep = cFilterSorted(secondStep)
    let result = cFilterReduced(thirdStep)
    return result
}

print(bigFilter(names))
