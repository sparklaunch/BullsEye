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
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    private var sliderOffset: Double {
        if orientation == .portrait || orientation == .portraitUpsideDown {
            return -22.5
        }
        else {
            return -12.5
        }
    }
    var body: some View {
        ZStack {
            RingsView()
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                .padding()
                HitMeButton(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
            }
            .offset(y: sliderOffset)
        }
        .onAppear {
            orientation = UIDevice.current.orientation
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

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1...100)
            SliderLabelText(text: "100")
        }
    }
}

struct HitMeButton: View {
    @Binding var isAlertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        Button(action: {
            isAlertVisible = true
            let wonPoints: Int = game.points(sliderValue: Int(sliderValue.rounded()))
            game.storeScore(with: wonPoints)
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
        .overlay(
            RoundedRectangle(cornerRadius: 21)
                .strokeBorder(.white, lineWidth: 2)
        )
        .alert("Hello, there!", isPresented: $isAlertVisible) {
            Button("Awesome!") {
                game.nextRound()
            }
        } message: {
            let roundedSliderValue: Int = Int(sliderValue.rounded())
            Text("The slide value is \(roundedSliderValue).\n" + "You scored \(game.points(sliderValue: roundedSliderValue)) points this round.")
        }
    }
}

struct RingsView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    ForEach(1...10, id: \.self) { number in
                        let size: Double = Double(number * 100)
                        Circle()
                            .stroke(lineWidth: 25)
                            .fill(
                                RadialGradient(colors: [Color("PatternColor")
                                    .opacity(0.8), Color("PatternColor").opacity(.zero)], center: .center, startRadius: 100, endRadius: 500)
                            )
                            .frame(width: size, height: size)
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
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
