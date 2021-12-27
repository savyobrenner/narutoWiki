//
//  HomeScreenServices.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import Foundation

protocol HomeScreenServicesProtocol {
    func fetchAllCharacters(completion: @escaping (Result<Character, ErrorModel>) -> Void )
}

class HomeScreenServices: HomeScreenServicesProtocol {
    
    private let serviceLayer: ServiceLayerProtocol
    
    init(serviceLayer: ServiceLayerProtocol) {
        self.serviceLayer = serviceLayer
    }
    
    func fetchAllCharacters(completion: @escaping (Result<Character, ErrorModel>) -> Void) {
        let request = CharactersRequest.fetchAllRequests
        serviceLayer.sendRequest(type: Character.self, requestModel: request) { result in
            completion(result)
        }
    }
}
