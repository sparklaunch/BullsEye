//
//  TextViews.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/04/01.
//

import SwiftUI

struct InstructionText: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .kerning(2)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    let target: Int
    var body: some View {
        Text(String(target))
            .kerning(-1)
            .fontWeight(.black)
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InstructionText(text: "🏈🏈🏈\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            BigNumberText(target: 50)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}