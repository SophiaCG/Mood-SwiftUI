//
//  PopupView.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 7/1/22.
//

import Foundation
import SwiftUI

struct PopupView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            HStack {
                Spacer()
                
                Image(systemName: "multiply")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 25)
                    .onTapGesture {
                        show = false
                    }
            }

            Image("tongue out")
                .resizable()
                .frame(width: 100, height: 100)

            Text("Entry Added!")
                .font(
                    .system(size: 30)
                    .weight(.bold)
                )
            Text("Would you like to add another entry?")
                .font(
                    .system(size: 20)
                    .weight(.semibold)
                )
                .padding(.bottom, -40)
            
            NextButton(title: "Add Entry", color: .blue)

        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.5, alignment: .center)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(UIColor.lightGray), lineWidth: 2)
        )

    }
}
