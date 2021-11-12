//
//  ProfileCommentButton.swift
//  WeShoppin
//
//  Created by Kevin Elkin on 10/10/21.
//

import SwiftUI
import UIKit

// MARK: Comment Button
struct commentButton: View {
    
    var imageComments: KeyValuePairs<String, String>
    //    var comments: [String]
    
    let CommentCols = [GridItem(.flexible())]
    
    init(imageComments: KeyValuePairs<String, String>){
        self.imageComments = imageComments
    }
    
    var body: some View {
        
        let keys = imageComments.map{$0.key}
        let values = imageComments.map {$0.value}
        
        
        //ScrollView(.vertical){
            
            LazyVGrid(columns: CommentCols, spacing: 20) {
                
                
                ForEach(keys.indices) {index in
                    CommentViewProfile(commentName: keys[index], postName: values[index])
                }
                
                
            }
            .padding(.horizontal)
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
