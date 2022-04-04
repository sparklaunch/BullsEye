//
//  RoundedViews.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/04/01.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .padding()
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFillTextColor"))
            .padding()
            .background(
                Circle()
                    .fill(Color("ButtonFillBackgroundColor"))
            )
    }
}

struct PreviewView: View {
    var body: some View {
        Group {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct RoundedRectTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.regular)
            .padding()
            .overlay(
                Capsule(style: .continuous)
                    .strokeBorder(Color("ButtonColor"), lineWidth: 2)
            )
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewView()
            PreviewView()
                .preferredColorScheme(.dark)
            RoundedRectTextView(text: "200")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
