//
//  EditView.swift
//  BucketList
//
//  Created by sky on 2024/3/17.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    var location: Location
//    @State private var name: String
//    @State private var description: String
//    
//    @State private var loadingState = LoadingState.loading
//    @State private var pages = [Page]()
    
    var onSave:(Location) -> Void
    
    @State private var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Place descripiton", text: $viewModel.description)
                }
                
                Section("Nearby……") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading……")
                    case .success:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    
                    
                    onSave(newLocation)
                    
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        let model = ViewModel(location: location, name: location.name, description: location.description)
        _viewModel = State(initialValue: model)
        
//        _name = State(initialValue: location.name)
//        _description = State(initialValue: location.description)
    }
    
//    func fetchNearbyPlaces() async {
//        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
//        
//        guard let url
//                = URL(string: urlString) else {
//                    print("bad url: \(urlString)")
//                    return
//                }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            
//            let items = try JSONDecoder().decode(Result.self, from: data)
//            
//            pages = items.query.pages.values.sorted()
//            
//            loadingState = .success
//        } catch {
//            loadingState = .failed
//        }
//    }
}

#Preview {
    EditView(location: .example) { _ in }
}
