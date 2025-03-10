//
//  ViewController.swift
//  LineBreakMode
//
//  Created by hoonkichae on 3/10/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rootView = RootView()
        rootView.frame = self.view.bounds
        self.view.addSubview(rootView)
    }


}

