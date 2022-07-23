//
//  MoodLog.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/29/22.
//

import Foundation
import SwiftUI

struct MoodLog: View {
    
    // Core Data
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.date, ascending: true)])
    var entryData: FetchedResults<Item>
    @State var show: Bool = false
    @Environment(\.managedObjectContext) var context

    var body: some View {
        
        ScrollView {
            
            VStack {
                Text("Mood Log")
                    .font(
                        .system(size: 40)
                        .weight(.heavy)
                    ).frame(width: UIScreen.main.bounds.width * 0.85, height: 65, alignment: .leading)

                ForEach(entryData, id: \.self) { entry in
                    
                    ZStack {
                        VStack {
                            MoodEntry(entry: entry)
                        }
                        .onLongPressGesture {
                            show.toggle()
                        }
                        
                        if show {
                            VStack {
                                HStack {
                                    Spacer()
                                    DeleteButton(entryData: entry)
                                }
                                Spacer()
                            }
                        }
                    }


                }.padding(10)
            }
        }
    }
}

struct MoodEntryList_Previews: PreviewProvider {
    static var previews: some View {
        MoodLog()
    }
}
