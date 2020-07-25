//
//  HomeView.swift
//  Instafilter
//
//  Created by JD on 02/07/20.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct HomeView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    @State private var filterIntensity: Double = 0 {
        didSet {
            print("New value is \(filterIntensity)")
        }
    }
    @State private var showingFilterSheet = false
    @State private var processedImage: UIImage?
    
    var body: some View {
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        return VStack {
            Spacer()
            VStack(spacing: 30) {
                image?
                    .resizable()
                    .scaledToFit()
                Button("Select Image") {
                    self.showingImagePicker = true
                }
                Button("Change Filter") {
                    self.showingFilterSheet = true
                }
                Button("Save") {
                    guard let processedImage = self.processedImage else { return }
                    let imageSaver = ImageSaver()
                    imageSaver.successHandler = {
                        print("Success!")
                    }
                    imageSaver.errorHandler = {
                        print("Oops: \($0.localizedDescription)")
                    }
                    imageSaver.writeToPhotoAlbum(image: processedImage)
                }
                Slider(value: intensity)
                    .padding()
            }
            Spacer()
            Text("JD")
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(.gray)
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        .actionSheet(isPresented: $showingFilterSheet) {
            ActionSheet(title: Text("Select a filter"), buttons: [
                .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()) },
                .default(Text("Edges")) { self.setFilter(CIFilter.edges()) },
                .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()) },
                .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()) },
                .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()) },
                .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()) },
                .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
                .cancel()
            ])
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        guard let outputImage = currentFilter.outputImage else { return }
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
