//
//  ImageView.swift
//  NASAAPI
//
//  Created by Allison Tan (student LM) on 12/17/24.
//

import SwiftUI

struct ImageView: View {
    
    //@Binding var data: FetchData
    @Binding var photo: Photo
    
    var body: some View {
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
    }
}

#Preview {
    ImageView(photo: .constant(Photo()))
}
