/*:
 # Задача 1. Общая корзина
 **Время:** ~5 мин · **Темы:** ссылочная семантика, мутабельность `let`-экземпляра класса

 ## Контекст
 Экран товара и бейдж на таб-баре должны работать с **одной и той же** корзиной:
 пользователь добавил товар на карточке — счётчик на табе сразу обновился.

 ## Что сделать
 Реализуй класс `CartStore` (блок `MARK: - Твой код`):
 - `items: [Product]` — снаружи доступен **только для чтения**;
 - `add(_ product: Product)`;
 - `remove(productId: Int)` — удаляет позиции с этим `id`;
 - `count: Int` и `total: Decimal` — вычисляемые свойства.

 Пока `CartStore` пустой, playground не скомпилируется — это нормально.
 Готово, когда все проверки внизу зелёные ✅.

 ## Проверь себя
 Ответы запиши в блок «Мои ответы» в конце файла.
 1. Почему можно мутировать `cart`, хотя он объявлен через `let` — и в экранах, и снаружи?
 2. Сделай `CartStore` структурой. Что сломается при компиляции и почему?
 3. Если после этого везде заменить `let` на `var` — что покажет `badge.text` и почему?
 */
import Foundation

struct Product {
    let id: Int
    let title: String
    let price: Decimal
}

// MARK: - Твой код

final class CartStore {
    private(set) var items: [Product] = [] {
        didSet {
            counter()
            totalCalc()
        }
    }
    private(set) var count = 0
    private(set) var total: Decimal = 0
    
    func add(_ product:Product) {
        items.append(product)
    }
    
    func remove(productId: Int) {
        items.removeAll(where: { $0.id == productId})
    }
    
    private func counter() {
        count = items.count
    }
    
    private func totalCalc() {
        total = items.reduce(into: 0.0) { total, kolbasa in
            total += kolbasa.price }
}
    
    init (items: [Product] = []) {
        self.items = items
    }
}

// MARK: - Экраны (не меняй)

final class ProductDetailsScreen {
    let cart: CartStore

    init(cart: CartStore) {
        self.cart = cart
    }

    func didTapAddToCart(_ product: Product) {
        cart.add(product)
    }
}

final class TabBarBadge {
    let cart: CartStore

    init(cart: CartStore) {
        self.cart = cart
    }

    var text: String {
        cart.count == 0 ? "" : "\(cart.count)"
    }
}

// MARK: - Сценарий и проверки

let cart = CartStore()
let screen = ProductDetailsScreen(cart: cart)
let badge = TabBarBadge(cart: cart)

screen.didTapAddToCart(Product(id: 1, title: "Крем", price: 1990))
screen.didTapAddToCart(Product(id: 2, title: "Шампунь", price: 890))

check(badge.text, "2", "Бейдж видит товары, добавленные на другом экране")
check(cart.total, 2880, "Сумма корзины")

cart.remove(productId: 1)
check(badge.text, "1", "После удаления бейдж обновился")
check(cart.total, 890, "Сумма после удаления")

cart.remove(productId: 2)
check(badge.text, "", "Пустая корзина — бейдж скрыт")

/*:
 ## Мои ответы
 1.
 2.
 3.
 */
//Почему можно мутировать cart, хотя он объявлен через let — и в экранах, и снаружи?
//потому что cart это ссылка на класс CartStore, мы по сути карт то и не мутируем, мы мутируем массив внутри класса на который ссылается cart
//
//Сделай CartStore структурой. Что сломается при компиляции и почему?
//при том же let cart: CartStore будет создана копия, а не ссылка на класс, порнуха начнется, в скрине и в табе будут разные копии
//я думаю что все скомпилируется, просто при didTapAddToCart на скрине колбаса добавится в копию CartStore, а на табе и в самом картсторе ничего не поменяется
//
//Если после этого везде заменить let на var — что покажет badge.text и почему?
//а он и так ничего не показывает))
