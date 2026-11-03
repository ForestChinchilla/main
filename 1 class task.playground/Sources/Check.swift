import Foundation

/// Простая проверка для playground: печатает ✅ или ❌ с ожидаемым и фактическим значением.
public func check<T: Equatable>(_ actual: T, _ expected: T, _ title: String) {
    if actual == expected {
        print("✅ \(title)")
    } else {
        print("❌ \(title)\n   ожидалось: \(expected)\n   получено:  \(actual)")
    }
}
