//
//  PointsView.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/04/07.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var isAlertVisible: Bool
    var body: some View {
        let roundedValue: Int = Int(sliderValue.rounded())
        let points: Int = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is".uppercased())
            BigNumberText(target: roundedValue)
            BodyText(text: "You scored \(points) points\n🍺🍺🍺")
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: .zero)) {
                    game.nextRound()
                    isAlertVisible = false
                }
            } label: {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PointsView(game: .constant(Game()), sliderValue: .constant(30), isAlertVisible: .constant(true))
            PointsView(game: .constant(Game()), sliderValue: .constant(30), isAlertVisible: .constant(true))
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
