//
//  ContentSquareCell.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct ContentSquareCell: View {
    var content: ContentEntity = .mock

    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            ImageLoaderView(image: content.avatarURL ?? "")
                .aspectRatio(1, contentMode: .fit)
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
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ContentSquareCell()
    }
}

