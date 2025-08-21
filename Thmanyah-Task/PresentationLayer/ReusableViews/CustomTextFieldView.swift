//
//  CustomTextFieldView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String
    var placeholder: LocalizedStringKey = "Search here"
    
    var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(placeholder)
                .foregroundColor(.appWhite.opacity(0.6))
        )
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.appDarkBlueGray)
        .foregroundColor(.appWhite)
        .accentColor(.appWhite)     
        .cornerRadius(Constants.CORNER_RADIUS)
    }
}


#Preview {
    @Previewable @State var text = ""
    CustomTextFieldView(text: $text)
}
