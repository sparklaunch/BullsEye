//
//  LeaderboardView.swift
//  BullsEye (iOS)
//
//  Created by Jinwook Kim on 2022/04/12.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                RowView(index: 1, score: 10, date: Date())
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(text: String(10))
            Spacer()
            DateText(date: date)
        }
        .padding(.trailing)
        .background(
            RoundedRectangle(cornerRadius: .infinity, style: .continuous)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                }
                else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack {
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 56)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColumnWidth)
        }
        .padding(.trailing, 32)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LeaderboardView(leaderboardIsShowing: .constant(false))
            LeaderboardView(leaderboardIsShowing: .constant(false))
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
