//
//  ViewController.swift
//  Ausgabe
//
//  Created by Alessio Tosi on 03.10.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var vm = ausgabeVW.sharedInstance
    
    var data : [Task] = [
        Task(name: "Task 1", time: Date()),
        Task(name: "Task 2", time: Date())
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.data.removeAll()
        vm.loadTasks {
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = vm.tasks[indexPath.row]
        cell.textLabel?.text = data.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        let timeSting = dateFormatter.string(from: data.time)
        cell.detailTextLabel?.text = timeSting
        return cell
    }
}

