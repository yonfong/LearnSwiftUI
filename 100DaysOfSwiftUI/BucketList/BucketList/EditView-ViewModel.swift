//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by sky on 2024/3/17.
//

import Foundation
import Observation
//import MapKit

extension EditView {
    @Observable
    class ViewModel {
        let location: Location
        var name: String
        var description: String
        
        var loadingState = LoadingState.loading
        var pages = [Page]()
        
        init(location: Location, name: String, description: String, loadingState: LoadingState = LoadingState.loading, pages: [Page] = [Page]()) {
            self.location = location
            self.name = name
            self.description = description
            self.loadingState = loadingState
            self.pages = pages
        }
        
//        init(name: String, description: String, loadingState: LoadingState = LoadingState.loading, pages: [Page] = [Page]()) {
//            self.name = name
//            self.description = description
//            self.loadingState = loadingState
//            self.pages = pages
//        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url
                    = URL(string: urlString) else {
                        print("bad url: \(urlString)")
                        return
                    }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let items = try JSONDecoder().decode(Result.self, from: data)
                
                pages = items.query.pages.values.sorted()
                
                loadingState = .success
            } catch {
                loadingState = .failed
            }
        }
        
    }
    
}
