//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Jon Friskics on 11/20/14.
//  Copyright (c) 2014 Code School. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate {
    func saveNote(controller:AddNoteViewController,noteText:String)
    func dismissAddViewController(controller:AddNoteViewController)
}

class AddNoteViewController: UIViewController, UITextFieldDelegate {

    var delegate:AddNoteViewControllerDelegate?
    @IBOutlet var noteField:UITextField?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelPressed(sender: AnyObject?) -> Void {
        delegate?.dismissAddViewController(self)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        delegate?.saveNote(self, noteText: textField.text)
        
        return true
    }

}
