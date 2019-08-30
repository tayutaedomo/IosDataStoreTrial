//
//  FirstViewController.swift
//  DataStoreTrial
//
//  Created by tayutaedomo on 2019/08/30.
//  Copyright © 2019 tayutaedomo.net. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet weak var text_view: UITextView!


    // MARK: - UIViewCpontroller

    override func viewDidLoad() {
        super.viewDidLoad()

        let _: MemoryManager = MemoryManager()
        print("Task count: \(MemoryManager.tasks.count)")

        let text = String.init(describing: MemoryManager.tasks)
        text_view.text = text
    }

}
