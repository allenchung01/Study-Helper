//
//  TimeSelector.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct TimeSelector: View {
    @Binding var time: Date
    var fieldName: String
    var systemImageName: String?
    var isFullDate: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            if systemImageName != nil {
                Image(systemName: systemImageName!)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(fieldName)
                    .bold()
                    .font(.caption)
                    .foregroundColor(.secondary)
                if isFullDate {
                    DatePicker(selection: $time, displayedComponents: [.date, .hourAndMinute], label: {})
                        .frame(maxWidth: 150)
                        .scaledToFit()
                        //.padding(.leading, -8)
                        .datePickerStyle(CompactDatePickerStyle())
                        .transformEffect(.init(scaleX: 0.8, y: 0.8))
                } else {
                    DatePicker(selection: $time, displayedComponents: .hourAndMinute, label: {})
                        .frame(maxWidth: 100)
                        .scaledToFit()
                        .padding(.leading, -8)
                        .datePickerStyle(CompactDatePickerStyle())
                        .transformEffect(.init(scaleX: 0.8, y: 0.8))
                }
            }
            Spacer()
        }
        .padding(20)
        .background(Color.myTertiaryBackground)
        .cornerRadius(10.0)
    }
}

struct TimeSelector_Previews: PreviewProvider {
    static var previews: some View {
        let fieldName = "Start Time"
        TimeSelector(time: .constant(Date()), fieldName: fieldName, systemImageName: "clock")
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
