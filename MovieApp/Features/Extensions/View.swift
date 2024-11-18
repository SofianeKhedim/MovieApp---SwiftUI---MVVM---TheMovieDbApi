
import SwiftUI

extension View {
    func poppins(_ font: Poppins, _ size: CGFloat = 14) -> some View {
        self.font(.custom(font.fontName, size: size))
    } 
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}

