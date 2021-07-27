//
//  NewsResponse.swift
//  NewsApp
//
//  Created by raymundo melecio on 7/25/21.
//

import Foundation
// MARK: - News
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author:"",
                   url:"https://news.google.com/__i/rss/rd/articles/CBMiK2h0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9cXdPV0o4cFBnazjSAQA?oc=5",
                   source:"Google News",
                   title:"The Walking Dead Season 11 - Official Trailer (2021) Norman Reedus, Lauren Cohan - IGN",
                   articleDescription:"",
                   image:"https://ichef.bbci.co.uk/news/1024/branded_news/5BEF/production/_114153532_baf6003f-c4ff-43e5-a5cf-26be914cd8df.jpg",
                   date: Date())
    }
}
