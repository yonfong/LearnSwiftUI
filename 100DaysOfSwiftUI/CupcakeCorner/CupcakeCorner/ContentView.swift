//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by sky on 2024/3/8.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    
    
    var body: some View {
        List(results, id: \.trackId) { item in
            HStack {
//                AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                    image
//                     .resizable()
//                     .scaledToFit()
//                } placeholder: {
////                    Color.red
//                    ProgressView()
//                }
//                .frame(width:100, height:100)
                AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("there was an error")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 100, height: 100)
                VStack(alignment: .leading, content: {
                    Text(item.trackName)
                        .font(.headline)
                    
                    Text(item.collectionName)
                })
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            debugPrint("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            
        } catch {
            debugPrint("Invalid data")
        }
    }
    
}

#Preview {
    ContentView()
}
