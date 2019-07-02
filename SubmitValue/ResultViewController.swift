//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by YUNA KO on 02/07/2019.
//  Copyright © 2019 YUNAKO. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController {
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    //email값을 받을 변수
    var paramEmail : String = ""
    
    //update 값을 받을 변수
    var paramUpdate : Bool = false
    
    //interval 값을 받을 변수
    var paramInterval : Double = 0
    
    
    override func viewDidLoad(){
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated:true)
    }
    
}
