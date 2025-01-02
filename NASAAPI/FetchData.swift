//
//  FetchData.swift
//  NASAAPI
//
//  Created by Griffin Schlabach (student LM) on 1/2/25.
//

import Foundation

struct FetchData {
    
    var response:Response = Response()
    
    mutating func getData() async {
        
        let URLString = "https://api.nasa.gov/planetary/apod?start_date=2024-12-24&end_date=2024-12-31&api_key=l83gOnig610oKVnBAZIT33oL2oPlWMAOMC51aQ5T"
        
        guard let url = URL(string:URLString) else {return}
        guard let (data, _) = try? await URLSession.shared.data(from:url) else {return}
        
        guard let r = try? JSONDecoder().decode(Response.self, from:data) else {return}
        response = r
        
    }
}

struct Response: Codable {
    var photos:[Photo] = []
}

struct Photo: Codable {
    var date:String?
    var title:String?
    var url:String?
}


extension Photo : Identifiable {
    var id:String {url ?? " "}
    var urlToImage:URL? {
        if let imgSrc = url {
            return URL(string: imgSrc)
        }
        return nil
    }
    
}

