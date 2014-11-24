//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Jon Friskics on 11/21/14.
//  Copyright (c) 2014 Code School. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ourTextField: UITextField?
    
    required init(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("Text value entered is: \(textField.text)")
        
        return true
    }
    
    @IBAction func closeAddNote(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
