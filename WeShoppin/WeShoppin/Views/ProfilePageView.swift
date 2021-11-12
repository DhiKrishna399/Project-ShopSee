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
    var imageCommentDict: KeyValuePairs<String, String> = ["This lipstick tastes like chocolate" : "gondola",
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
                    HamburgerMenuView()
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

                    Spacer()
                    Button(action: {
                        viewRouter.currentPage = .commentButton
                        
                    }) {
                        Image(systemName: "square.stack.3d.up.fill")
                    }
                    
                    Spacer()
                }.font(.system(size: 25))
                
                
//                ScrollView(.horizontal){
//                    HStack{
//                        gridButton(imageNames: images)
//                        commentButton(imageComments: imageCommentDict)
//                    }.padding(.horizontal)
//
//                }
                switch viewRouter.currentPage {
                case .gridButton:
                    gridButton(imageNames: images)
                case .commentButton:
                    commentButton(imageComments: imageCommentDict)

                }
            }
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


struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView(viewRouter: ProfileViewRouter())
    }
}

