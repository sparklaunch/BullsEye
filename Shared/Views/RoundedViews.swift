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
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
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
                    .strokeBorder(Color("ButtonColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.semibold)
            .padding()
            .overlay(
                Capsule(style: .continuous)
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: 1)
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
            RoundedTextView(text: "1")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
