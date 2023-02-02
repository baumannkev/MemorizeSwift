//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Baumann Nery Huerta on 2023-01-10.
//
//@State var emojis = ["🚗", "🚀", "🌋", "🚂", "⚽️", "🏀", "🎾", "🥵", "👺", "😈", "💀", "👽", "💩","🤠", "☠️", "✊", "🦾", "🪙", "🪛", "💰", "📀", "⏰", "🛢", "💡", "🖲"]
//var vehicleEmojis = ["🚗", "🚕","🚙","🚌","🏎","🚑","🚎", "🚓", "🚒"]
//var foodEmojis = ["🍏", "🍎","🍐","🍊","🍋","🍌","🍉", "🍇", "🥨", "🥖"]
//var sportEmojis = ["⚽️", "🏀","🏈","⚾️","🥎","🎾","🏐", "🏉", "🎱", "🏓", "🏒"]
//@State var emojiCount = 5z
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            Text("Memorize!")
                
            ScrollView{
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum:70))]){
                    //let random = Int.random(in: 4...emojis.count)
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    }.foregroundColor(.red)
                }
            }
            Spacer()
//            HStack{
//                vehicles
//                Spacer()
//                food
//                Spacer()
//                sport
//
//            }
//
//            .padding(.horizontal)
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
//    var vehicles: some View {
//        Button {
//            emojis = vehicleEmojis
//            emojis.shuffle()
//        } label: {
//            VStack {
//                Image(systemName: "car")
//                Text("Vehicles")
//                    .font(.body)
//            }
//        }
//    }
//    var food: some View {
//        Button {
//            emojis = foodEmojis
//            emojis.shuffle()
//        } label: {
//            VStack {
//                Image(systemName: "hare")
//                Text("Food").font(.body)
//            }
//        }
//    }
//    var sport: some View {
//        Button {
//            emojis = sportEmojis
//            emojis.shuffle()
//        } label: {
//            VStack {
//                Image(systemName: "sportscourt")
//                Text("Sport")
//                    .font(.body)
//            }
//        }
//    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle).fontWeight(.bold)
            } else {
                shape.fill()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
                .preferredColorScheme(.light)
    }
    
}
