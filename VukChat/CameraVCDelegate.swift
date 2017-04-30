//
//  CameraVCDelegate.swift
//  VukChat
//
//  Created by Vuk on 4/23/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import Foundation

protocol CameraVCDelegate {
    func shouldEnableCameraUI(enabled: Bool)
    func shouldEnableRecordUI(enabled: Bool)
    func canStartRecording()
    func recordingHasStarted()
    func shouldEnablePhotoButton(enabled: Bool)
    func shouldEnabledCaptureModeControl(enabled: Bool)
    func chosenSegmentedControlIndex() -> Int
    func livePhotoModeButtonHidden(hidden: Bool)
    func shouldEnableLivePhotoModeButton(enabled: Bool)
    func livePhotoModeStarted()
    func livePhotoModeFinished()

}
