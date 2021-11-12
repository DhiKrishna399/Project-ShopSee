//
//  ProfileGridButton.swift
//  WeShoppin
//
//  Created by Kevin Elkin on 10/10/21.
//

import SwiftUI
import UIKit


// MARK: Grid View
struct ImageViewProfile: View {
    
    var imageName: String
    
    init(imageName: String){
        self.imageName = imageName
    }
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottom){
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 115, height: 150, alignment: .center)
                    .cornerRadius(10)
                
                
            }
        }
        
        
        
    }
}

// MARK: Grid Button
struct gridButton: View {
    
    let videoCols = [GridItem(.flexible()),
                     GridItem(.flexible()),
                     GridItem(.flexible())]
    
    var imageNames: [String]
    
    init(imageNames: [String]){
        self.imageNames = imageNames
    }
    
    var body: some View {
        
        
        //ScrollView(.vertical){
        LazyVGrid(columns: videoCols, spacing: 20) {
            
            ForEach(imageNames, id: \.self) {image in
                ImageViewProfile(imageName: image)
                
            }
            
        }
        .padding(.horizontal)
        //}
    }
}
