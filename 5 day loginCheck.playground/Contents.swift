//4. Создай функцию, которая проверяет логин:
//
//Принимает:
//
//username: String
//password: String
//
//И возвращает Bool
//
//Правила:
//
//username не пустой
//password минимум 8 символов
//password содержит хотя бы одну цифру
//
//Если всё ок → true, иначе → false
//
//Пример:
//
//login(username: "alex", password: "pass1234") // true
//login(username: "", password: "12345678")     // false
//login(username: "alex", password: "password") // false

func login(_ login: String,_ pass: String) -> Bool {
    if login.isEmpty {
        return false
    } else {
        if pass.count < 8 {
            return false
        } else {
            if (pass.filter { $0.isNumber }.count > 0) {
                return true
            } else {
                return false
            }
        }
    }
}

if login("Shluha", "davalka1") {
    print("ok")
} else {
    print("not")
}
