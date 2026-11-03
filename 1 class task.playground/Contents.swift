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
    // TODO: items, add(_:), remove(productId:), count, total
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
