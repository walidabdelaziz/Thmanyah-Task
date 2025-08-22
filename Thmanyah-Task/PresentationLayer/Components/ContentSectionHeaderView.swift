//
//  ContentSectionHeaderView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 22/08/2025.
//

import SwiftUI

struct ContentSectionHeaderView: View {
    var title = "Title"
    var onArrowPressed: (() -> Void)? = nil
    var body: some View {
        HStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .padding(8)
                .offset(x: 8)
                .flipsForRightToLeftLayoutDirection(true)
                .onTapGesture {
                    onArrowPressed?()
                }
        }
        .font(.ibmSemiBold(.title3))
        .foregroundStyle(.appWhite)
    }
}

#Preview {
    ContentSectionHeaderView()
}
