//
//  Friend.swift
//  Friendface
//
//  Created by sebastian.popa on 1/7/24.
//

import Foundation
import SwiftData

@Model
class Friend: Codable {
    let id: UUID
    var name: String
    
    enum CodingKeys: CodingKey {
        case id, name
    }
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
