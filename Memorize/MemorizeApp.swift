//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kevin Baumann Nery Huerta on 2023-01-10.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
