//
//  ExpandedCategoryView.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 9/26/21.
//

import SwiftUI

struct ExpandedCategoryView: View {
    let columns = [ GridItem(.flexible()),
                    GridItem(.flexible()),
    ]
    
    var imageNames: [String] = ["gondola", "hotel0", "hotel1", "hotel2", "murano", "newdelhi"]
    
    @State var searchText = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
                Image(systemName: "paperplane")
            }
            Spacer()
            ScrollView(.vertical){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(imageNames, id: \.self) {image in
                        ExpandedImageView(imageName: image)
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ExpandedImageView: View {
    
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
                    .frame(width: UIScreen.main.bounds.height/5, height: 200, alignment: .center)
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

struct ExpandedCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedCategoryView()
    }
}
