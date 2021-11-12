//
//  ContentUploadForm.swift
//  WeShoppin
//
//  Created by Kevin Elkin on 11/5/21.
//

import SwiftUI
import UIKit

struct ContentUploadForm: View {
    
    @State private var title: String = ""
    @State private var category: String = ""
    
    var body: some View {
        VStack (alignment: .center, spacing: 15 ){
            Text("Create a Post")
             .font(.largeTitle)
            TextField("Title", text: $title)
                .font(Font.headline.weight(.semibold))
            TextField("Tags", text: $category)
                .font(Font.headline.weight(.semibold))
            
    }
    }
    
    
}


struct ContentUploadForm_Preview: PreviewProvider {
    static var previews: some View {
        ContentUploadForm()
    }
}
