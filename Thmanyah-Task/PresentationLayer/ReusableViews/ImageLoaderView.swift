//
//  ImageLoaderView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var image = Constants.SHARED_IMAGE
    var contentMode: ContentMode = .fill
    var body: some View {
        Rectangle()
            .opacity(0.00001)
            .overlay {
                WebImage(url: URL(string: image))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: contentMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
}

