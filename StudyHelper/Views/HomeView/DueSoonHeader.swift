//
//  DueSoonHeader.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import SwiftUI

enum NumDays: String {
    case oneDay = "One Day"
    case threeDays = "Three Days"
    case oneWeek = "One Week"
    case twoWeeks = "Two Weeks"
    case oneMonth = "One Month"
}

struct DueSoonHeader: View {
    @Binding var selectedNumDays: NumDays
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("Due Soon")
                    .font(.title2)
                    .fontWeight(.semibold)
                /*Text("Assignments due within the next week.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)*/
            }
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                Picker("Span", selection: $selectedNumDays) {
                    Text("One Day").tag(NumDays.oneDay)
                    Text("Three Days").tag(NumDays.threeDays)
                    Text("One Week").tag(NumDays.oneWeek)
                    Text("Two Weeks").tag(NumDays.twoWeeks)
                    Text("One Month").tag(NumDays.oneMonth)
                }
                .pickerStyle(MenuPickerStyle())
                Image(systemName: "chevron.down")
            }
            .font(.caption)
            
            
            /*Menu(content: {
                
            }, label: {
                Text("Next 7 Days")
            })*/
        }
    }
}

struct DueSoonHeader_Previews: PreviewProvider {
    static var previews: some View {
        DueSoonHeader(selectedNumDays: .constant(.oneWeek))
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
