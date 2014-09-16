//
//  ViewController.swift
//  Lecture2
//
//  Created by Кирилл on 05.09.14.
//  Copyright (c) 2014 kirillsidorov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource {
    
    var lectureList:NSArray?{
        didSet {
            self.tableView.reloadData();
        }
    }
    
    // MARK: - UIViewController methods
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //if (!user.isLogedIn) {

        
        //Вызов presentViewController пораждает варнинг "Unbalanced calls to begin/end appearance transitions", как прочитал это нужно делать во viewDidAppear
        //}
        
        loadDataFromServer()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as DetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow() {
            
            if let _list:NSArray = lectureList {
                let _lectureItem = _list[indexPath.row] as Lecture
                detailViewController.detailInfo = _lectureItem
            }
            
        }
        
    }
    
    // MARK: - UITableView Delegates
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("LectureRow", forIndexPath: indexPath) as UITableViewCell
        
        if let _list:NSArray = lectureList {
            let _lectureItem = _list[indexPath.row] as Lecture;
            cell.textLabel?.text = _lectureItem.name
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _list:NSArray = lectureList {
            return _list.count
        }
        
        return 0
    }
    
    
    // MARK: - Internal Logic
    
    func checkUserForAuth() {
        
    }
    
    func showLoginController() {
        let loginController: UIViewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateInitialViewController() as UIViewController
        
        
        navigationController!.presentViewController(loginController, animated: false, completion: nil)
    }
    
    func loadDataFromServer () {
        
        
        WeeklyAPI.sharedInstance.getAllLectures { (Lectures) -> () in
            println(Lectures)
            
            self.lectureList = Lectures as? NSArray
            self.tableView.reloadData()
        }
        
    
    }


}

