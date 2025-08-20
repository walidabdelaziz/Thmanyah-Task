//
//  BigSquareContentCell.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct BigSquareContentCell: View {
    var content: ContentEntity = .mock

    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(image: content.avatarURL ?? "")
                .aspectRatio(1, contentMode: .fit)

            overlayGradientSection
            
            contentInfoSection
        }
        .cornerRadius(Constants.CORNER_RADIUS)
    }
    private var overlayGradientSection: some View {
        LinearGradient(
            colors: [
                .appBlack.opacity(0),
                .appBlack.opacity(0.2),
                .appBlack.opacity(0.5),
                .appBlack.opacity(0.8)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    private var contentInfoSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(content.name ?? "")
                .foregroundStyle(.appWhite)
                .lineLimit(2)
                .font(.ibmBold(.headline))

            HStack(spacing: 6) {
                DurationView(duration: content.duration ?? 0, fontTextStyle: .subheadline)

                Text(content.releaseDate?.asTimeAgo() ?? "")
                    .foregroundStyle(.appRed)
                    .font(.ibmSemiBold(.subheadline))
                    .lineLimit(1)
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .bottomLeading)
    }
}


#Preview {
    ZStack{
        BigSquareContentCell()
    }
}
