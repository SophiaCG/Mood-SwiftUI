//
//  NextButton.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/29/22.
//

import Foundation
import SwiftUI

struct NextButton: View {
    
    var body: some View {
        
        Button {
            print("Button pressed!")
        } label: {
            Text("Next")
                .font(
                    .system(size: 22)
                    .weight(.bold)
                )
                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.03)
                .padding()
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(15)
        }
    }
}

struct NextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextButton()
    }
}
