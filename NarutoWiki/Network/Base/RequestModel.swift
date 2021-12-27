//
//  RequestModel.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import Foundation


typealias APIParams = [String : Any]?
typealias APIHeaders = [String : String]?

protocol RequestModel {

    var url: URL { get }

    var params: APIParams { get }

    var headers: APIHeaders { get }

    var method: String { get }

    var endPoint: String { get }
    
}

extension RequestModel {
    
    var baseURL: String {
        return "https://naruto-api.herokuapp.com/api/"
    }
    
    var apiVersion: String {
        return "v1"
    }
    
    var url: URL {
        return URL(string: "\(baseURL)/\(apiVersion)/\(endPoint)")!
    }
}
