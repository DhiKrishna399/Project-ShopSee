//
//  HomeScreenView.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 9/26/21.
//

import SwiftUI

struct HomeScreenView: View {
    
    
    @State var searchText = ""

    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
                Image(systemName: "paperplane")
            }
            Spacer()
            ScrollView {
                VStack{
                    VideoDisplay(image: "video.fill", category: "Live Now")
                    VideoDisplay(image: "laptopcomputer.and.iphone", category: "Technology")
                    VideoDisplay(image: "signpost.right.fill", category: "Experiences")
                    VideoDisplay(image: "mouth.fill", category: "Makeup")
                    VideoDisplay(image: "camera.fill", category: "Photography")
                }
            }

        }
        .padding()
        .navigationBarHidden(true)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}


struct VideoDisplay: View {
    
    var image: String
    var category: String
    //Will later need to change this to load the images off a database so its dynamic
    var images: [String] = ["gondola", "hotel0", "hotel1", "hotel2", "murano", "newdelhi"]
    
    init(image: String, category: String) {
        self.image = image
        self.category = category
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image) 
                Text(category)
                Spacer()
                NavigationLink(destination: ExpandedCategoryView()) {
                    Image(systemName: "chevron.forward")
                }
                
            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(images, id: \.self) {image in
                        ImageView(imageName: image)
                    }
                }
            }
        }
    }
    
}

struct ImageView: View {
    
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
                    .frame(width: 110, height: 150, alignment: .center)
                    .cornerRadius(10)
                    .overlay(HStack {
                        Spacer()
                        Image(systemName: "eye")
                        Text("1.7M")
                            .font(.body)
                    }, alignment: .topTrailing)
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeScreenView()
    }
}
