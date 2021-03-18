//
//  StatusView.swift
//  Shared
//
//  Created by alexis on 17/03/21.
//

import SwiftUI

struct StatusView: View {
    let status: StatusUpdate

    init(status: StatusUpdate) {
        self.status = status
    }

    public var body: some View {
        HStack(spacing: 4) {
            Image(systemName: status.type.iconName)
                .foregroundColor(status.type.color)
                .accessibility(hidden: true)
            Text(status.type.rawValue)
                .font(.subheadline)
            Spacer()
        }
        .padding(.vertical, 0)
        .padding(.leading, 8)
        .padding(.trailing, 16)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(status: StatusUpdate(id: 0, type: .goodService, reason: "Good Service"))
    }
}
