//
//  CharactersRequest.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import Foundation

enum CharactersRequest: RequestModel {
    
case fetchAllRequests
    
    var params: APIParams {
        return nil
    }
    
    var headers: APIHeaders {
        return nil
    }
    
    var method: String {
        switch self {
        case .fetchAllRequests: return "GET"
        }
    }
    
    var endPoint: String {
        switch self {
        case .fetchAllRequests: return "/characters"
        }
    }
}
