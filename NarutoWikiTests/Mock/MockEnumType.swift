//
//  MockEnumType.swift
//  NarutoWikiTests
//
//  Created by Brenner on 27/12/21.
//

import Foundation

enum MockEnumTypeSuccess: String {
    case fetchAllCharactersSuccess = "AllCharacters"
    case deleteCharSuccess = "DeleteCharSuccess"
}

enum MockEnumTypeError: String {
    case genericError = "GenericError"
}
