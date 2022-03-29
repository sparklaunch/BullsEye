//
//  ContentView.swift
//  Shared
//
//  Created by Jinwook Kim on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlertVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    var body: some View {
        VStack {
            Text("🏈🏈🏈\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1)
                .fontWeight(.black)
                .font(.largeTitle)
            HStack {
                Text("1")
                    .bold()
                    .font(.body)
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                    .bold()
                    .font(.body)
            }
            Button(action: {
                self.isAlertVisible = true
            }) {
                Text("Hit Me!!")
            }
            .alert("Hello, there!", isPresented: $isAlertVisible) {
                Button("Awesome!") {}
            } message: {
                let roundedSliderValue: Int = Int(self.sliderValue.rounded())
                Text("The slider value is \(sliderValue), and the rounded one is \(roundedSliderValue).")
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
