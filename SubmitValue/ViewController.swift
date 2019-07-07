//
//  ViewController.swift
//  SubmitValue
//
//  Created by YUNA KO on 02/07/2019.
//  Copyright © 2019 YUNAKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBAction func onSwitch(_ sender: UISwitch) {
        if(sender.isOn == true){
            self.isUpdateText.text = "갱신함"
        }else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBOutlet var interval: UIStepper!
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    @IBAction func onSubmit(_ sender: Any) {
        //VC2 의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        //값을 전달하는 과정 작성
        //값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        //화면이동.프레젠테이션 방식 button을 이용할경우
        //self.present(rvc, animated: true)
        //네비게이션바 버튼을 이용한 화면 이동
    self.navigationController?.pushViewController(rvc,animated:true)
        
    }
    
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
        NSLog("onperformsegue execute")
        //세그방식의 값전달은 prepare메소드를 이용
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        
        //목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else{
            return
        }
        //값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}

