//
//  auidoManger.swift
//  echoHubMusicApp
//
//  Created by alens-caw-mac-m1 on 26/07/25.
//

import AVFoundation
import SwiftUI

class AuidoManager: NSObject, ObservableObject,AVAudioPlayerDelegate {
    @Published  var progress: Double = 0.0
    @Published  var isPlay: Bool = false
    @Published var selectedMusic: Int = 1
    @Published  var avAudioPlayer: AVAudioPlayer?
    @Published  var timer: Timer?
    @Published  var isSeeking = false
    
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
    
    func playNewMusic(musicName: String) {
        let path = Bundle.main.path(forResource: "\(musicName).mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            self.avAudioPlayer = try AVAudioPlayer(contentsOf: url)
            self.avAudioPlayer?.delegate = self
            self.avAudioPlayer?.play()
            self.startTimer()
        } catch {
            print("Not Found")
        }
    }
    
    func playMusic() {
        self.avAudioPlayer?.play()
        self.startTimer()
    }
    
    func pauseMusic() {
        self.avAudioPlayer?.pause()
        self.stopTimer()
    }
    
    func startTimer() {
        self.stopTimer()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true) { _ in
            if let avAudioPlayer = self.avAudioPlayer {
                if(self.isSeeking == false){
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
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.isPlay = false
        self.stopTimer()
        self.progress = 0.0
        
        if(selectedMusic == musicList.count){
            selectedMusic = 1
        }else{
            selectedMusic += 1
        }
        
        let musicName = "\(musicList[selectedMusic - 1].id)"
        self.playNewMusic(musicName: musicName)
        self.isPlay = true
    }
    
    func seek(to progress: Double) {
        guard let player = avAudioPlayer else { return }
        let newTime = progress * player.duration
        player.currentTime = newTime
    }
}
