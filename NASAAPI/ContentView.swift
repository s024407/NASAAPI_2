//
//  ContentView.swift
//  NASAAPI
//
//  Created by Allison Tan (student LM) on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var data = FetchData()
    
    var body: some View {
        ImageView(data:$data)
    }
}

#Preview {
    ContentView()
}
