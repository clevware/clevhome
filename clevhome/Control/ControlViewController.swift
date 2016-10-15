//
//  ControlController.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import UIKit
import AVFoundation
class ControlViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var audioRecorder:AVAudioRecorder!
    var audioPlayer:AVAudioPlayer!
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func getRecordingSetting()->[String : Any]{
        return [AVSampleRateKey : NSNumber(value: Float(44100.0)),//声音采样率
            AVFormatIDKey : NSNumber(value: Int32(kAudioFormatMPEG4AAC)),//编码格式
            AVNumberOfChannelsKey : NSNumber(value: 1),//采集音轨
            AVEncoderAudioQualityKey : NSNumber(value: Int32(AVAudioQuality.high.rawValue))]
    }
    @IBAction func takePhoto(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            //self?.alertCanNotOpenCamera()
            alertMessage(title: "错误", msg: "摄像头无法启用")
            return
        }
        let imagePicker = UIImagePickerController()
        //设置代理
        imagePicker.delegate = self
        //允许编辑
        imagePicker.allowsEditing=false
        //设置图片源
        imagePicker.sourceType = .camera
        //模态弹出IamgePickerView
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let editedImg: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//            let sizeChange = CGSize(width: 120,height: 90)
//            UIGraphicsBeginImageContextWithOptions(sizeChange, false, 0.0)
            
            // 修改图片长和宽
            
            //editedImg?.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
            
            // 生成新图片
            
            //imageDate = UIGraphicsGetImageFromCurrentImageContext()
            
            // 关闭图片编辑模式
            
            //UIGraphicsEndImageContext()
        ServiceProxy.uploadImage(img: UIImageJPEGRepresentation(editedImg, 0.1)!){}
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func startRecord(_ sender: UIButton){
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioRecorder = AVAudioRecorder(url: createDirectoryURL()!,
                                                settings: getRecordingSetting())//初始化实例
            audioRecorder.prepareToRecord()//准备录音
        } catch {
            
        }
        if !audioRecorder.isRecording {//判断是否正在录音状态
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setActive(true)
                audioRecorder.record()
                print("record!")
            } catch {
                
            }
        }
    }
    
    @IBAction func finishRecord(_ sender: UIButton) {
        let audioSession = AVAudioSession.sharedInstance()
        if audioRecorder.isRecording {
            do {
                audioRecorder.stop()
                try audioSession.setActive(false)
                print("stop!!")
            } catch {
                
            }
        }
    }
    
    @IBAction func play(_ sender: UIButton) {
        if (!audioRecorder.isRecording){
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: audioRecorder.url)
                audioPlayer.play()
                audioPlayer.volume = 100
                print("play!!")
            } catch {
                
            }
        }
    }

    
    func createDirectoryURL() -> URL? {
        //根据时间设置存储文件名
        let currentDateTime = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyyHHmmss"
        let recordingName = formatter.string(from: currentDateTime as Date)+".caf"
        print(recordingName)
        
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = urls[0] as URL
        let soundURL = documentDirectory.appendingPathComponent(recordingName)//将音频文件名称追加在可用路径上形成音频文件的保存路径
        return soundURL
    }
}
