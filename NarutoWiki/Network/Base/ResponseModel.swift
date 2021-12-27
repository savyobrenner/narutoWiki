//
//  ResponseModel.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
    
    // MARK: - Properties
    var object: T?
    
    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        object = try? keyedContainer.decode(T.self, forKey: CodingKeys.object)
    }
}
