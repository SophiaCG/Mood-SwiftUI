//
//  MoodView.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/29/22.
//

import Foundation
import SwiftUI

struct MoodView: View {
    
    @State var selected: Bool = false
    let icons = ["angry", "cry", "excited", "expressionless", "happy", "sad", "sick"]
    
    var body: some View {
        
        VStack {
            
            Text("How do you feel right now?")
                .font(
                    .system(size: 30)
                    .weight(.bold)
                )
            
            VStack {
                HStack {
                    ForEach((0...3), id: \.self) { index in
                        Image(icons[index])
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding()
                            .opacity(selected ? 1.0 : 0.5)
                            .onTapGesture {
                                selected.toggle()
                            }
                    }
                }
                HStack {
                    ForEach((4...6), id: \.self) { index in
                        Image(icons[index])
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding()
                            .opacity(selected ? 1.0 : 0.5)
                            .onTapGesture {
                                selected.toggle()
                            }
                    }
                }

            }
            
            NextButton()
                .padding()
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
 */
