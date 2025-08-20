//
//  IndicatorLoaderView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct IndicatorLoaderView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .appRed))
                .scaleEffect(1.8)
            Spacer()
        }
        .padding()
        .background(Color.appDarkBlueGray.opacity(0.00001))
    }
}

#Preview {
    IndicatorLoaderView()
}
