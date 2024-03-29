//
//  ContentView.swift
//  BucketList
//
//  Created by sky on 2024/3/16.
//

import SwiftUI
import MapKit
import LocalAuthentication

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading……")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

//struct Location: Identifiable {
//    let id = UUID()
//    var name: String
//    var coordinate: CLLocationCoordinate2D
//}

struct ContentView: View {
    @State private var loadingState = LoadingState.loading
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
//    ]
    
    @State private var isUnlocked = false
    
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
//    @State private var locations = [Location]()
//    
//    @State private var selectedPlace: Location?
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            if viewModel.isUnlocked {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            //                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                            
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .mapStyle(viewModel.isStandardMapStyle ? .standard : .hybrid)
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print("Tapped at \(coordinate)")
                            
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                }
                
                Toggle(isOn: $viewModel.isStandardMapStyle, label: {
                    Text("Map style \(viewModel.isStandardMapStyle ? "standard" : "hybrid")")
                })
                
            } else {
                Button("Unlock Places", action: viewModel.authenticate)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        })
        .sheet(item: $viewModel.selectedPlace) { place in
            EditView(location: place) { newLocation in
                viewModel.update(location: newLocation)
            }
        }
        .alert("Author falied", isPresented: $viewModel.showAuthorFailedAlert) {
            Button("Sure") { }
        }

    }
        
        
        
        
//        switch loadingState {
//        case .loading:
//            LoadingView()
//        case .success:
//            SuccessView()
//        case .failed:
//            FailedView()
//        }
        
//        VStack {
//            Text(isUnlocked ? "Unlocked" : "Locked")
//        }
//        .onAppear(perform: authenticate)
        
//        VStack {
//            MapReader { proxy in
//                Map()
//                    .onTapGesture { position in
//                        if let coordinate = proxy.convert(position, from: .local) {
//                            print(coordinate)
//                        }
//                    }
//            }
//            
//            Map(position: $position) {
//                ForEach(locations) { location in
////                    Marker(location.name, coordinate: location.coordinate)
//                    Annotation(location.name, coordinate: location.coordinate) {
//                        Text(location.name)
//                            .font(.headline)
//                            .padding()
//                            .background(.blue)
//                            .foregroundStyle(.white)
//                            .clipShape(.capsule)
//                    }
//                    .annotationTitles(.hidden)
//                }
//            }
//                .onMapCameraChange { context in
//                    print(context.region)
//                }
//                .onMapCameraChange(frequency: .continuous) { context in
//                    print(context.region)
//                }
//            
//            HStack(spacing: 50) {
//                Button("Paris") {
//                    position = MapCameraPosition.region(
//                        MKCoordinateRegion(
//                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
//                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//                        )
//                    )
//                }
//
//                Button("Tokyo") {
//                    position = MapCameraPosition.region(
//                        MKCoordinateRegion(
//                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
//                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//                        )
//                    )
//                }
//            }
//        }
        
        
        
//        Button("Read and write") {
//            let data = Data("test message".utf8)
//            let url = URL.documentsDirectory.appending(path: "message.txt")
//            
//            do {
//                try data.write(to: url, options: [.atomic, .completeFileProtection])
//                let input = try String(contentsOf: url)
//                print(input)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }

}

#Preview {
    ContentView()
}
