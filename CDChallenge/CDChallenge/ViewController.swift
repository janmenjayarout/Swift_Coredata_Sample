//
//  ViewController.swift
//  CDChallenge
//
//  Created by Jan on 10/26/16.
//  Copyright © 2016 Jan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var textFiels: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var isImp: UISwitch!

    var isRowTapped :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func buttonTabbed(sender: AnyObject) {
        //      let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let context =  (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("Task",
            inManagedObjectContext:context)
        
        let task = Task(entity: entity!,
            insertIntoManagedObjectContext: context)

        task.name = textFiels.text
        task.age = firstTextField.text
        task.amount = secondTextField.text
        task.isImportant = isImp.on
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
        
        print("Data saved successfully")
        
        let displayVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("listVC")
        self.navigationController?.pushViewController(displayVC, animated: true)
        //        self.navigationController!.popViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

