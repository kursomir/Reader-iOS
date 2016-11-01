//
//  WelcomeViewController.swift
//  kursoreader
//
//  Created by Igor Feshchun on 19.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import RealmSwift


class WelcomeViewController: UIViewController, WelcomeViewDelegate {
    //MARK: Properties
    private let realm = try! Realm()
    private(set) var welcomeView: WelcomeView!

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeView = self.view as! WelcomeView
        welcomeView.delegate = self
        
    }

    //MARK: WelcomeViewDelegate
    func didTapButton(sender: AnyObject) {
        print("asd")
        try! self.realm.write {
            
            let welcome = WelcomeModel()
            welcome.isFirstTime = false
            self.realm.add(welcome, update: true)
            
        }
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.checkFirstLaunch()
        }
    }

}
