//
//  TwoLineGridContentCell.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI


struct TwoLineGridContentCell: View {
    var content: ContentEntity = .mock
    var dynamicSize: CGFloat = .dynamicSize(scale: 0.25)
    var onEllipsisPressed: (() -> Void)? = nil
    var onHorizontalLinePressed: (() -> Void)? = nil

    var body: some View {
          HStack(spacing: 8) {
              ImageLoaderView(image: content.avatarURL ?? "")
                  .frame(width: dynamicSize ,height: dynamicSize)

              contentInfoSection
                  .frame(maxWidth: .infinity,alignment: .leading)
          }
          .foregroundStyle(.appWhite)
          .cornerRadius(Constants.CORNER_RADIUS)
      }
    
    private var contentInfoSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(content.releaseDate?.asTimeAgo() ?? "")
                .foregroundStyle(.appLightGray)
                .font(.ibmSemiBold(.caption))
            
            Text(content.name ?? "")
                .font(.ibmBold(.caption))
                .lineLimit(2)
            
            HStack(spacing: 0){
                DurationView(duration: content.duration ?? 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Group{
                    Image(systemName: "ellipsis")
                        .padding(8)
                        .onTapGesture {
                            onEllipsisPressed?()
                        }
                    
                    Image(systemName: "line.horizontal.3")
                        .padding(8)
                        .onTapGesture {
                            onHorizontalLinePressed?()
                        }
                }
                .font(.title3)
                .offset(x: 8)
            }
        }
        .padding(.trailing, 6)
    }
}


#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        TwoLineGridContentCell()
    }
}
