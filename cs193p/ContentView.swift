//
//  ContentView.swift
//  cs193p
//
//  Created by Binary Studio on 31.08.2024.
//

import SwiftUI

struct CardsLayoutView: View {
        var body: some View {
            CardGroupView()
        }
}
let emojis = [
    ["🤡", "☺️", "🙃", "😇"],
    ["🙏", "😂", "😎", "😏"],
    ["🎃", "👻", "👽", "🤖"]
    ]

struct CardGroupView: View {
    var body: some View {
        Grid {
            ForEach(emojis.indices, id: \.self) { i in
                CardRowView(emojis: emojis[i])
            }
        }
        .padding(25)
    }
}

struct CardRowView: View {
    let emojis: Array<String>
    var reversed = false
    
    var body: some View {
        GridRow {
//            List(emojis, id: \.self) { emoji in
//                CardView(content: emoji)
//            }
            ForEach(emojis.indices, id: \.self) {i in
                let odd = (i % 2) != 0
                CardView(content: emojis[i], isFaceUp: (reversed == false) ? odd: !odd)
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        let base = RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
        let size: CGFloat = 80
        
            ZStack {
                if isFaceUp {
                    base.fill(.cyan)
                        .frame(maxWidth: size, maxHeight: size)
                    base.fill(.white).padding(4)
                        .frame(maxWidth: size, maxHeight: size)
                    Text(content).font(.largeTitle)
                } else {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.cyan)
                        .strokeBorder(.mint, lineWidth: 4)
                        .frame(maxWidth: size, maxHeight: size)
                }
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
    }
}



//struct EcgPlot: View {
//    var body: some View {
//        Path
//    }
//}





//#Preview {
//    CardsLayoutView()
//}
