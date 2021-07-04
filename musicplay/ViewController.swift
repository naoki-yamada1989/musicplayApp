//
//  ViewController.swift
//  musicplay
//
//  Created by 山田直輝 on 2021/06/06.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //シンバル用の音源ファイルを指定
    let cymbalsPath = Bundle.main.bundleURL.appendingPathComponent("「なんだこのおっさん」.mp3")
    
    //シンバル用のプレンヤーインスタンスの作成
    var cymbalsPlayer = AVAudioPlayer()
    
    @IBAction func cymbals(_ sender: Any) {
        do {
        cymbalsPlayer = try AVAudioPlayer(contentsOf: cymbalsPath, fileTypeHint: nil)
        cymbalsPlayer.play()
        } catch {
            print("シンバルでエラーが発生した")
        }
    }
    
    //ドラム用の音源ファイルを指定
    let drumPath = Bundle.main.bundleURL.appendingPathComponent("「先生がビンビンでいらっしゃる」.mp3")
    
    //ドラム用のプレンヤーインスタンスの作成
    var drumPlayer = AVAudioPlayer()
    
    @IBAction func drum(_ sender: Any) {
        do {
            drumPlayer = try AVAudioPlayer(contentsOf: drumPath, fileTypeHint: nil)
            drumPlayer.play()
        } catch {
            print("ドラムでエラーが発生した")
        }
    }
    //バックミュージックの音源モジュールを指定
    let backgroundmusicPath =
        Bundle.main.bundleURL.appendingPathComponent("backgroundmusic.mp3")
    
    var backmusicPlayer = AVAudioPlayer()
    
    @IBAction func backmusic(_ sender: Any) {
        do {
            backmusicPlayer = try AVAudioPlayer(contentsOf: backgroundmusicPath, fileTypeHint: nil)
            backmusicPlayer.numberOfLoops = -1
            backmusicPlayer.play()
        } catch {
            print("エラーが発生した")
        }
        
    }
    //stopが押された時の処理
    @IBAction func stop(_ sender: Any) {
        //バックミュージック停止
        backmusicPlayer.stop()
        
    }
    fileprivate func SoundPlayer(player:inout AVAudioPlayer, path: URL, count: Int){
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("共通再生処理でエラーが発生しました")
        }
    }
    
}

