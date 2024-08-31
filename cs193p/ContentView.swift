//
//  ContentView.swift
//  cs193p
//
//  Created by Binary Studio on 31.08.2024.
//

import SwiftUI

struct CardsLayout: View {
        var body: some View {
            Cards()
        }
}

struct Cards: View {
    var body: some View {
        Grid {
            CardRow()
            CardRow()
            CardRow()
        }.padding(25)
    }
}

struct CardRow: View {
    var body: some View {
        GridRow {
            ForEach(1...4, id: \.self) {i in
                let odd = (i & 2) != 0
                
                Card(isFaceUp: odd)
            }
        }
    }
}

struct Card: View {
    @State var isFaceUp = false
    
    var body: some View {
        var base = RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
            ZStack {
                if isFaceUp {
                    base.fill(.cyan)
                    base.fill(.white).padding(4)
                    Text("🥰").font(.largeTitle)
                } else {
                    RoundedRectangle(cornerRadius: 25.0).fill(.cyan).strokeBorder(.mint, lineWidth: 4)
                }
            }.onTapGesture {
                isFaceUp.toggle()
            }
        Spacer()
    }
}




#Preview {
    CardsLayout()
}
