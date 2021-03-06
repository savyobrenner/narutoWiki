//
//  ServiceLayerProtocol.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import Foundation

protocol ServiceLayerProtocol {
    func sendRequest<T: Codable>(type: T.Type, requestModel: RequestModel, completion: @escaping (Result<T, ErrorModel>) -> Void)
}
