//
//  NewsDetailsView.swift
//  NewsApp
//
//  Created by raymundo melecio on 7/25/21.
//

import SwiftUI

import URLImage

struct NewsDetailsView: View {
    let article: Article
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        return dateFormatter.string(from: date)
    }
    var body: some View {
        
        ScrollView {
        VStack(alignment: .center, spacing: 4) {
            ZStack(alignment:.center) {
                
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
                    .frame( height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                } else {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 160)
                        
                }
                
                Text(formatDate(date: article.date ?? Date()))
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.vertical, 16)
                    .frame(width: UIScreen.main.bounds.width , alignment: .leading)
                    .offset(y: 70)
                    
                    
            }
            
       
            Text(article.title )
                .font(.system(size: 16, weight: .heavy))
                .foregroundColor(.black)
                .padding(.vertical, 20).multilineTextAlignment(.center)
            
            Text(article.author ?? "No Author")
                .font(.system(size: 14))
                .foregroundColor(.gray)

            Text(article.articleDescription ?? "No Description")
                .font(.body)
                .foregroundColor(.black)
                .padding(.top, 24)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.center)
        }.navigationTitle(Text("News Details"))
        .navigationBarTitleDisplayMode(.inline)
        
    }
    }
}

struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsView(article: .dummyData)
    }
}
