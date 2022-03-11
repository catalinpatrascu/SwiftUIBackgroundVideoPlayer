//
//  MainView.swift
//  VideoPlayer
//
//  Created by Catalin Patrascu on 11.03.2022.
//
//  Distributed under the MIT License

import SwiftUI

struct MainView: View {
    @State var goNextTapped: Bool = false
    private let localVideoName = "dashboard_video"
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                BgdFullScreenVideoView(videoName: localVideoName)
                    .overlay(Color.white.opacity(0.2))
                
                makeNavigationLink()
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            goNextTapped = true
                        } label: {
                            Text("NEXT")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(Color.black)
                        }
                        .background(Color.red)
                        .cornerRadius(8)
                        .padding()
                                                
                        Spacer()
                    }
                }
            }
        }
    }
    
    private func makeNavigationLink() -> some View {
        NavigationLink(
            destination: SecondView(),
            isActive: $goNextTapped,
            label: { EmptyView() }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
