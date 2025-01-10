//
//  ImageView.swift
//  NASAAPI
//
//  Created by Allison Tan (student LM) on 12/17/24.
//

import SwiftUI

struct ImageView: View {
    
    //@Binding var data: FetchData
    var photo: Photo
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.backgroundBlue)
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .clipped()
                .ignoresSafeArea()

            VStack {
                Text(photo.title ?? "[Title]")
                    .font(Constants.headerText)
                    .foregroundColor(.textBlue)
                .bold()
                Text(photo.date ?? "[Date]")
                    .font(Constants.bodyText)
                    .foregroundColor(.textBlue)
                    AsyncImage(url: URL(string: photo.url ?? " ")) {
                        phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(10)
                                .foregroundColor(.textBlue)
                        case .failure(_):
                            Image("fnf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(10)
                                .foregroundColor(.textBlue)
                            
                        @unknown default:
                            fatalError()
                        }
                    }
            }
        }
        
        
    }
}

#Preview {
    ImageView(photo: Photo())
}

