//
//  ActivityView.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/29/22.
//

import Foundation
import SwiftUI

struct ActivityView: View {
    
    @State var selected: Bool = false
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let icons = ["cleaning", "cooking", "date", "drinking", "drugs", "eating", "family", "gaming", "gardening", "going to sleep", "listening to music", "make-up", "painting", "partying", "pet", "reading", "shopping", "singing", "traveling", "waking up", "watching tv", "working out", "working", "yoga"]
    
    var body: some View {
        
        
        VStack {
                
                Text("What are you doing right now?")
                    .font(
                        .system(size: 28)
                        .weight(.heavy)
                    )
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach((0...icons.count - 1), id: \.self) {
                        Image(icons[$0 % icons.count])
                            .resizable()
                            .frame(width: 70, height: 70)
                            .opacity(selected ? 1.0 : 0.5)
                            .onTapGesture {
                                selected.toggle()
                            }
                    }
                }
            
            Spacer()
            
            NextButton()
                .frame(width: 100, height: 200)
        }.padding()
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}

/*
 https://icons8.com/icon/mGrYDqGfpwkK/alcoholic-drink
 https://icons8.com/icon/fm0EPfVVG1Lw/breakfast
 https://icons8.com/icon/Zc2Cnk7xhUf3/businessman
 https://icons8.com/icon/ynv4M305NjY6/camping
 https://icons8.com/icon/roYtbutJemtg/cleaner
 https://icons8.com/icon/yAckiMYWhreH/confetti
 https://icons8.com/icon/IWzzg8dnVs6b/cooking
 https://icons8.com/icon/sh1zXqbLK8tN/dinner
 https://icons8.com/icon/EQqofDxo7m4I/drugs
 https://icons8.com/icon/79tKqlCTpqPS/family
 https://icons8.com/icon/M1czUyNdJlIF/growing-seed
 https://icons8.com/icon/2yMI5OE5C7Ag/gym
 https://icons8.com/icon/yQLoQn9gZs4x/make-up
 https://icons8.com/icon/tSoRfrg2GV50/microphone
 https://icons8.com/icon/9eCJdw9KXzaS/music
 https://icons8.com/icon/8SONYx91bzGi/painter
 https://icons8.com/icon/BgmYVMe4dO18/pet
 https://icons8.com/icon/L3enOQ3YQ2YH/plane-ticket
 https://icons8.com/icon/Qw4r3TXfByru/reading
 https://icons8.com/icon/PFDmMpYNTVpU/shopping-bag
 https://icons8.com/icon/VQ5C7wRmQcVz/sleep
 https://icons8.com/icon/wKMkGw6OXFuG/videogame
 https://icons8.com/icon/TuQptdlGzJwR/wake-up
 https://icons8.com/icon/jZzCOfUFc5mB/watching-tv
 https://icons8.com/icon/IagCf9HzupfN/yoga
 */
