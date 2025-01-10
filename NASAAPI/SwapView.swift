//
//  SwapView.swift
//  NASAAPI
//
//  Created by Griffin Schlabach (student LM) on 1/10/25.
//

import SwiftUI

struct SwapView: View {
    
    @Binding var data:FetchData
    
    var body: some View {
        TabView {
            MainScrollView(data:$data)
                .tabItem {
                    Image(systemName:"star.fill")
                    Text("All Photos")
                }
            DatesView(data:$data)
                .tabItem {
                    Image(systemName:"person.circle.fill")
                    Text("Search")
                }
            
        }
    }
}

#Preview {
    SwapView(data:.constant(FetchData()))
}
