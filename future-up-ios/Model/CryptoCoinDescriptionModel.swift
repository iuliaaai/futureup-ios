//
//  CryptoCoinDescriptionModel.swift
//  future-up-ios
//
//  Created by Iulia Ionascu on 04.04.2022.
//

import Foundation
import Metal

struct CryptoCoinDescriptionModel : Codable {
    let en: String
    
    init(){
        en = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case en = "en"
    }
    
}

struct Request: Identifiable, Codable{
    public var tagID = UUID().uuidString
    let description: CryptoCoinDescriptionModel
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case id = "id"
    }
    
}
