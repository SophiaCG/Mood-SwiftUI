//
//  ContentView.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 6/29/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        TabView {

            MoodLog()
                .tabItem {
                    Label("Mood Log", systemImage: "list.bullet")
                }
            MoodView()
                .environmentObject(viewModel)
                .tabItem {
                    Label("Entry", systemImage: "plus")
                }
            TimeView()
                .tabItem {
                    Label("Time", systemImage: "clock.fill")
                }

        }
    }
}
