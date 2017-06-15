//
//  PrefsViewController.swift
//  Egg Timer
//
//  Created by Big J on 6/14/17.
//  Copyright © 2017 AndersonCoding. All rights reserved.
//

import Cocoa

class PrefsViewController: NSViewController {

    @IBOutlet weak var customTextField: NSTextField!
    @IBOutlet weak var customSlider: NSSlider!
    @IBOutlet weak var presetsPopUp: NSPopUpButton!
    var prefs = Preferences()

    override func viewDidLoad() {
        super.viewDidLoad()
        showExistingPrefs()

    }

   
    @IBAction func okButtonClicked(_ sender: NSButton) {
        saveNewPrefs()
        view.window?.close()
    }
    @IBAction func cancelButtonClicked(_ sender: NSButton) {
        view.window?.close()
    }
    @IBAction func sliderValueChanged(_ sender: NSSlider) {
        showSliderValueAsText()
    }
    @IBAction func popUpValueChanged(_ sender: NSPopUpButton) {
        if sender.selectedItem?.title == "Custom" {
            customSlider.isEnabled = true
            return
        }

        let newTimerDuration = sender.selectedTag()
        customSlider.integerValue = newTimerDuration
        showSliderValueAsText()
        customSlider.isEnabled = false
    }
    func saveNewPrefs() {
        prefs.selectedTime = customSlider.doubleValue * 60
        NotificationCenter.default.post(name: Notification.Name(rawValue: "PrefsChanged"),
                                        object: nil)
    }
    func showExistingPrefs() {
        // 1
        let selectedTimeInMinutes = Int(prefs.selectedTime) / 60

        // 2
        presetsPopUp.selectItem(withTitle: "Custom")
        customSlider.isEnabled = true

        // 3
        for item in presetsPopUp.itemArray {
            if item.tag == selectedTimeInMinutes {
                presetsPopUp.select(item)
                customSlider.isEnabled = false
                break
            }
        }

        // 4
        customSlider.integerValue = selectedTimeInMinutes
        showSliderValueAsText()
    }

    // 5
    func showSliderValueAsText() {
        let newTimerDuration = customSlider.integerValue
        let minutesDescription = (newTimerDuration == 1) ? "minute" : "minutes"
        customTextField.stringValue = "\(newTimerDuration) \(minutesDescription)"
    }
}
