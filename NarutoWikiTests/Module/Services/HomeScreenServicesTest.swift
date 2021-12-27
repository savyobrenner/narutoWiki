//
//  HomeScreenServices.swift
//  NarutoWikiTests
//
//  Created by Brenner on 27/12/21.
//

import XCTest
@testable import NarutoWiki

class HomeScreenServicesTests: XCTestCase {
    
    private var services: HomeScreenServicesProtocol?
    
    func setupHomeScreenServices(mockSuccess: MockEnumTypeSuccess? = nil, mockError: MockEnumTypeError? = nil) -> HomeScreenServices {
        let serviceLayerMock = ServiceLayerMock()
        serviceLayerMock.mockTypeSuccess = mockSuccess
        serviceLayerMock.mockTypeError = mockError
        let service = HomeScreenServices(serviceLayer: serviceLayerMock)
        return service
    }
    
    func testShouldReturnGenericErrorWhenFetchAllCharacters() {
        services = setupHomeScreenServices(mockError: .genericError)
        services?.fetchAllCharacters(completion: { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssert(error == ErrorModel.genericError)
            }
        })
    }
    
    func testShouldReturnSuccessWhenFetchAllCharacters() {
        services = setupHomeScreenServices(mockSuccess: .fetchAllCharactersSuccess)
        services?.fetchAllCharacters(completion: { result in
            switch result {
            case .success(let characters):
                XCTAssert(characters.first?.name == "Akatsuchi")
            case .failure:
                XCTFail()
            }
        })
    }
}

