//
//  Card.swift
//  Flashzilla
//
//  Created by JD on 03/07/20.
//

import Foundation

struct Card: Codable {
    
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
    
}
