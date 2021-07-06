// Sam Trenter
//  ViewController.swift
//  ASN4
//
//  Created by CompSci 4220 Student on 7/5/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnChangeColor: UIButton!
    @IBOutlet weak var viewChangeColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changeColor(_ sender: Any) {
        if viewChangeColor.backgroundColor == UIColor.gray{
            viewChangeColor.backgroundColor = UIColor.yellow
        }else if viewChangeColor.backgroundColor == UIColor.yellow{
            viewChangeColor.backgroundColor = UIColor.gray
        }else{
            viewChangeColor.backgroundColor = UIColor.yellow
        }
    }
    
}

