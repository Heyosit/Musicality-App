//
//  UserDefaultsExtention.swift
//  The Haptic Game - Runner
//
//  Created by Alessio Perrotti on 27/11/2018.
//  Copyright © 2018 Alessio Perrotti. All rights reserved.
//
import Foundation

extension UserDefaults {
    
    private struct Keys {
        
        // MARK: - Constants
        static let difficulty = "difficulty"
        static let highScores = "highScores"
        static let isTutorialAlreadyPlayed = "isTutorialAlreadyPlayed"
    }
    
    class var difficulty: Difficulty {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.difficulty)
        return Difficulty(rawValue: storedValue) ?? Difficulty.normal
    }
    
    class func set(difficulty: Difficulty) {
        UserDefaults.standard.set(difficulty.rawValue, forKey: UserDefaults.Keys.difficulty)
    }
    
    class var highScore: Int {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.highScores + "\(difficulty)") as Int?
        return storedValue ?? 0
    }
    
    class func set(highScore: Int) {
        UserDefaults.standard.set(highScore, forKey: UserDefaults.Keys.highScores + "\(difficulty)")
    }
    
    class var isTutorialAlreadyPlayed: Bool {
        let storedValue = UserDefaults.standard.bool(forKey: UserDefaults.Keys.isTutorialAlreadyPlayed) as Bool?
        debugPrint("valore di Tutorial salvato è ", storedValue as Any)
        return storedValue ?? false
    }
    
    class func set(isTutorialAlreadyPlayed: Bool) {
        UserDefaults.standard.set(isTutorialAlreadyPlayed, forKey: UserDefaults.Keys.isTutorialAlreadyPlayed)
    }
}

