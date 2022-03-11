//
//  BgdFullScreenVideoView.swift
//  VideoPlayer
//
//  Created by Catalin Patrascu on 11.03.2022.
//
//  Distributed under the MIT License

import SwiftUI
import AVFoundation

public struct BgdFullScreenVideoView: View {
    @State private var player = AVQueuePlayer()
    private let videoName: String
    
    public init(videoName: String) {
        self.videoName = videoName
    }
    
    public var body: some View {
        GeometryReader { geo in
            PlayerView(videoName: videoName, player: player)
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    player.pause()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    player.play()
                }
        }
        .ignoresSafeArea()
    }
}

struct BackgroundFullScreenVideo_Previews: PreviewProvider {
    static var previews: some View {
        BgdFullScreenVideoView(videoName: "dashboard_video")
    }
}
