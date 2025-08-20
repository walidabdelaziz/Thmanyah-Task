//
//  ContentSquareCell.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct ContentSquareCell: View {
    var content: ContentEntity = .mock
    var imageWidth: CGFloat = 150
    var imageHeight: CGFloat = 150
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            ImageLoaderView(image: content.avatarURL ?? "")
                .frame(width: imageWidth, height: imageHeight)
                .cornerRadius(Constants.CORNER_RADIUS)
            
            Text(content.name ?? "")
                .foregroundStyle(.appWhite)
                .lineLimit(1)
                .font(.ibmMedium(.caption))
                .padding(.horizontal, 4)
            
            
            
            HStack(spacing: 4) {
                DurationView(duration: content.duration ?? 0)
                    .layoutPriority(1)
                
                Text(content.releaseDate?.asTimeAgo() ?? "")
                    .foregroundStyle(.appLightGray)
                    .font(.ibmRegular(.caption))
                    .lineLimit(1)
                    .truncationMode(.tail)
            }

        }
        .frame(width: imageWidth)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ContentSquareCell()
    }
}

