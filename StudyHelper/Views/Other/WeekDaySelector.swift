//
//  WeekDaySelector.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct WeekDaySelector: View {
    @Binding var selectedDays: [Bool]
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Select Days")
                    .fontWeight(.light)
                    .font(.caption)
                    .foregroundColor(.secondary)
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 20) {
                        ToggleButton(text: "Sun") {
                            selectedDays[0].toggle()
                        }
                        ToggleButton(text: "Mon") {
                            selectedDays[1].toggle()
                        }
                        ToggleButton(text: "Tue") {
                            selectedDays[2].toggle()
                        }
                        ToggleButton(text: "Wed") {
                            selectedDays[3].toggle()
                        }
                        ToggleButton(text: "Thu") {
                            selectedDays[4].toggle()
                        }
                        ToggleButton(text: "Fri") {
                            selectedDays[5].toggle()
                        }
                        ToggleButton(text: "Sat") {
                            selectedDays[6].toggle()
                        }
                    }
                }
            }
            Spacer()
            Image(systemName: "calendar")
                .frame(width: 40, height: 40)
                .font(.caption)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(10.0)
                .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
        }
        /*.padding(20)
        .background(Color.myTertiaryBackground)
        .cornerRadius(10.0)*/
    }
}

struct WeekDaySelector_Previews: PreviewProvider {
    static var previews: some View {
        let days = [false, false, false, false, false, false, false]
        WeekDaySelector(selectedDays: .constant(days))
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
