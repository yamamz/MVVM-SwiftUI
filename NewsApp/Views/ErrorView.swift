//
//  ErrorView.swift
//  NewsApp
//
//  Created by raymundo melecio on 7/25/21.
//

import SwiftUI

struct ErrorView: View {
 
    
    let error: Error
    typealias ErrorViewActionHandler = () -> Void
    let handler:ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom,4)
            
            Text("Ooopss")
                .foregroundColor(.red)
                .font(.system(size: 25, weight: .bold
                ))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
            
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size:15, weight: .heavy))
            .cornerRadius(10)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) { }
    }
}
