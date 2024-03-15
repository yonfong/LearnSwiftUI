//
//  ContentView.swift
//  Instafilter
//
//  Created by sky on 2024/3/15.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var blurAmount = 0.0 

    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    @State private var image: Image?
    
    var body: some View {
//        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("create Snippets") {
                
            }
            .buttonStyle(.borderedProminent)
        }
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//                .padding()
//        }
//        .onAppear(perform: loadImage)
        
        
//        VStack {
//            Text("Hello, world!")
//                .blur(radius: blurAmount)
//            
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) { oldValue, newValue in
//                    print("New value is \(newValue)")
//                }
//            
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//            
//            Button("Hello world") {
//                showingConfirmation = true
//            }
//            .frame(width: 100, height: 100)
//            .background(backgroundColor)
//        }
//        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
//            Button("Red") { backgroundColor = .red }
//            Button("Green") { backgroundColor = .green }
//            Button("Blue") { backgroundColor = .blue }
//            Button("Cancel", role: .cancel) {  }
//            
//        } message: {
//            Text("Select a new color")
//        }

    }
    
    func loadImage() {
        let inputImage = UIImage(resource: .test)
        let beginImage = CIImage(image: inputImage)
//        image = Image(.test)
        
        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
//        
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 5
        
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 10
        
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        let amount = 1.0

        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 100, forKey: kCIInputScaleKey) }
        
        guard let outImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outImage, from: outImage.extent) else { return  }
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
