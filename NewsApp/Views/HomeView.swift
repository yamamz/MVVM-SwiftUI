//
//  HomeView.swift
//  NewsApp
//
//  Created by raymundo melecio on 7/25/21.
//

import SwiftUI

struct HomeView: View {
   @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        NavigationLink(
                            destination: NewsDetailsView(article: item),
                            label: {
                                ArticleView(article: item)
                            })
             
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: viewModel.getArticles)
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
