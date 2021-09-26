//
//  LiveStreamView.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 9/26/21.
//

import SwiftUI
import AVKit


struct LiveStreamView: View {
    
    @State var player = AVPlayer()
    var videoUrl: String = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
    
    var body: some View {
        VideoPlayer(player: player)
            .frame(width: .infinity, height: .infinity)
                .overlay(VideoOverlay())
            .onAppear() {
                player = AVPlayer(url: URL(string: videoUrl)!)
            }
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)

    }
}

struct VideoOverlay: View {
    var body: some View {
        VStack {
            TopInfoBar()
            Spacer()
            HStack {
                ChatBox()
                Spacer()
                productInfo()
                
            }
            .frame(maxWidth: .infinity, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 300, alignment: .bottomTrailing)
            
        }
        .padding(.horizontal)
        .padding(.top)

    }
}

// MARK: ChatBox UI
struct ChatBox: View {
    
    let sampleComments = [  "This stream slaps",
                            "How much is it?",
                            "Where can i buy one Captain?",
                            "I got the glock guys",
                            "Here's a kinda long comment to see what it would look like",
                            "One more comment to make sure you scrooooll"]
    let commentColumn = [GridItem(.flexible())];
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(.black)
                .cornerRadius(25)
                .frame(width: .infinity, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(0.3)
            VStack{
                ScrollView{
                    LazyVGrid(columns: commentColumn, spacing: 20) {
                        
                        ForEach(sampleComments, id: \.self) {comment in
                           CommentText(comment: comment)
                            
                        }
                    }
                }
                .padding(.vertical)
                TextField("Comment", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: .infinity, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                    .padding(.horizontal)
            }
            
        }
   
    }
}

// MARK: Info Bar for Stream Page
struct TopInfoBar: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
                HStack{
                    Image(systemName: "arrowtriangle.down.fill")
                    Spacer()
                    Text("Live")
                        .fontWeight(.bold)
                        .font(.body)
                        .padding()
                        .frame(width: 100, height: 20, alignment: .center)
                        .background(Color.red)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                    
                    Spacer()
                    Image(systemName: "eye")
                    Text("1.7M")
                        .font(.body)
                }
                
                Text("Macbook Pro Review")
                    .font(.title)
                Text("ImTheCaptainBitch")
            }
            Spacer()
            Image("avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .frame(width: .infinity, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

// MARK: Product Info Display
struct productInfo: View {
    var body: some View {
        VStack{
            Spacer()
            Image("macbook")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Macbook Pro 2016")
            HStack{
                Spacer()
                Image(systemName: "arrowshape.turn.up.right.fill")

                    .frame(width: .infinity, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(systemName: "star")
                Spacer()
            }
        }

    }
}


// MARK: Comment Text UI
// Might want to move this to an external file of just all UI elements
struct CommentText: View {
    var comment: String
    init(comment: String){
           self.comment = comment
       }
    var body: some View {
        
        HStack{
            Image("avatar")
                .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(comment)
                .font(.body)
        }
    }
}



struct LiveStreamView_Previews: PreviewProvider {
    static var previews: some View {
        LiveStreamView()
    }
}
