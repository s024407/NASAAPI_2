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
        SwapView(data:$data)
    }
}

#Preview {
    ContentView()
}
