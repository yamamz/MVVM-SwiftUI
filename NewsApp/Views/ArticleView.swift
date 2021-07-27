//
//  ArticleView.swift
//  NewsApp
//
//  Created by raymundo melecio on 7/25/21.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    var body: some View {
        HStack {
            if let imageUrl = article.image,
               let url = URL(string:imageUrl) {
                URLImage(url) {
                    // This view is displayed before download starts
                    EmptyView()
                } inProgress: { progress in
                    // Display progress
                   ProgressView()
                } failure: { error, retry in
                    // Display error and retry button
                    VStack {
                        Text(error.localizedDescription)
                        Button("Retry", action: retry)
                    }
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            } else {
                PlaceHoldeImageView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title )
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Text(article.source )
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            
            
        }
    }
}


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: .dummyData)
            .previewLayout(.sizeThatFits)
    }
}

struct PlaceHoldeImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
