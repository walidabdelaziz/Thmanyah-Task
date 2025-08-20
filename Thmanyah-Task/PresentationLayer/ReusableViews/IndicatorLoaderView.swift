//
//  IndicatorLoaderView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct IndicatorLoaderView: View {
    var body: some View {
        ZStack{
            Color.black.opacity(0.2).ignoresSafeArea()
        }
        .overlay {
            HStack {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .appRed))
                    .scaleEffect(1.8)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    IndicatorLoaderView()
}
