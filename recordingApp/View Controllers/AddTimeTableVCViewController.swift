
//
//  AddTimeTableVCViewController.swift
//  recordingApp
//
//  Created by 조예진 on 06/05/2019.
//  Copyright © 2019 조예진. All rights reserved.
//

import UIKit

class AddTimeTableVCViewController: UIViewController {

  @IBOutlet weak var registerButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func returnBtnClicked(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
    }
}
