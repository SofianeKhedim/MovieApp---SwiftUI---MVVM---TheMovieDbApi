
import Foundation

extension Optional where Wrapped == String {
    var stringValue: String {
        guard let self = self else { return "" }
        return self
    }
}
