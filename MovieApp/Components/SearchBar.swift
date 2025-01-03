

import SwiftUI
 
struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField("Search",text: $searchText)
            .overlay (
                ZStack {
                    if searchText.isEmpty {
                        Image.SearchIcon
                        
                    } else {
                        Image.CancelIcon
                            .foregroundColor(.white)
                            .onTapGesture {
                                searchText = ""
                                UIApplication.shared.endEditing()
                            }
                    }
                    
                    
                }
                , alignment: .trailing)
            .foregroundStyle(.appGrayColor2)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(.appGrayColor1))
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
