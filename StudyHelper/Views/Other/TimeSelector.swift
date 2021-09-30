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
            VStack(alignment: .leading, spacing: 10) {
                Text(fieldName)
                    .fontWeight(.light)
                    .font(.caption)
                    .foregroundColor(.secondary)
                if isFullDate {
                    DatePicker(selection: $time, displayedComponents: [.date, .hourAndMinute], label: {})
                        .frame(maxWidth: 150)
                        .scaledToFit()
                        //.padding(.leading, -8)
                        .datePickerStyle(CompactDatePickerStyle())
                        .transformEffect(.init(scaleX: 0.8, y: 0.8))
                        .font(.body.weight(.semibold))
                        .offset(x: 22, y: 0)
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
            if systemImageName != nil {
                Image(systemName: systemImageName!)
                    .frame(width: 40, height: 40)
                    .font(.caption)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
            }
        }
        /*.padding(20)
        .background(Color.myTertiaryBackground)
        .cornerRadius(10.0)*/
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
