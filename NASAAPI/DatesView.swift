//
//  DatesView.swift
//  NASAAPI
//
//  Created by Allison Tan (student LM) on 12/17/24.
//

import SwiftUI

struct DatesView: View {
    
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Date", selection: $date, displayedComponents: [.date])
            .datePickerStyle(.graphical)
        
//        print(date.formatted())
    }
}

#Preview {
    DatesView()
}
