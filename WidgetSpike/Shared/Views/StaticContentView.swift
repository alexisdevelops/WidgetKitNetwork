//
//  StaticContentView.swift
//  Shared
//
//  Created by alexis on 17/03/21.
//

import SwiftUI

public struct StaticContentView: View {
    private let updates: [LineStatusUpdate]

    public init(updates: [LineStatusUpdate]) {
        self.updates = updates
    }

    public var body: some View {
        GeometryReader { metrics in
            ContentView(updates: updates)
                .frame(width: metrics.size.width,
                       height: metrics.size.height)
        }
    }
}

struct FixedHeightContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(updates: [])
    }
}
