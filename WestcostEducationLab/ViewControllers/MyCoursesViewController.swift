//
//  MyCoursesViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-19.
//

import Foundation

import UIKit
import CoreData

class MyCoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var myCourses: [UserCourseModel] = [UserCourseModel]()
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Mark: Autorefresh
    override func viewDidAppear(_ animated: Bool) {
        setupCoursesList()
    }
    
    //MARK: Setup list of courses from CoreData
    func setupCoursesList(){

        myCourses.removeAll()
        for kurser in LoginViewController.currentUser.courses ?? [] {

            let currentUserCourses = UserCourseModel(title: (kurser as AnyObject).title ?? "",
                                                     label: (kurser as AnyObject).subtitle ?? "",
                                                     status: .Bought)
            
            if currentUserCourses.status == .Bought{
                myCourses.append(currentUserCourses)
            }
            tableView.reloadData()
        }
    }
    
    //MARK: Setup table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = myCourses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCoursesTableViewCell") as! CoursesTableViewCell
        cell.setItem(item: course)
        
        return cell
    }
    
    //MARK: Move to next page with information
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = myCourses[indexPath.row]
        let itemTuple = (indexPath.row, item)
        
        performSegue(withIdentifier: "showMyCoursesDetails", sender: itemTuple)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showMyCoursesDetails" {

            guard let vc = segue.destination as? CoursesDetailViewController else { return }
            guard let item = sender as? (Int, UserCourseModel) else { return }

            vc.item = item.1
            vc.itemIndex = item.0
        }
    }
}
