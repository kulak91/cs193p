//
//  CardLayoutTwo.swift
//  cs193p
//
//  Created by Binary Studio on 01.09.2024.
//

import SwiftUI


struct CardsLayoutViewTwo: View {
    
    private let emojis =  ["🤡", "☺️", "🙃", "😇", "🙏", "😂", "😎", "😏", "🎃", "👻", "👽", "🤖"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            
            cardController
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                Card(content: emojis[index])
                    .aspectRatio(1, contentMode: .fit)
            }
        }
       
    }
    
    var cardController: some View {
        HStack {
            removeCard
            Spacer()
            addCard
        }
    }
    
    var addCard: some View {
        cardControllerFactory(by: 1, symbol: "plus.square.fill")
    }
    
    var removeCard: some View {
        cardControllerFactory(by: -1, symbol: "minus.square.fill")
    }
    
    func cardControllerFactory(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        .font(.largeTitle)
        .imageScale(.large)
    }
}

struct Card: View {
    let content: String
    @State var isFlipped = false
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 25)

        ZStack {
            Group {
                base.fill(.red)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFlipped ? 0 : 1)

            base.opacity(isFlipped ? 1 : 0)
        }
        .onTapGesture {
            isFlipped = !isFlipped
        }
    }
}

#Preview {
    CardsLayoutViewTwo()
}
