//
//  ProfilePageView.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 9/26/21.
//

import SwiftUI
import UIKit

struct ProfilePageView: View {
    
    //@State var currentProfileDisplay: profileButton = .gridButton
    @StateObject var viewRouter: ProfileViewRouter
    
    var comments: [String] = ["This lipstick tastes like chocolate", "I Love this product - just bought 2 more","OMG I just saw Brad with Vicky", "This coffee is amazing 10/10", "It's 2:00am........I should probably go to bed :(", "FUCKING BRAD IS SUCH A BITCH!!!!", "Who tf even is Brad??!"]
    
    var imagesComments: [String] = ["gondola", "hotel0", "hotel1", "hotel2", "murano", "newdelhi", "newyork"]
    
    var images: [String] = ["gondola", "hotel0", "hotel1", "hotel2", "murano", "newdelhi", "newyork", "paris", "santorini", "saopaulo", "stmarksbasilica", "venice"]
    
    //Ordered collection of key-value pairs and don’t require the fast key lookup that the Dictionary type provides.
    var imageCommentDict: [String : String] = ["This lipstick tastes like chocolate" : "gondola",
                                               "I Love this product - just bought 2 more" : "hotel0",
                                               "OMG I just saw Brad with Vicky" : "hotel1",
                                               "This coffee is amazing 10/10" : "hotel2",
                                               "It's 2:00am........I should probably go to bed :(" : "murano",
                                               "FUCKING BRAD IS SUCH A BITCH!!!!" : "newdelhi",
                                               "Who tf even is Brad??!" : "newyork"]
    
    
    var body: some View {

        // MARK: Username Heading
        VStack{
            
            HStack {
                Text("Username")
                    .font(.system(size: 30))
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    //Placeholder Image CHANGE
                    HamburgerMenuView()
                    //Image(systemName: "chevron.forward")
                }
                
            }.padding(.horizontal)
            
            // Profile Image and background
            ScrollView(.vertical){
                ZStack {
                    Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).frame(width: .infinity, height: 120)
                    Circle().foregroundColor(.white).frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                HStack{
                    Text("7k \nFollowers").multilineTextAlignment(.center)
                    Spacer()
                    Text("28 \nFollowing").multilineTextAlignment(.center)
                    Spacer()
                    Text("12 \nPosts").multilineTextAlignment(.center)
                    
                }.padding(.horizontal)
                // MARK: Toggle Buttons
                HStack{
                    Spacer()
                    
                    Button(action: {
                        viewRouter.currentPage = .gridButton
                    }) {
                        Image(systemName: "square.grid.2x2")
                    }
                    //                Spacer()
                    //                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    //                    Image(systemName: "message")
                    //                }
                    Spacer()
                    Button(action: {
                        viewRouter.currentPage = .commentButton
                        
                    }) {
                        Image(systemName: "square.stack.3d.up.fill")
                    }
                    
                    //                Button(action: {
                    //                    // What to perform
                    //                }) {
                    //                    // How the button looks like
                    //                }
                    Spacer()
                }.font(.system(size: 25))
                
                //            ScrollView(.vertical){
                //                LazyVGrid(columns: videoCols, spacing: 20) {
                //
                //                    ForEach(images, id: \.self) {image in
                //                        ImageViewProfile(imageName: image)
                //
                //                    }
                //
                //                }
                //                .padding(.horizontal)
                //            }
                
                //            ScrollView(.vertical){
                //                LazyVGrid(columns: CommentCols, spacing: 20) {
                //
                ////                    for i in 0..<comments.count {
                ////                        CommentViewProfile(commentName: comments[i], imagesComments[i])
                ////                    }
                //
                //                    ForEach(comments, id: \.self) {comment in
                //                        CommentViewProfile(commentName: comment)
                //
                //                    }
                //                }
                //                .padding(.horizontal)
                //            }
                
                switch viewRouter.currentPage {
                case .gridButton:
                    gridButton(imageNames: images)
                case .commentButton:
                    commentButton(imageComments: imageCommentDict)
                    
                }
            }
            //gridButton(imageNames: images)
            
            HStack {
                NavigationLink(
                    destination: HomeScreenView(),
                    label: {
                        Image(systemName: "house")
                            .foregroundColor(.black)
                    })
                Spacer()
                Image(systemName: "magnifyingglass")
                Spacer()
                Image(systemName: "video")
                Spacer()
                Image(systemName: "person")
                
                Spacer()
                Image(systemName: "cart")
                
            }
            .font(.system(size: 30))
            .frame(maxWidth: .infinity)
        }
        
    }
}

// MARK: Hamburger Menu
struct HamburgerMenuView: View {
    var body: some View {
        
        Menu {
            Button("Cancel", action: {})
            Button("Search", action: {})
            Button("Add", action: {})
            Button("Self Destruct", action: {})
        } label: {
            Label("Create", systemImage: "plus")
        }
    }
}


//struct MotherView: View {
//
//    @State var currentProfileDisplay: profileButton = .gridButton
//
//    var body: some View {
//        switch currentProfileDisplay {
//        case .gridButton:
//            gridButton(imageNames: images)
//        case .commentButton:
//            commentButton(comments: comments)
//
//        }
//    }
//}
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

// MARK: Comment Button
struct commentButton: View {
    
    var imageComments: [String:String]
    //    var comments: [String]
    
    let CommentCols = [GridItem(.flexible())]
    
    init(imageComments: [String:String]){
        self.imageComments = imageComments
    }
    
    var body: some View {
        
        let keys = imageComments.map{$0.key}
        let values = imageComments.map {$0.value}
        
        
        //ScrollView(.vertical){
            
            LazyVGrid(columns: CommentCols, spacing: 20) {
                
                //                    for i in 0..<comments.count {
                //                        CommentViewProfile(commentName: comments[i], imagesComments[i])
                //                    }
                
                //
                //                    for (key, value) in imageComments {
                //                        CommentViewProfile(commentName: key, postName: value)
                //                    }
                //                ForEach(keys.indices, id: \.self) {key, value in
                //                                CommentViewProfile(commentName: key, postName: value)
                //
                //                            }
                
                ForEach(keys.indices) {index in
                    CommentViewProfile(commentName: keys[index], postName: values[index])
                }
                
                
                //            ForEach(Array(imageComments.keys), id: \.self)
                //            imageComments.forEach { key, value in }
                //            imageComments.forEach{CommentViewProfile(commentName: $0.key, postName: $0.value}
                
            }
            .padding(.horizontal)
        //}
    }
}


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
                    .frame(width: 110, height: 150, alignment: .center)
                    .cornerRadius(10)
                
                
            }
        }
        
        
        
    }
}

// MARK: Comment View
struct CommentViewProfile: View {
    
    var commentName: String
    
    var postName: String
    
    init(commentName: String, postName: String){
        self.commentName = commentName
        self.postName = postName
    }
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottom){
                
                Rectangle().foregroundColor(.gray).frame(width: 375, height: 70).cornerRadius(10).overlay(
                    HStack {
                        Image(postName).resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 50, alignment: .center)
                            .cornerRadius(10)
                        Text(commentName)
                            .font(.body)
                    }, alignment: .center)
                Spacer()
                
                
            }
        }
        
        
        
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView(viewRouter: ProfileViewRouter())
    }
}

