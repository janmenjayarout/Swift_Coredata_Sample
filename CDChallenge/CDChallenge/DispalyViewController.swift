//
//  DispalyViewController.swift
//  CDChallenge
//
//  Created by ceffectz-d6 on 10/25/16.
//  Copyright © 2016 ceffectz. All rights reserved.
//

import UIKit
import CoreData

class DispalyViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var tasks : [Task] = []
    var isRowSelected :Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        loadData()
        self.tableview.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadData(){
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        
        let fetchRequest = NSFetchRequest(entityName:"Task")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            tasks = results as! [Task]
            
            print("task : \(tasks)");
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count is : \(tasks.count)")
        return tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell ()
        print("table view loaded")
        let task:Task = tasks[indexPath.row]
        if (task.isImportant != nil){
        cell.textLabel?.text = "😌 \(task.name!)"
        }else{
        cell.textLabel?.text = task.name
        }
        return cell
        
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
//        performSegue(withIdentifier: "ShowNxtVC", sender: nil)
        //isRowSelected = true
        
        let task:Task = tasks[indexPath.row]

        let displayVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("EditVC") as! EditViewController
        displayVC.taskPassed = task;
        self.navigationController?.pushViewController(displayVC, animated: true)

    }
}
