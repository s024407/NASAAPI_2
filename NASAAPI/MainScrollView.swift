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
        
        NavigationView {
            List($data.response) { $photo in
                NavigationLink {
                    ImageView(photo: $photo)
                } label: {
                    HStack {
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
                        }
                        .font(.title)
                        .padding([.leading, .top, .trailing], 5)
                        Text(photo.date ?? "N/A")
                            .foregroundColor(.background)
                            .font(.caption)
                    }
                }

            }
            .navigationTitle("Photos")
            .font(Constants.headerText)
            .foregroundColor(.textBlue)
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
