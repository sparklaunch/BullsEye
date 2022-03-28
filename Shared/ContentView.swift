//
//  ContentView.swift
//  Shared
//
//  Created by Jinwook Kim on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("🏈🏈🏈\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
            Text("89")
            HStack {
                Text("1")
                Slider(value: .constant(50), in: 1...100)
                Text("100")
            }
            Button(action: {}) {
                Text("Hit Me!!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
