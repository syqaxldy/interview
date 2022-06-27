//
//  ViewController.swift
//  Test-Time
//
//  Created by syqaxldy on 2022/6/27.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    lazy var label : UILabel = {
       let frame = CGRect(x: 30, y: 120, width: 240, height: 30)
       let lab = UILabel(frame: frame)
       lab.textColor = .red
       lab.textAlignment = .center
       lab.font = .systemFont(ofSize: 20)
       lab.text = ""
       return lab
   } ()
    lazy var textField : UITextField = {
       let tf = UITextField(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        tf.backgroundColor = .white
        tf.delegate = self
        tf.borderStyle = .bezel
        let toutiaoAtt = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        tf.attributedPlaceholder = NSAttributedString.init(string: "请输入时间段", attributes: toutiaoAtt)
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .black
        tf.keyboardType = .numberPad
        return tf
    }()
   
    lazy var button : UIButton = {
       let btn = UIButton(frame: CGRect(x: 50, y: 300, width: 100, height: 50))
        btn.setTitle("查询", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(lookAction), for: .touchUpInside)
        return btn
    } ()
    @objc func lookAction() {
        if textField.text!.count > 2 {
            label.text = "输入长度不能超过两位"
            return
        }
        let time = Int(textField.text ?? "0") ?? 0
        if time > 24 {
            label.text = "输入数字不能大于24"
            return
        }
        print(textField.text?.count as Any)
         label.text = GetTime.shared.getTimeStr(time: time)
    }
   

}
extension ViewController {
    private func setupUI() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
    }
}
