//
//  ContentView.swift
//  Instafilter
//
//  Created by sky on 2024/3/15.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit

struct ContentView: View {
    @State private var blurAmount = 0.0 

    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    @State private var image: Image?
    
//    @State private var pickerItem: PhotosPickerItem?
//    @State private var selectedImage: Image?
    
    
    @Environment(\.requestReview) var requestReview
    
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var radius = 0.5
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilters = false
    
    @AppStorage("filterCount") var filterCount = 0
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                // image area
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get start"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, customLoadImage)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("Radius")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity, applyProcessing)
                    }
                    
                    HStack {
                        Text("Intensity")
                        Slider(value: $radius)
                            .onChange(of: radius, applyProcessing)
                    }
                }
                .padding(.vertical)
                .disabled(selectedItem == nil)
                
                HStack {
                    Button("Change filter", action: changeFilter)
                    
                    Spacer()
                    
                    // share the picture
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                    
                }
                .disabled(selectedItem == nil)
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Selecte a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                
                Button("zoomBlur") { setFilter(CIFilter.zoomBlur()) }
                Button("morphologyGradient") { setFilter(CIFilter.morphologyGradient()) }
                Button("spotLight") { setFilter(CIFilter.spotLight()) }
                
                Button("Cancel", role: .cancel) { }
            }
        }
        

//        VStack {
//            PhotosPicker("Select a picture", selection: $pickerItems, maxSelectionCount: 4, matching: .images)
//                .onChange(of: pickerItems) { oldValue, newValue in
//                    Task {
//                        selectedImages.removeAll()
//                        
//                        for item in pickerItems {
//                            if let loadedImage = try await item.loadTransferable(type: Image.self) {
//                                selectedImages.append(loadedImage)
//                            }
//                        }
//                    }
//                }
//            
//            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
//                Label("Select a picture", systemImage: "photo")
//                Image(systemName: "photo")
//            }
//            
//            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn swift"), message: Text("100 day in swiftui"))
//            
//            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
//                Label("Spread the world about swift", systemImage: "swift")
//            }
//            
//            let example = Image(.test)
//            ShareLink(item:example, preview: SharePreview("Test", image: example)) {
//                Label("Click to share", systemImage: "airplane")
//            }
//            
//            Button("Leave a review") {
//                requestReview()
//            }
////            selectedImage?
////                .resizable()
////                .scaledToFit()
//            
//            
//            ScrollView {
//                ForEach(0..<selectedImages.count, id: \.self) { index in
//                    selectedImages[index]
//                        .resizable()
//                        .scaledToFit()
//                }
//            }
//        }
        
//        ContentUnavailableView {
//            Label("No snippets", systemImage: "swift")
//        } description: {
//            Text("You don't have any saved snippets yet.")
//        } actions: {
//            Button("create Snippets") {
//                
//            }
//            .buttonStyle(.borderedProminent)
//        }
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
    
    private func customLoadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            
            applyProcessing()
        }
    }
    
    private func changeFilter() {
        showingFilters = true
    }
    
    private func applyProcessing() {
//        currentFilter.intensity = Float(filterIntensity)
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(radius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outImage, from: outImage.extent) else { return  }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
        
    }
    
    @MainActor private func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        customLoadImage()
        
        filterCount += 1
        
        if filterCount >= 3 {
            requestReview()
        }
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
