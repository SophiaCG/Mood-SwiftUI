//
//  MoodView.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/29/22.
//

import Foundation
import SwiftUI

struct MoodView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    let icons = ["angry", "cry", "dead", "excited", "expressionless", "happy", "laughing", "love", "money", "sad", "screaming", "sick"]
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        
        NavigationView {
            VStack {
                
                Text("How do you feel right now?")
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .font(
                        .system(size: 30)
                        .weight(.heavy)
                    ).padding(.top, -100)

                LazyVGrid(columns: gridItemLayout, spacing: 30) {
                    ForEach(0..<icons.count, id: \.self) { index in
                        Image(icons[index % icons.count])
                            .resizable()
                            .frame(width: 90, height: 90)
                            .opacity(viewModel.checkMoods(mood: icons[index]) ? 1.0 : 0.5)
                            .onTapGesture {
                                viewModel.addDeleteMood(mood: icons[index])
                            }
                    }
                }
                
                NavigationLink(destination: ActivityView()) {
                    NextButton(title: "Next", color: .green)
                }.frame(width: 100, height: 150)

                Spacer()

            }
        }
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}

/*
    https://icons8.com/icon/YKhdOlQabdPm/happy
    https://icons8.com/icon/iqegqdKCm1cY/expressionless
    https://icons8.com/icon/3P9KXjeDmrwq/sick
    https://icons8.com/icon/UXFfntcmxI6D/sad
    https://icons8.com/icon/ijssXEEKWGDD/angry
    https://icons8.com/icon/nzOQRkd6DOrH/excited
    https://icons8.com/icon/yv4gde5cPKjD/cry
    https://icons8.com/icon/KXnVuvuwyA07/love
    https://icons8.com/icon/zfQgglhv5aYR/dead
    https://icons8.com/icon/4mLECQKqr9zm/laughing
    https://icons8.com/icon/YjafSVbIWRSH/screaming
    https://icons8.com/icon/j9l6X86yD8yJ/money
    https://icons8.com/icon/JLdBk3w9zKZ2/tongue-out
 */
