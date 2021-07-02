//
//  ViewController.swift
//  ASN2
//
//  Created by CompSci 4220 Student on 6/24/21.
//
//Single view app wasn't an option but I assume this will work.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Who: UILabel!
    @IBOutlet weak var What: UILabel!
    @IBOutlet weak var When: UILabel!
    @IBOutlet weak var Where: UILabel!
    @IBOutlet weak var Why: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //who
        Who.text =  "Sam"
        //what
        What.text = "Mac Development"
        //when
        When.text = "Computer Time"
        //where
        Where.text = "STL"
        //why
        Why.text = "Because I could"
    }


}

