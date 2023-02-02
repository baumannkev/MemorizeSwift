//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kevin Baumann Nery Huerta on 2023-01-26.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject{
    static let vehicleEmojis = ["🚗", "🚕","🚙","🚌","🏎","🚑","🚎", "🚓", "🚒"]
    
    static func createMemoryGame()-> MemoryGame<String>{
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            vehicleEmojis[pairIndex]
        }
    }
    
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    // MARK - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
