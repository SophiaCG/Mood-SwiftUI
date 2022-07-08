//
//  Model.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 7/3/22.
//

import Foundation

class Entry: Identifiable {
    
    var date: String
    var moods: [String]
    var activities: [String]
    var text: String
    
    init(date: String, moods: [String], activities: [String], text: String) {
        self.date = ""
        self.moods = []
        self.activities = []
        self.text = ""
    }
}
