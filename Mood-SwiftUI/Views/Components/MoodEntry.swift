//
//  MoodEntry.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 7/8/22.
//

import Foundation
import SwiftUI

struct MoodEntry: View {
    
    let entry: Item
    @State var expand: Bool = false

    var body: some View {
        
        VStack (alignment: .leading, spacing: 13) {
            Text(entry.date ?? "")
                .font(
                    .system(size: 18)
                    .weight(.heavy)
                )

            HStack {
                ForEach(entry.moods?.prefix(5) ?? [], id: \.self) { mood in
                    Image(mood)
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                Spacer()
            }
            
            HStack {
                ForEach(entry.activities?.prefix(5) ?? [], id: \.self) { acts in
                    Image(acts)
                        .resizable()
                        .frame(width: 60, height: 60)
                }
            }
            
            ScrollView {
                Text(entry.text ?? "")
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(expand ? 100 : 2)
                    .font(
                        .system(size: 20)
                        .weight(.semibold)
                    )
            }
            
        }.frame(width: UIScreen.main.bounds.width * 0.85, height: nil)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 2)
            )
            .onTapGesture {
                expand.toggle()
            }
        
    }
}
