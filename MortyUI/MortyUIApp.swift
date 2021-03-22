//
//  MortyUIApp.swift
//  MortyUI
//
//  Created by Thomas Ricouard on 18/12/2020.
//

import SwiftUI
import UIKit
import Trace
import Firebase
import Bugsnag
import Sentry
@main
struct MortyUIApp: App {
    
    // MARK: - Property
    
    let applicationSupport: String = {
        let root = NSSearchPathForDirectoriesInDomains(
            .applicationSupportDirectory,
            .userDomainMask, true
        )[0]
        
        print(root)
        
        return root
    }()
    
    
    // MARK: - Init
    
    init() {
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        FirebaseApp.configure()
        
        Bugsnag.start()
        
        SentrySDK.start { options in
            options.dsn = "https://cba07fbf1fc941138b6df9d9d979fd72@o339133.ingest.sentry.io/5687550"
            options.debug = true // Enabled debug when first installing is always helpful
        }
    }
    
    // MARK: - Scene
    
    var body: some Scene {
        WindowGroup {
            TabbarView()
        }
    }
}
