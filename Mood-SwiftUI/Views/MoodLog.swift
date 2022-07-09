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
