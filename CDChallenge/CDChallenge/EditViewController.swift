//
//  EditViewController.swift
//  CDChallenge
//
//  Created by Andolasoft on 10/27/16.
//  Copyright © 2016 Jan. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var isImportant: UILabel!
    
    var taskPassed : Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if (taskPassed != nil)
        {
            lblName.text    = taskPassed?.name;
            lblAge.text     = taskPassed?.age;
            lblAmount.text  = taskPassed?.amount;
            isImportant.text = taskPassed?.isImportant?.stringValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
