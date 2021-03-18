//
//  LineStatusUpdate.swift
//  Shared
//
//  Created by alexis on 16/03/21.
//

import Foundation

public struct LineStatusUpdate: Identifiable, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case line = "name"
        case statuses = "lineStatuses"
    }
    public let id: String
    let line: Line
    let statuses: [StatusUpdate]
    
    public init(line: Line) {
        self.id = line.rawValue.lowercased()
        self.line = line
        self.statuses = []
    }
}
