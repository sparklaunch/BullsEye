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

struct SliderLabelText: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.body)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35)
    }
}

struct LabelText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.regular)
    }
}

struct BodyText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .multilineTextAlignment(.center)
    }
}

struct ButtonText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InstructionText(text: "🏈🏈🏈\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            BigNumberText(target: 50)
            SliderLabelText(text: "100")
            LabelText(text: "Score")
            BodyText(text: "You scored 200 points.\n🍻🍻🍻")
            ButtonText(text: "Start New Round")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
