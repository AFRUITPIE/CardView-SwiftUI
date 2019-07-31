//
//  ContentView.swift
//  CardView-SwiftUI
//
//  Created by Quentin on 2019/7/31.
//  Copyright © 2019 TotoroQ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isProfileShow = false
    @State var isShowDetail = false
    
    var cards = cardData
    
    var body: some View {
        VStack {
            TopMenu(isProfileShow: $isProfileShow)
            
            ScrollView() {
                VStack(spacing: 25) {
                    ForEach(cards) { card in
                        
                        CardView(
                            subtitle: card.subtitle,
                            title: card.title,
                            backgroundImage: Image(card.backgroundImage),
                            briefSummary: card.briefSummary,
                            description: card.description,
                            isShowDetail: self.$isShowDetail
                        )
                        .tapAction {
                            self.isShowDetail.toggle()
                        }
                        .frame(width: self.isShowDetail ? UIScreen.main.bounds.width : nil)
                        
                    }
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding()
        .sheet(isPresented: $isProfileShow, content: {
            ProfileView(isProfileShow: self.$isProfileShow)
        })
        .edgesIgnoringSafeArea(.bottom)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().colorScheme(.light)
            
            ContentView().colorScheme(.dark)
        }
    }
}
#endif

struct TopMenu: View {
    @Binding var isProfileShow: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("WED, JULY 31")
                .font(.caption)
                .padding(.bottom, -10)
                .foregroundColor(.gray)
            
            HStack(alignment: .center) {
                Text("Today")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: { self.isProfileShow.toggle() }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
