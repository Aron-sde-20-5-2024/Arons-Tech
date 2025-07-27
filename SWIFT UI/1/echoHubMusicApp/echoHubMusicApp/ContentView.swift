//
//  ContentView.swift
//  echoHubMusicApp
//
//  Created by alens-caw-mac-m1 on 25/07/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var audioManager = AuidoManager()
    
    var body: some View {
        VStack {
            HStack {
                Text("EchoHub")
                    .bold()
                
            }
            .frame(width: audioManager.musicImageWidth - 50)
            .font(.largeTitle)
            
            
            HStack {
                Image(audioManager.musicList[audioManager.selectedMusic-1].image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: audioManager.musicImageWidth - 50,
                   height: audioManager.musicImageWidth - 20)
            .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(audioManager.musicList[audioManager.selectedMusic-1].title)
                    .font(.largeTitle)
                    .bold()
                Text(audioManager.musicList[audioManager.selectedMusic-1].singer)
                    .font(.callout)
            }
            .frame(width: audioManager.musicImageWidth - 50, alignment: .leading)
            
            HStack(spacing: 50) {
                Image(systemName: "chevron.left.square.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        if(audioManager.selectedMusic == 1) {
                            self.audioManager.selectedMusic = audioManager.musicList.count
                        }else{
                            self.audioManager.selectedMusic -= 1
                        }
                        
                        self.audioManager.isPlay = true
                        self.audioManager.pauseMusic()
                        self.audioManager.avAudioPlayer = nil
                        self.audioManager.progress = 0
                        
                        let musicName = "\(audioManager.musicList[audioManager.selectedMusic-1].id)"
                        
                        guard let _ = self.audioManager.avAudioPlayer else {
                            self.audioManager.playNewMusic(musicName: musicName)
                            return
                        }
                    }
                Image(systemName: self.audioManager.isPlay ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .onTapGesture {
                        self.audioManager.isPlay.toggle()
                        let musicName = "\(audioManager.musicList[audioManager.selectedMusic-1].id)"
                        
                        guard let avAudioPlayer = self.audioManager.avAudioPlayer else {
                            self.audioManager.playNewMusic(musicName: musicName)
                            return
                        }
                        
                        if(avAudioPlayer.isPlaying){
                            self.audioManager.pauseMusic()
                        }else{
                            self.audioManager.playMusic()
                        }
                    }
                Image(systemName: "chevron.right.square.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        if(audioManager.selectedMusic == audioManager.musicList.count) {
                            self.audioManager.selectedMusic = 1
                        }else{
                            self.audioManager.selectedMusic += 1
                        }
                        
                        self.audioManager.isPlay = true
                        self.audioManager.pauseMusic()
                        self.audioManager.avAudioPlayer = nil
                        self.audioManager.progress = 0
                        
                        let musicName = "\(audioManager.musicList[audioManager.selectedMusic-1].id)"
                        
                        guard let _ = self.audioManager.avAudioPlayer else {
                            self.audioManager.playNewMusic(musicName: musicName)
                            return
                        }
                    }
            }
            .font(.largeTitle)
            .bold()
            .padding(.vertical, 30)
            
            Slider(value: $audioManager.progress, in: 0...1, onEditingChanged: { isEditing in
                audioManager.isSeeking = isEditing
                if !isEditing {
                    audioManager.seek(to: audioManager.progress)
                }
            })
            .frame(width: UIScreen.main.bounds.width - 50)
            .accentColor(.white)
            
            Spacer()
        }
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AngularGradient(colors: [.indigo, .teal, .teal, .teal, .indigo, .indigo], center: .center)
                    
        )
    }
}

#Preview {
    ContentView()
}


class Music {
    init (id: Int, title: String, singer: String, image: String) {
        self.id = id
        self.title = title
        self.singer = singer
        self.image = image
    }
    
    let id: Int
    let title: String
    let singer: String
    let image: String
}
