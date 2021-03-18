//
//  AdaptiveStack.swift
//  Shared
//
//  Created by alexis on 17/03/21.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
    @Environment(\.sizeCategory) private var sizeCategory

    private var shouldDisplayVertically: Bool {
        #if os(iOS)
        return sizeCategory >= .accessibilityMedium
        #elseif os(watchOS)
        return true
        #else
        return false
        #endif
    }

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        Group {
            if shouldDisplayVertically {
                VStack(spacing: 0, content: content)
            } else {
                HStack(spacing: 0, content: content)
            }
        }
    }
}
