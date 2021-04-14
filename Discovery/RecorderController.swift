//
//  ViewController.swift
//  Discovery
//
//  Created by Steven C on 4/10/21.
//

import UIKit

class RecorderController: UIViewController {
    var recordButton = RecordButton()
    var handleView = UIView()
    var timeLabel = UILabel()
    var prompt = UILabel()
    //var audioView = AudioVisualizerView()
    
    
    @objc func handleRecording(_ sender: RecordButton) {
            var defaultFrame: CGRect = CGRect(x: 0, y: 24, width: view.frame.width, height: 135)
            if recordButton.isRecording {
                defaultFrame = self.view.frame
                //audioView.isHidden = false
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    //self.handleView.alpha = 1
                    //self.timeLabel.alpha = 1
                    //self.audioView.alpha = 1
                    //self.view.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.bounds.width, height: -300)
                    //self.view.layoutIfNeeded()
                }, completion: nil)
                //self.checkPermissionAndRecord()
            } else {
               // audioView.isHidden = true
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    //self.handleView.alpha = 0
                    //self.timeLabel.alpha = 0
                    //self.audioView.alpha = 0
                    //self.view.frame = defaultFrame
                    //self.view.layoutIfNeeded()
                }, completion: nil)
                //self.stopRecording()
            }
        }
    
    fileprivate func setupRecordingButton() {
        recordButton.isRecording = false
        recordButton.addTarget(self, action: #selector(handleRecording(_:)), for: .touchUpInside)
        view.addSubview(recordButton)
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = NSLayoutConstraint(item: recordButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: recordButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])
        recordButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        recordButton.heightAnchor.constraint(equalToConstant: 65 ).isActive = true
    }
    
    fileprivate func initPrompt() {
        view.addSubview(prompt)
        prompt.text = "Tell us how you are feeling :)"
        prompt.textAlignment = .center
        
        prompt.frame = CGRect(x: 100, y: 200, width: self.view.bounds.width,height:200)
        prompt.center.x = self.view.center.x
        //prompt.adjustsFontSizeToFitWidth = true
        prompt.lineBreakMode = NSLineBreakMode.byCharWrapping
    }
    
    fileprivate func initPage() {
        initPrompt()
        setupRecordingButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPage()
        // Do any additional setup after loading the view.
    }


}

