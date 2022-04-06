//
//  PointsView.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/04/07.
//

import SwiftUI

struct PointsView: View {
    let game: Game
    let sliderValue: Int
    var body: some View {
        VStack {
            InstructionText(text: "The slider's value is".uppercased())
            BigNumberText(target: sliderValue)
            BodyText(text: "You scored \(game.points(sliderValue: sliderValue)) points\n🍺🍺🍺")
            ButtonText(text: "Start New Round")
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
            PointsView(game: Game(), sliderValue: 30)
            PointsView(game: Game(), sliderValue: 30)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
