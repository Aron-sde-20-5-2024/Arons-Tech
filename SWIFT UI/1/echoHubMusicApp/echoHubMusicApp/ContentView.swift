//
//  ContentView.swift
//  echoHubMusicApp
//
//  Created by alens-caw-mac-m1 on 25/07/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var progress: Double = 0.0
    @State private var isPlay: Bool = false
    @State var selectedMusic: Int = 1
    
    @State private var avAudioPlayer: AVAudioPlayer?
    @State private var timer: Timer?
    
    let musicList: [Music] = [
        Music(id: 1, title: "Blinding Lights", singer: "The Weeknd", image: "blinding_lights"),
        Music(id: 2, title: "Shape of You", singer: "Ed Sheeran", image: "shape_of_you"),
        Music(id: 3, title: "Levitating", singer: "Dua Lipa", image: "levitating"),
        Music(id: 4, title: "Dance Monkey", singer: "Tones and I", image: "dance_monkey"),
        Music(id: 5, title: "Stay", singer: "The Kid LAROI & Justin Bieber", image: "stay"),
        Music(id: 6, title: "Senorita", singer: "Shawn Mendes & Camila Cabello", image: "senorita"),
        Music(id: 7, title: "Believer", singer: "Imagine Dragons", image: "believer"),
        Music(id: 8, title: "Someone You Loved", singer: "Lewis Capaldi", image: "someone_you_loved"),
        Music(id: 9, title: "Bad Guy", singer: "Billie Eilish", image: "bad_guy"),
        Music(id: 10, title: "Perfect", singer: "Ed Sheeran", image: "perfect")
    ]
    
    let musicImageWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack {
                Text("EchoHub")
                    .bold()
                
            }
            .frame(width: musicImageWidth - 50)
            .font(.largeTitle)
            
            
            HStack {
                Image(musicList[selectedMusic-1].image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: musicImageWidth - 50,
                   height: musicImageWidth - 20)
            .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(musicList[selectedMusic-1].title)
                    .font(.largeTitle)
                    .bold()
                Text(musicList[selectedMusic-1].singer)
                    .font(.callout)
            }
            .frame(width: musicImageWidth - 50, alignment: .leading)
            
            HStack(spacing: 50) {
                Image(systemName: "chevron.left.square.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        if(selectedMusic == 1) {
                            self.selectedMusic = musicList.count
                        }else{
                            self.selectedMusic -= 1
                        }
                        
                        self.isPlay = true
                        self.pauseMusic()
                        self.avAudioPlayer = nil
                        self.progress = 0
                        
                        let musicName = "\(musicList[selectedMusic-1].id)"
                        
                        guard let _ = self.avAudioPlayer else {
                            self.playNewMusic(musicName: musicName)
                            return
                        }
                    }
                Image(systemName: self.isPlay ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .onTapGesture {
                        self.isPlay.toggle()
                        let musicName = "\(musicList[selectedMusic-1].id)"
                        
                        guard let avAudioPlayer = self.avAudioPlayer else {
                            self.playNewMusic(musicName: musicName)
                            return
                        }
                        
                        if(avAudioPlayer.isPlaying){
                            self.pauseMusic()
                        }else{
                            self.playMusic()
                        }
                    }
                Image(systemName: "chevron.right.square.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        if(selectedMusic == musicList.count) {
                            self.selectedMusic = 1
                        }else{
                            self.selectedMusic += 1
                        }
                        
                        self.isPlay = true
                        self.pauseMusic()
                        self.avAudioPlayer = nil
                        self.progress = 0
                        
                        let musicName = "\(musicList[selectedMusic-1].id)"
                        
                        guard let _ = self.avAudioPlayer else {
                            self.playNewMusic(musicName: musicName)
                            return
                        }
                        
                    }
            }
            .font(.largeTitle)
            .bold()
            .padding(.vertical, 30)
            
            
            ProgressView(value: progress)
                .frame(width: musicImageWidth - 50)
                .progressViewStyle(.linear)
                .accentColor(.white)
            
            Spacer()
        }
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AngularGradient(colors: [.indigo, .teal, .teal, .teal, .indigo, .indigo], center: .center)
                    
        )
    }
    
    private func playNewMusic(musicName: String) {
        let path = Bundle.main.path(forResource: "\(musicName).mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            self.avAudioPlayer = try AVAudioPlayer(contentsOf: url)
            self.avAudioPlayer?.play()
            self.startTimer()
        } catch {
            print("Not Found")
        }
    }
    
    private func playMusic() {
        self.avAudioPlayer?.play()
        self.startTimer()
    }
    
    private func pauseMusic() {
        self.avAudioPlayer?.pause()
        self.stopTimer()
    }
    
    private func startTimer() {
        self.stopTimer()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true) { _ in
            if let avAudioPlayer = self.avAudioPlayer {
                let currentTime = avAudioPlayer.currentTime
                let totalTime = avAudioPlayer.duration
                if(totalTime > 0) {
                    withAnimation {
                        self.progress = (currentTime/totalTime)
                    }
                }
                
                if(currentTime == totalTime) {
                    self.isPlay = false
                }
            }
        }
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
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
