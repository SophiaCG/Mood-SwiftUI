//
//  TimeView.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 7/1/22.
//

import Foundation
import SwiftUI

struct TimeView: View {
    
    @State var wakeUpTime = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
    @State var sleepTime = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
    
    var body: some View {
        
        VStack {
            
            VStack(spacing: 25) {
                DatePicker("What time do you usually wake up?", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                    .font(
                        .system(size: 16)
                        .weight(.heavy)
                    )

                DatePicker("What time do you usually go to sleep?", selection: $sleepTime, displayedComponents: .hourAndMinute)
                    .font(
                        .system(size: 15)
                        .weight(.heavy)
                    )
            }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.6)
            
            Spacer()
            
            Button {

                print("Wake up time: \(wakeUpTime)")
                print("Sleep time: \(sleepTime)")
                print("Result: \(sleepTime.timeIntervalSince(wakeUpTime) / 3600)")
            } label: {
                Text("Submit")
                    .font(
                        .system(size: 22)
                        .weight(.bold)
                    )
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.03)
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }.frame(width: 100, height: 200)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
