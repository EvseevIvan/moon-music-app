//
//  AudioPlayer.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 29.01.2023.
//

import Foundation
import AVFoundation

class AudioPlayer {
    
    static var shared = AudioPlayer()
    
    var audioPlayer = AVAudioPlayer()
    
    func downloadFileFromURL(url: String){
        let downloadUrl = URL(string: url)!
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: downloadUrl) { (url1, response, error) in
            self.play(url: url1!)
        }
        downloadTask.resume()
    }
    
    func play(url:URL) {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.volume = 2.0
            self.audioPlayer.play()
        } catch let error as NSError {
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
    
    func musicPause(task: String) {
        if task == "pause" {
            self.audioPlayer.pause()
        } else {
            self.audioPlayer.play()
        }
    }
    
    
}
