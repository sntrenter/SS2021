//  Sam Trenter
//  ViewController.swift
//  ASN7
//
//  Created by CompSci 4220 Student on 7/30/21.
//

import UIKit

class ViewController: UIViewController {

    let txtLabel = UILabel(frame: CGRect(x: 12, y: 100, width: 100, height: 40))
    let entryTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
        //let txtLabel = UILabel(frame: CGRect(x: 12, y: 100, width: self.view.frame.size.width - 12*2, height: 40))
        txtLabel.frame = CGRect(x: 0, y: self.view.frame.height * 0.25, width: self.view.frame.size.width - 12*2, height: 40)
        txtLabel.textColor = UIColor.black
        txtLabel.text = "You should type something"
        txtLabel.numberOfLines = 0
        txtLabel.textAlignment = NSTextAlignment.center
        
        //let entryTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        entryTextField.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30)
        entryTextField.center = self.view.center
        entryTextField.textAlignment = NSTextAlignment.center
        entryTextField.placeholder = "Enter some text here!"
        entryTextField.borderStyle = UITextField.BorderStyle.line
        entryTextField.backgroundColor = UIColor.white
        
        view.addSubview(entryTextField)
        view.addSubview(txtLabel)
        
        entryTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        self.view.backgroundColor = #colorLiteral(red: 0.8356565237, green: 0.9769138694, blue: 0.9861723781, alpha: 1)
    }


}

extension ViewController: UITextFieldDelegate{
    @objc func textFieldDidChange(_ textField: UITextField){
        //print(txtLabel.text!)
        //print(textField.text!)
        txtLabel.text = String(textField.text!.reversed())
        
    }
}
