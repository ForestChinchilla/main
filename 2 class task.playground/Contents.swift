/*:
 # Задача 2. Аналитика экранов
 **Время:** ~10 мин · **Темы:** наследование, инициализаторы, `super.init`, `override`, `final`

 ## Контекст
 Типичный «базовый контроллер»: базовый класс сам отправляет `screen_view`,
 а наследники добавляют свои параметры или дополнительные события.

 ## Что сделать
 1. `class TrackableScreen`
    - `let screenName: String`
    - `init(screenName:)`
    - `func viewDidAppear()` — логирует `"screen_view"` с параметрами
      `["screen": screenName]` + `trackingParams()`
    - `func trackingParams() -> [String: String]` — по умолчанию пустой словарь
 2. `ProductScreen: TrackableScreen`
    - `let productId: Int`
    - `init(productId:)` — `screenName` всегда `"product"`
    - добавляет в `screen_view` параметр `"product_id"`
 3. `CheckoutScreen: TrackableScreen`
    - `let itemsCount: Int`
    - `screenName` всегда `"checkout"`
    - при появлении **дополнительно** (после `screen_view`) логирует `"begin_checkout"` с параметром `"items"`

 Готово, когда все проверки внизу зелёные ✅.

 ## Проверь себя
 1. Почему `self.productId = productId` нужно написать **до** `super.init`, а не после?
 2. Убери `super.viewDidAppear()` в `CheckoutScreen`. Что потеряется? Где ровно такой же баг встречается в UIKit?
 3. Какие классы здесь стоит пометить `final` и что это даёт, кроме запрета наследования?
 4. Почему у `TrackableScreen` нет memberwise-инициализатора, как у структур?
 */
import Foundation

// MARK: - Аналитика (не меняй)

final class Analytics {
    static let shared = Analytics()
    private(set) var events: [String] = []

    func log(_ event: String, _ params: [String: String] = [:]) {
        let paramsText = params
            .sorted { $0.key < $1.key }
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: ", ")
        let line = "\(event) [\(paramsText)]"
        events.append(line)
        print("📊 \(line)")
    }

    func reset() {
        events.removeAll()
    }
}

// MARK: - Твой код

// TODO: TrackableScreen
class TrackableScreen {
    let screenName: String
    fileprivate(set) var params: [String: String] = [:]
    
    init (screenName: String) {
        self.screenName = screenName
    }
    
    func viewDidAppear() {
        Analytics.shared.log("screen_view", trackingParams())
    }
    
    func trackingParams() -> [String: String] {
        params["screen"] = "\(screenName)"
        return [:]
    }
}

// TODO: ProductScreen
final class ProductScreen: TrackableScreen {
    let productId: Int
    
    init(productId:Int, params: [String: String] = [:]) {
        self.productId = productId
        super.init(screenName: "product")
    }
    override func trackingParams() -> [String: String] {
        params["screen"] = "\(screenName)"
        params["product_id"] = "\(productId)"
        return params
    }
}
    
// TODO: CheckoutScreen
final class CheckoutScreen: TrackableScreen {
    let itemsCount: Int

    init(itemsCount: Int, params: [String: String] = [:]) {
        self.itemsCount = itemsCount
        super.init(screenName: "checkout")
        Analytics.shared.log("screen_view", trackingParams())
        Analytics.shared.log("begin_checkout", ["items":"\(itemsCount)"])
        
    }
    override func trackingParams() -> [String: String] {
        params["screen"] = "\(screenName)"
        return params
    }
    
    override func viewDidAppear() {
//        Analytics.shared.log("screen_view", trackingParams())
//        Analytics.shared.log("begin_checkout", ["items":"\(itemsCount)"])
    }
}
// MARK: - Проверки

Analytics.shared.reset()
ProductScreen(productId: 42).viewDidAppear()
check(
    Analytics.shared.events,
    ["screen_view [product_id=42, screen=product]"],
    "ProductScreen добавляет product_id"
)

Analytics.shared.reset()
CheckoutScreen(itemsCount: 3).viewDidAppear()
check(
    Analytics.shared.events,
    ["screen_view [screen=checkout]", "begin_checkout [items=3]"],
    "CheckoutScreen шлёт screen_view и begin_checkout в правильном порядке"
)

/*:
 ## Мои ответы
 1.
 2.
 3.
 4.
 */
