//
//  Status+SwiftUI.swift
//  Shared
//
//  Created by alexis on 17/03/21.
//

import SwiftUI

public extension Status {
    var iconName: String {
        switch self {
        case .goodService, .noIssues:
            return "checkmark.circle.fill"
        case .information:
            return "info.circle.fill"
        default: return "exclamationmark.triangle.fill"
        }
    }

    var color: Color {
        switch self {
        case .goodService, .noIssues:
            return .green
        case .information:
            return .blue
        case .partSuspended, .minorDelays, .noStepFreeAccess, .specialService:
            return .orange
        default: return .red
        }
    }
}
