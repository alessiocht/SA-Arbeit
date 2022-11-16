//
//  SoViewController.swift
//  Ausgabe
//
//  Created by Alessio Tosi on 06.10.22.
//

import UIKit

class SoViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func SichernButton(_ sender: Any){
        
        print("Eingabe wird gesichert...")
        let task = Task(name: taskName.text ?? "" , time: datePicker.date)
        
        let vm = ausgabeVW.sharedInstance
        vm.addTask(task: task){
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
