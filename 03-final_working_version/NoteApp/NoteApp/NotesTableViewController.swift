//
//  NotesTableViewController.swift
//  NoteApp
//
//  Created by Jon Friskics on 11/20/14.
//  Copyright (c) 2014 Code School. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, AddNoteViewControllerDelegate {

    var notes:NSArray
    var session:NSURLSession
    
    required init(coder aDecoder: NSCoder) {
        notes = []
        session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loadNotes()
    }
    
    func loadNotes() -> Void {
        let requestURL = NSMutableURLRequest(URL: NSURL(string: "http://localhost:8080/notes")!)
        let getNotesTask = session.dataTaskWithRequest(requestURL, completionHandler: { (data, response, error) -> Void in
            
            var readJSONError:NSError?
            let noteTextJSONData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &readJSONError) as NSArray
            
            if let err = readJSONError {
                println(err.localizedDescription)
            } else {
                let mutableArray = NSMutableArray()
                for note in noteTextJSONData {
                    mutableArray.addObject(note["name"] as NSString)
                }
                self.notes = mutableArray.copy() as NSArray
            }
            
            self.tableView.reloadData()
            println(response)
        })
        getNotesTask.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = notes[indexPath.row] as NSString

        return cell
    }
    
    func saveNote(controller: AddNoteViewController, noteText: String) -> Void {
        println("This is the text that was entered in AddNoteViewController: \(noteText)")
        
        dismissViewControllerAnimated(true, completion: nil)
        
        var mutableNotes:NSMutableArray = NSMutableArray(array: notes)
        mutableNotes.addObject(noteText)
        notes = NSArray(array: mutableNotes)

        tableView.reloadData()
        
        let noteTextDictionary:NSDictionary = NSDictionary(object: noteText, forKey: "name")
        
        var writeJSONError:NSError?
        let noteTextJSONData = NSJSONSerialization.dataWithJSONObject(noteTextDictionary, options: NSJSONWritingOptions.PrettyPrinted, error: &writeJSONError)
        
        if let err = writeJSONError {
            println(err.localizedDescription)
        } else {
            let requestURL = NSMutableURLRequest(URL: NSURL(string: "http://localhost:8080/notes/")!)
            requestURL.HTTPMethod = "POST"
            requestURL.HTTPBody = noteTextJSONData
            requestURL.setValue("application/json", forHTTPHeaderField: "Content-type")
            
            let saveNoteTask = session.dataTaskWithRequest(requestURL, completionHandler: { (data, response, error) -> Void in
                
                println(response)
            })
            saveNoteTask.resume()
        }
    }

    func dismissAddViewController(controller: AddNoteViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "AddNoteSegue") {
            let addNoteViewController = segue.destinationViewController as AddNoteViewController
            addNoteViewController.delegate = self
        }
    }

}
