//
//  ContentView.swift
//  cs193p
//
//  Created by Binary Studio on 31.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Cards()
    }
}

struct Cards: View {
    var body: some View {
        Grid {
            ForEach(1...5, id: \.self) {_ in
                Card().frame(width: 100)
            }
           
        }
        .padding()
    }
}

struct Card: View {
    var body: some View {
        ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/ ) {
            RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/).fill(.cyan)
            RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/).fill(.white).padding(4)
            Text("🥰").font(.largeTitle)
        }
        Spacer()
    }
}




#Preview {
    ContentView()
}
