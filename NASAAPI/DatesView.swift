//
//  DatesView.swift
//  NASAAPI
//
//  Created by Allison Tan (student LM) on 12/17/24.
//

import SwiftUI

struct DatesView: View {
    
    @State var selectedDate: Date = Date()
    @Binding var data:FetchData
    
    
    var body: some View {
        VStack(spacing: 30) {
            DatePicker("Select a Date",
                       selection: $selectedDate,
                       displayedComponents: .date)
        }
        .padding()
        
        //            var date: String = String(selectedDate.ISO8601Format().prefix(10))
        //            Text(date)
        
        @State var datePassed: String =  String(selectedDate.ISO8601Format().prefix(10))
        
        Text(datePassed)
        
    }
}

#Preview {
    DatesView(data:.constant(FetchData()))
}
