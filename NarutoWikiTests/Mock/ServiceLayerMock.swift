//
//  ServiceLayerMock.swift
//  NarutoWikiTests
//
//  Created by Brenner on 27/12/21.
//

@testable import NarutoWiki
import Foundation

class ServiceLayerMock: ServiceLayerProtocol {
    
    var mockTypeSuccess: MockEnumTypeSuccess?
    var mockTypeError: MockEnumTypeError?
    
    func sendRequest<T>(type: T.Type, requestModel: RequestModel, completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable {
        let path = mockTypeError == nil ? mockTypeSuccess?.rawValue : mockTypeError?.rawValue
        Bundle(for: ServiceLayerMock.self).url(forResource: path, withExtension: "json")
        if let bundlePath = Bundle(for: ServiceLayerMock.self).url(forResource: path, withExtension: "json"),
           let data = try? Data(contentsOf: bundlePath, options: .mappedIfSafe),
           let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) {
            
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                let status = jsonResult["statusCode"] as? Int ?? 200
                guard status == 200, let responseModel = try? JSONDecoder().decode(T.self, from: data)
                else {
                    completion(.failure(.genericError))
                    return
                }
                
                completion(.success(responseModel))
            } else if let responseModel = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(responseModel))
            }
        }
        
    }
}

