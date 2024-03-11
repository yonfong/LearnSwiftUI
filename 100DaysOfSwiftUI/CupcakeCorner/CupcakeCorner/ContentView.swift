//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by sky on 2024/3/8.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var results = [Result]()
    
    @State private var username = ""
    @State private var email = ""
    
    private var disableForm: Bool {
        return username.count < 5 || email.count < 5
    }
    
    @State private var counter = 0
    
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        
//        Button("Tap count \(counter)") {
//            counter += 1
//        }
//        .sensoryFeedback(.increase, trigger: counter)
        
        Button("Tap me", action: complexSuccess)
            .onAppear(perform: {
                prepareHaptics()
            })
        
//        NavigationStack {
//            Form {
//                Section {
//                    TextField("Username", text: $username)
//                    TextField("Email", text: $email)
//                }
//                
//                Section {
//                    Button("Create accont") {
//                        print("Creating account")
//                    }
//                }
//                .disabled(disableForm)
//            }
//            .toolbar {
//                Button("Create accont") {
//                    print("Creating account")
//                }
//                .disabled(username.isEmpty || email.isEmpty)
//            }
//        }
        
        
//        List(results, id: \.trackId) { item in
//            HStack {
////                AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
////                    image
////                     .resizable()
////                     .scaledToFit()
////                } placeholder: {
//////                    Color.red
////                    ProgressView()
////                }
////                .frame(width:100, height:100)
//                AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
//                    if let image = phase.image {
//                        image
//                            .resizable()
//                            .scaledToFit()
//                    } else if phase.error != nil {
//                        Text("there was an error")
//                    } else {
//                        ProgressView()
//                    }
//                }
//                .frame(width: 100, height: 100)
//                VStack(alignment: .leading, content: {
//                    Text(item.trackName)
//                        .font(.headline)
//                    
//                    Text(item.collectionName)
//                })
//            }
//        }
//        .task {
//            await loadData()
//        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
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
