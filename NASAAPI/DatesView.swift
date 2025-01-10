//
//  DatesView.swift
//  NASAAPI
//
//  Created by Allison Tan (student LM) on 12/17/24.
//

import SwiftUI

struct DatesView: View {
    
    @State var selectedDate: Date = Date()
    @State var showSheet:Bool = false
    @Binding var data:FetchData
    
    
    var body: some View {
        
        @State var datePassed: String = String(selectedDate.ISO8601Format().prefix(10))
        
        VStack {
            VStack(spacing: 30) {
                DatePicker("Select a Date",
                           selection: $selectedDate,
                           displayedComponents: .date)
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Search")
                        .font(Constants.bodyText)
                        .foregroundColor(.background)
                }
            }
            .padding(20)
            .sheet(isPresented: $showSheet, content: {
                ImageView(photo: findPhoto(photos:data.response, date:datePassed))
            })
            
            
            
            //Text(datePassed)
        }
        
        
        
    }
}

#Preview {
    DatesView(data:.constant(FetchData()))
}


//intake date and array, find index, return photo
