//
//  TextBox.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/30/22.
//

import Foundation
import SwiftUI

struct TextBox: View {
    
    @State private var text: String = ""

    var body: some View {
        
        VStack {
            Text("Would you like to write about why you feel this way? (optional)")
                .font(
                    .system(size: 25)
                    .weight(.heavy)
                )
                .frame(width: UIScreen.main.bounds.width * 0.93, height: 125)
            
            ZStack {
                
                VStack {
                    TextEditor(text: $text)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.3, alignment: .top)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }
                
                VStack {
                    Text(text.isEmpty ? "Today was blah..." : "")
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.245, alignment: .topLeading)
                        .foregroundColor(.gray)
                }
            }

            
            Spacer()
            
            Button {
                print("Button pressed!")
            } label: {
                Text("Complete")
                    .font(
                        .system(size: 22)
                        .weight(.bold)
                    )
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.03)
                    .padding()
                    .background(.purple)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }.frame(width: 100, height: 200)
        }
    }
}

struct TextBox_Previews: PreviewProvider {
    static var previews: some View {
        TextBox()
    }
}
