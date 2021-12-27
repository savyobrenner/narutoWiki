//
//  Character.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import Foundation

// MARK: - Character
struct Character: Codable {
    let about: [String]?
    let info: Info?
    let page: String?
    let name: String?
    let id: Int?
    let images: [String]?
}

// MARK: - Info
struct Info: Codable {
    let sex: Sex?
    let birthday, age, height, weight: String?
    let bloodType: BloodType?
    let role, affiliation, partner, ninjaLevel: String?
    let ninjaNumber, teams, geninGraduation, chuninGraduation: String?
    let status: Status?
    let kekkeiGenkai, classification, clan, biju: String?
    let specie, kekkeiMora: String?

    enum CodingKeys: String, CodingKey {
        case sex = "Sexo"
        case birthday = "Aniversário"
        case age = "Idade"
        case height = "Altura"
        case weight = "Peso"
        case bloodType = "Tipo Sanguíneo"
        case role = "Ocupação"
        case affiliation = "Afiliação"
        case partner = "Parceiro"
        case ninjaLevel = "Patente Ninja"
        case ninjaNumber = "Registro Ninja"
        case teams = "Times"
        case geninGraduation = "Graduação (Genin)"
        case chuninGraduation = "Graduação (Chūnin)"
        case status = "Estado"
        case kekkeiGenkai = "Kekkei Genkai"
        case classification = "Classificação"
        case clan = "Clã"
        case biju = "Bijū"
        case specie = "Espécie"
        case kekkeiMora = "Kekkei Mōra"
    }
}

enum Status: String, Codable {
    case unable = "Incapacitada"
    case deadF = "Morta"
    case deadM = "Morto"
    
    enum CodingKeys: String, CodingKey {
        case unable = "incapacitada"
        case deadM = "morto"
        case deadF = "morta"
    }
}

enum Sex: String, Codable {
    case female = "Feminino"
    case male = "Masculino"
    
    enum CodingKeys: String, CodingKey {
        case female = "feminino"
        case male = "masculino"
    }
}

enum BloodType: String, Codable {
    case a = "A"
    case ab = "AB"
    case b = "B"
    case o = "O"
}
