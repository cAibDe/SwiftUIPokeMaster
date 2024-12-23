//
//  PockmonSpecies.swift
//  SwiftUIPokeMaster
//
//  Created by 张鹏 on 2023/9/9.
//

import Foundation
import SwiftUI

struct PokemonSpecies:Codable {
    struct Color: Codable {
        enum Name: String, Codable {
            case black, blue, brown, gray, green, pink, purple, red, white, yellow

            var color: SwiftUI.Color {
                return SwiftUI.Color("pokemon-\(rawValue)")
            }
        }

        let name: Name
    }
    struct Name:Codable,LanguageTextEntry {
        let language: Language
        let name:String
        
        var text :String{
            name
        }
    }
    struct FlavorTextEntry:Codable,LanguageTextEntry{
        let language: Language
        let flavorText:String
        
        var text:String{
            flavorText
        }
    }
    
    struct Genus:Codable,LanguageTextEntry {
        let language: Language
        let genus:String
        
        var text:String{
            genus
        }
    }
    
    let color:Color
    let names:[Name]
    let genera:[Genus]
    let flavorTextEntries:[FlavorTextEntry]
}
