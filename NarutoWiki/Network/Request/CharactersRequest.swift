//
//  CharactersRequest.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import Foundation

enum CharactersRequest: RequestModel {
    
    case fetchAllRequests
    case saveCharacter
    
    var params: APIParams {
        return nil
    }
    
    var headers: APIHeaders {
        return nil
    }
    
    var method: String {
        switch self {
        case .fetchAllRequests: return "GET"
        case .saveCharacter: return "PUT"
        }
    }
    
    var endPoint: String {
        switch self {
        case .fetchAllRequests: return "characters"
        case .saveCharacter: return "save/character"
        }
    }
}
