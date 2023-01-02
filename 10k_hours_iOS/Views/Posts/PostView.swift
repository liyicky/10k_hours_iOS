//
//  PostView.swift
//  10k_hours_iOS
//
//  Created by Jason Cheladyn on 2022/12/22.
//

import SwiftUI
import CoreData

struct PostView: View {
    
    let post: Post
    
    var body: some View {

        VStack {
            HStack {
                Image(uiImage: UIImage(data: post.binaryImageData!)!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                    .frame(width: 200, height: 200)
                    .shadow(radius: 5)
                Spacer()
                VStack {
                    Text(post.title)
                        .font(.title)
                    Divider()
                    Text(post.date.formatted())
                }
            }
            
            
            Text(post.content)
            HStack {
                Text("$" + post.dollarsInvested)
                Text(post.hoursInvested + " hours")
            }
            
        }
        .padding()
        .border(.black)
        .padding()
    }
}

//struct PostView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        let post = PostEntity(context: previewContext)
//        post.title = "Test Title"
//        post.dollars = 100
//        post.hours = 2
//        post.date = Date.now
//        post.content = "Look, just because I don’t be givin’ no man a foot massage don’t make it right for Marsellus to throw Antwone into a glass motherfuckin’ house, fuckin’ up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, ’cause I’ll kill the motherfucker, know what I’m sayin’?"
//        if let image = UIImage(named: "test_image") {
//            post.image = image.pngData()
//        }
//        return PostView(post: post)
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .environment(\.managedObjectContext, previewContext)
//    }
//
//    static var previewContext: NSManagedObjectContext = {
//            return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        }()
//}
