//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Jon Friskics on 11/21/14.
//  Copyright (c) 2014 Code School. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate {
    func saveNote(controller: AddNoteViewController, noteText: String)
}

class AddNoteViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ourTextField: UITextField?
    var delegate: AddNoteViewControllerDelegate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        println("Text value entered is: \(textField.text)")
        
        delegate?.saveNote(self, noteText: textField.text)
        
        return true
    }
    
    @IBAction func closeAddNote(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
