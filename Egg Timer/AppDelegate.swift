//
//  AppDelegate.swift
//  Egg Timer
//
//  Created by Big J on 6/14/17.
//  Copyright © 2017 AndersonCoding. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    @IBOutlet weak var resetTimerMenuItem: NSMenuItem!
    @IBOutlet weak var stopTimerMenuItem: NSMenuItem!
    @IBOutlet weak var startTimerMenuItem: NSMenuItem!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        enableMenus(start: true, stop: false, reset: false)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    func enableMenus(start: Bool, stop: Bool, reset: Bool) {
        startTimerMenuItem.isEnabled = start
        stopTimerMenuItem.isEnabled = stop
        resetTimerMenuItem.isEnabled = reset
    }


}

