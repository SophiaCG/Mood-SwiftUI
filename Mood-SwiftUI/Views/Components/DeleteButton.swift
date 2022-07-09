//
//  DeleteButton.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 7/8/22.
//

import Foundation
import SwiftUI

struct DeleteButton: View {
    
    @Environment(\.managedObjectContext) var context
    var entryData: Item
    
    var body: some View {
        
        Button(action: {
            print("DELETE \(String(describing: entryData.text!))")
            context.delete(entryData)
            try? context.save()
        }, label: {
            Image(systemName: "trash")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
                .padding(.all, 8)
                .background(Color.red)
                .clipShape(Circle())
                .frame(width: 35, height: 35)
        })
    }
}
