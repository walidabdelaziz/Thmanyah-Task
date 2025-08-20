//
//  QueueContentCell.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct QueueContentCell: View {
    var content: ContentEntity = .mock
    
    var body: some View {
          HStack(spacing: 8) {
              ImageLoaderView(image: content.avatarURL ?? "")
                  .frame(width: .dynamicSize(),height: .dynamicSize())

              contentInfoSection
                  .frame(maxWidth: .infinity,alignment: .leading)
          }
          .foregroundStyle(.appWhite)
          .background(.appDarkBlueGray)
          .cornerRadius(Constants.CORNER_RADIUS)
          .overlay(alignment: .bottomTrailing) {
              Image(systemName: "play.fill")
                  .foregroundStyle(.appDarkBlueGray)
                  .font(.caption)
                  .padding(6)
                  .background()
                  .clipShape(Circle())
                  .padding(8)
          }
      }
    
    private var contentInfoSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(content.name ?? "")
                .font(.ibmBold(.caption))
                .lineLimit(1)

            Text(content.description?.cleanedHTML() ?? "")
                .font(.ibmSemiBold(.caption2))
                .lineLimit(2)
            
            HStack(spacing: 4){
                Text(content.duration?.asDurationReadable ?? "")
                    .font(.ibmSemiBold(.caption))
                    .foregroundStyle(.appRed)

                Text(content.releaseDate?.asTimeAgo() ?? "")
                    .foregroundStyle(.appLightGray)
                    .font(.ibmSemiBold(.caption))
                    .lineLimit(1)
            }
        }
        .padding(.trailing, 6)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        QueueContentCell()
    }
}
