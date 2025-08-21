//
//  SectionView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct SectionView: View {
    let section: SectionEntity
    @Environment(\.layoutDirection) private var layoutDirection

        var body: some View {
            LazyVStack(alignment: .leading, spacing: 12) {
                Text(section.name ?? "No Title")
                    .font(.ibmSemiBold(.title3))
                    .foregroundStyle(.appWhite)
                    .padding(.horizontal)
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        contentScroll
                            .padding(.horizontal)
                    }
                    .onChange(of: layoutDirection) {
                        withAnimation {
                            if let firstId = section.content?.first?.id {
                                proxy.scrollTo(firstId, anchor: .leading)
                            }
                        }
                    }
                }
            }
        }
    
    @ViewBuilder
    private var contentScroll: some View {
        switch section.normalizedType {
        case "2_lines_grid":
            twoLineGridView
        case "big_square", "square", "queue":
            normalGridView
        default:
            normalGridView
        }
    }
    private var twoLineGridView: some View {
        let numberOfRows = min(2, max(1, (section.content?.count ?? 1 + 1) / 2))
        let rows = Array(repeating: GridItem(.flexible(), spacing: 12), count: numberOfRows)
        
        return LazyHGrid(rows: rows, spacing: 12) {
            ForEach(section.content ?? []) { content in
                TwoLineGridContentCell(
                    content: content,
                    onEllipsisPressed: {
                        
                    },
                    onHorizontalLinePressed: {
                        
                    }
                )
                .id(content.id)
                .frame(width: UIScreen.main.bounds.width * 0.75)
            }
        }
    }
    private var normalGridView: some View {
        LazyHStack(spacing: 12) {
            ForEach(section.content ?? []) { content in
                switch section.normalizedType {
                case "big_square":
                    BigSquareContentCell(content: content)
                        .id(content.id)
                        .frame(width: UIScreen.main.bounds.width / 1.75)
                case "square":
                    SquareContentCell(content: content)
                        .id(content.id)
                        .frame(width: UIScreen.main.bounds.width / 3.2)
                case "queue":
                    QueueContentCell(content: content)
                        .id(content.id)
                        .frame(width: UIScreen.main.bounds.width * 0.75)
                default:
                    SquareContentCell(content: content)
                        .id(content.id)
                        .frame(width: UIScreen.main.bounds.width / 3.2)
                }
            }
        }
    }
}


#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        ScrollView{
            LazyVStack{
                SectionView(
                    section: SectionEntity.init(
                        name: "Top Podcasts",
                        type: "square",
                        contentType: "",
                        order: 1,
                        content: ContentEntity.mocks
                    )
                )
                
                SectionView(
                    section: SectionEntity.init(
                        name: "Top Podcasts",
                        type: "big square",
                        contentType: "",
                        order: 1,
                        content: ContentEntity.mocks
                    )
                )
                
                SectionView(
                    section: SectionEntity.init(
                        name: "Top Podcasts",
                        type: "queue",
                        contentType: "",
                        order: 1,
                        content: ContentEntity.mocks
                    )
                )
                
                SectionView(
                    section: SectionEntity.init(
                        name: "Top Podcasts",
                        type: "2_lines_grid",
                        contentType: "",
                        order: 1,
                        content: ContentEntity.mocks
                    )
                )
            }
        }
    }
}
