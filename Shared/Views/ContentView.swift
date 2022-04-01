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
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(game: $game)
                HStack {
                    Text("1")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1...100)
                    Text("100")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color("TextColor"))
                }
                .padding()
                Button(action: {
                    self.isAlertVisible = true
                }) {
                    Text("Hit Me!!".uppercased())
                        .font(.title3)
                        .bold()
                }
                .padding(20)
                .background(ZStack {
                    Color("ButtonColor")
                    LinearGradient(colors: [.white.opacity(0.3), .clear], startPoint: .top, endPoint: .bottom)
                })
                .foregroundColor(.white)
                .cornerRadius(21)
                .alert("Hello, there!", isPresented: $isAlertVisible) {
                    Button("Awesome!") {}
                } message: {
                    let roundedSliderValue: Int = Int(self.sliderValue.rounded())
                    Text("The slide value is \(roundedSliderValue).\n" + "You scored \(self.game.points(sliderValue: roundedSliderValue)) points this round.")
                }
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "🏈🏈🏈\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.horizontal, 30)
            BigNumberText(target: game.target)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
