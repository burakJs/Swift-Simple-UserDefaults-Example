//
//  ViewController.swift
//  UserDefaultsProjesi
//
//  Created by Burak İmdat on 8.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get note and time data from UserDefaults
        let note = UserDefaults.standard.object(forKey: "note")
        let time = UserDefaults.standard.object(forKey: "time")
        
        // Write these datas to label and check that is string or not
        if let noteString = note as? String , let timeString = time as? String{
            noteLabel.text = "Yapılacak iş : \(noteString)"
            timeLabel.text = "Yapılacak zaman : \(timeString)"
        }
       
    }

    @IBAction func saveNote(_ sender: Any) {
        
        // Save data to UserDefaults
        UserDefaults.standard.set(noteTextField.text, forKey: "note")
        UserDefaults.standard.set(timeTextField.text, forKey: "time")
        
        noteLabel.text = "Yapılacak iş : \(noteTextField.text ?? " ")"
        timeLabel.text = "Yapılacak zaman : \(timeTextField.text ?? " ")"
    }
    
    @IBAction func deleteNote(_ sender: Any) {
        
        // Get note and time data from UserDefaults
        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedTime = UserDefaults.standard.object(forKey: "time")
        
        // Check data is String or not
        if (savedNote as? String) != nil && (savedTime as? String) != nil {
            
            UserDefaults.standard.removeObject(forKey: "note")
            UserDefaults.standard.removeObject(forKey: "time")
            
            noteLabel.text = "Yapılacak iş : "
            timeLabel.text = "Yapılacak zaman : "
        }else{
            // If data is nil, Alert will be presented
            let alert = UIAlertController.init(title: "HATA!", message: "Zaten silinmiş", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction.init(title: "Tamam", style: UIAlertAction.Style.destructive, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

