//
//  TemplateCourseGridCell.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/29/21.
//

import SwiftUI

struct TemplateCourseGridCell: View {
    var name: String
    var systemImageName: String
    var days: [Bool]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 3) {
                
                Image(systemName: systemImageName)
                    .font(.caption)
                    .frame(width: 40, height: 40)
                    .background(Color.myComplementaryColor)
                    .cornerRadius(10.0)
                
                Spacer()
                HStack(alignment: .center, spacing: 10) {
                    Text(name)
                        .bold()
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    days[0] == true ? Text("Sun").fontWeight(.light) : nil
                    days[1] == true ? Text("Mon").fontWeight(.light) : nil
                    days[2] == true ? Text("Tue").fontWeight(.light) : nil
                    days[3] == true ? Text("Wed").fontWeight(.light) : nil
                    days[4] == true ? Text("Thu").fontWeight(.light) : nil
                    days[5] == true ? Text("Fri").fontWeight(.light) : nil
                    days[6] == true ? Text("Sat").fontWeight(.light) : nil
                }
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
            }
        }
        .padding(30)
        .frame(height: 180, alignment: .bottomLeading)
        .background(Color.myPrimaryBackground)
        .cornerRadius(20.0)
        .background(
            Color.myTertiaryBackground
                .cornerRadius(20.0)
                .padding(10)
                .offset(x: 0, y: -20)
        )
        .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
        
    }
}

struct TemplateCourseGridCell_Previews: PreviewProvider {
    static var previews: some View {
        TemplateCourseGridCell(name: "CS 255", systemImageName: "laptop.computer", days: [true, true, false, false, false, false, false])
    }
}
