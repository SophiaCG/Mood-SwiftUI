//
//  TextBox.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/30/22.
//

import Foundation
import SwiftUI

struct TextBox: View {
    
    @Environment(\.managedObjectContext) var context

    @EnvironmentObject var viewModel: ViewModel
    @State private var text: String = ""
    @State private var show: Bool = false

    var body: some View {
        
        ZStack {
                        
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
                
                NextButton(title: "Complete", color: .purple)
                    .onTapGesture {
                        withAnimation(.easeInOut) { show = true }
                        print(viewModel.moods)
                        saveEntry(entry: Entry(date: Date.now, moods: viewModel.moods, activities: viewModel.activities, text: text))
                    }
            }
            
            if show {
                PopupView(show: $show)
            }
        }
    }
    
    // Adds recipe to Core Data
    private func saveEntry(entry: Entry) {

        let entryData = Item(context: context)
        
        entryData.date = entry.date
        entryData.moods = entry.moods
        entryData.activities = entry.activities
        entryData.text = entry.text
        print("SAVED DATA: \(entryData)")
        try? context.save()
    }
}

struct TextBox_Previews: PreviewProvider {
    static var previews: some View {
        TextBox()
    }
}
