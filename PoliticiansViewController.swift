//
//  PoliticiansViewController.swift
//  Politicians
//
//  Created by Forrest Filler on 7/13/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

// add to the api so I can render a list of the politicians' images in the tableview....

import UIKit
import Alamofire

class PoliticiansViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var politiciansTable: UITableView!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .redColor()

        
        self.politiciansTable = UITableView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.politiciansTable.delegate = self
        self.politiciansTable.dataSource = self
        politiciansTable.backgroundColor = .whiteColor()
        view.addSubview(self.politiciansTable)
        self.view = view
        
        
    }
    
    func firstAPIRequest(polInfo: String){
        let url = "https://ff-politicians.herokuapp.com/api/politician"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                print("api did call: \(json)")
            }
        
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstAPIRequest("")
        // needed to add the self here in order to acuate the print command.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
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
