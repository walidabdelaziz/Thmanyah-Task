//
//  ContentSectionHeaderView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 22/08/2025.
//

import SwiftUI

struct ContentSectionHeaderView: View {
    var title = "Title"
    var showViewAllArrow: Bool = true
    var onArrowPressed: (() -> Void)? = nil
    var body: some View {
        HStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.ibmSemiBold(.title3))
            
            if showViewAllArrow{
                Image(systemName: "chevron.right")
                    .font(.ibmMedium(.headline))
                    .padding(8)
                    .offset(x: 8)
                    .flipsForRightToLeftLayoutDirection(true)
                    .onTapGesture {
                        onArrowPressed?()
                    }
            }
        }
        .foregroundStyle(.appWhite)
    }
}

#Preview {
    ContentSectionHeaderView()
}
