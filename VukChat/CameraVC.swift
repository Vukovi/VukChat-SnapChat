//
//  ViewController.swift
//  VukChat
//
//  Created by Vuk on 4/23/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController, CameraVCDelegate {

    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var changeCamerBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    
    override func viewDidLoad() {
        
        cameraVCDelegate = self
        
        self._previewView = previewView //ovo mora da ide iznad super.viewDidLoad() jer mora da se desi pre ucitavnaja viewDidLoad-a superklase tj CameraViewControllera
        super.viewDidLoad()
        
        
    }

    @IBAction func recordBtnPressed(_ sender: UIButton) {
        print("VUČE EVO ME")
        toggleCaptureMode()
        toggleMovieRecording()
    }
    
    func shouldEnableRecordUI(enabled: Bool) {
        //toggleCaptureMode()
        recordBtn.isEnabled = true
        print("Snimanje je \(enabled)")
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: UIButton) {
        changeCamera()
    }

    func shouldEnableCameraUI(enabled: Bool) {
        changeCamerBtn.isEnabled = enabled
        print("Promena kamere je \(enabled)")
    }
    
    
    
    func canStartRecording() {
        print("Snimanje moze da pocne")
    }
    
    func recordingHasStarted() {
        print("Snimanje je pocelo")
    }
    
    func shouldEnablePhotoButton(enabled: Bool) {
        //
    }
    
    func shouldEnabledCaptureModeControl(enabled: Bool) {
        //
    }
    
    func chosenSegmentedControlIndex() -> Int {
        return 1
    }
    
    func shouldEnableLivePhotoModeButton(enabled: Bool) {
        //
    }
    
    func livePhotoModeButtonHidden(hidden: Bool) {
        //
    }
    
    func livePhotoModeStarted() {
        //
    }
    
    func livePhotoModeFinished() {
        //
    }
}

