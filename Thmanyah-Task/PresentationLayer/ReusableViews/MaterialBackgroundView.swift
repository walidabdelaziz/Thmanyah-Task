//
//  MaterialBackgroundView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI

struct MaterialBackgroundView: View {
    var material: Material = .ultraThinMaterial
    var brightness: Double = -0.5
    
    var body: some View {
        Rectangle()
            .fill(.clear)
            .background(
               material
            )
            .brightness(brightness)
    }
}

#Preview {
    MaterialBackgroundView()
}
