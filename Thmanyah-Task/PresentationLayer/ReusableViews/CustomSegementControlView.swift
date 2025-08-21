//
//  CustomSegementControlView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI

struct CustomSegementControlView<T: Hashable>: View {
    @Namespace var namespace
    var items: [T]
    @Binding var selectedItem: T?
    var label: (T) -> LocalizedStringKey
    var onItemSelected: ((T) -> Void)? = nil

    var body: some View {
        HStack(spacing: 4) {
            ForEach(items, id: \.self) { item in
                Text(label(item))
                    .frame(maxWidth: .infinity)
                    .font(.ibmMedium(.subheadline))
                    .foregroundColor(selectedItem == item ? .white : .gray)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(
                        ZStack {
                            if selectedItem == item {
                                RoundedRectangle(cornerRadius: Constants.CORNER_RADIUS)
                                    .fill(.appRed)
                                    .matchedGeometryEffect(id: "selection", in: namespace)
                            }
                        }
                    )
                    .onTapGesture {
                        guard selectedItem != item else { return }
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            onItemSelected?(item)
                        }
                    }
            }
        }
        .padding(6)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.appDarkBlueGray)
        )
    }
}

#Preview {
    @Previewable @State var selectedItem: AppLanguages? = .english
    CustomSegementControlView(
        items: AppLanguages.allCases,
        selectedItem: $selectedItem,
        label: { LocalizedStringKey($0.title) },
        onItemSelected: { item in
            selectedItem = item
        }
    )
}
