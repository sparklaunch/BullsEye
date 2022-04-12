//
//  BackgroundView.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/04/04.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing: Bool = false
    var body: some View {
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button {
                leaderboardIsShowing = true
            } label: {
                RoundedImageViewFilled(systemName: "list.dash")
            }
            .sheet(isPresented: $leaderboardIsShowing) {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing)
            }
        }
    }
}

struct NumberView: View {
    let title: String
    let text: String
    var body: some View {
        VStack {
            LabelText(text: title)
            RoundedRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
