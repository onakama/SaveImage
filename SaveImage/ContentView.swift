//
//  ContentView.swift
//  SaveImage
//
//  Created by 住山大誠 on 2022/02/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var image: UIImage?
    @State var showingImagePicker = false
    var saveImage: SaveImage = SaveImage()
    
    var body: some View {
        VStack {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Image("noimage")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            }
            Spacer().frame(height: 32)
            Button(action: {
                showingImagePicker = true
            }) {
                Text("フォトライブラリから選択")
            }
            Button("保存") {
                if image != nil {
                    let dateStr = DateString().get()
                    let imagePath: String = saveImage.fileInDocumentsDirectory(filename: dateStr)
                    saveImage.saveImage(image: image!, path: imagePath)
                }
            }
            Button("取得") {
                let imagePath: String = saveImage.fileInDocumentsDirectory(filename: "test")
                image = saveImage.loadImage(path: imagePath)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
