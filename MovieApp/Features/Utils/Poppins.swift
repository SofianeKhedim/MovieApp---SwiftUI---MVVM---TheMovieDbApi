

import Foundation

enum Poppins : String {
    case black, bold, light,medium, regular, semiBold
    
    var fontName: String {
        "Poppins-\(self.rawValue.capitalizeFirstLetter)"
    }
}

