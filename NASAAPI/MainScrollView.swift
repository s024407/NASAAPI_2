//
//  MainScrollView.swift
//  NASAAPI
//
//  Created by Griffin Schlabach (student LM) on 1/7/25.
//

import SwiftUI

struct MainScrollView: View {
    
    @Binding var data:FetchData
    
    var body: some View {
        
        ScrollView {
            
            ForEach(data.response)  { photo in

                HStack {
                    VStack {
                        AsyncImage(url: URL(string: photo.url ?? " ")) {
                            phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure(_):
                                Image("fnf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            @unknown default:
                                fatalError()
                            }
                        }.padding()
                    }
                    
                    //Text(photo.date ?? " ")
                     //   .padding([.trailing, .top], 5)
                    
                    
                }
            }
        }
        .task {
            await data.getData()
            print(data.response.count)
        }
    }
}

#Preview {
    MainScrollView(data: .constant(FetchData()))
}
