//
//  DatesView.swift
//  NASAAPI
//
//  Created by Allison Tan (student LM) on 12/17/24.
//

import SwiftUI

struct DatesView: View {
    
    @State private var selectedDate: Date = Date()
    @Binding var data:FetchData

        var body: some View {
            VStack(spacing: 30) {
                DatePicker("Select a Date",
                           selection: $selectedDate,
                           displayedComponents: .date)
            }
            .padding()
            
            //var date: String = selectedDate.ISO8601Format()
            
            //Text(date.removeLast(10))
            
        }
}

#Preview {
    DatesView(data:.constant(FetchData()))
}
