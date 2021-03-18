//
//  StatusUpdate.swift
//  Shared
//
//  Created by alexis on 16/03/21.
//

import Foundation

public struct StatusUpdate: Identifiable, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case type = "statusSeverityDescription"
        case reason
    }

    public let id: Int
    public let type: Status
    let reason: String?
}
